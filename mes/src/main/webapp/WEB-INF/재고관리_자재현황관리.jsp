<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.MaterialStatusDTO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/mes/CSS/button.css">
<link rel="stylesheet" href="/mes/CSS/calender.css">
<link rel="stylesheet" href="/mes/CSS/common.css">
<link rel="stylesheet" href="/mes/CSS/display.css">
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<link rel="stylesheet" href="/mes/CSS/sidebar.css">
<link rel="stylesheet" href="/mes/CSS/table.css">
<link rel="stylesheet" href="/mes/CSS/topbar.css">
<link rel="stylesheet" href="/mes/CSS/게시판.css">
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<style>
table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2;
}

.pagination {
	display: flex;
	justify-content: center;
	margin: 20px 0;
}

.pagination a {
	margin: 0 5px;
	padding: 8px 16px;
	text-decoration: none;
	border: 1px solid #ddd;
	color: #333;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0,0.4);
    padding-top: 60px;
}

.modal-content {
    background-color: #fefefe;
    margin: 5% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
</style>
<script src="/mes/JavaScript/load_info.js"></script>
<title>소원을 들어주는 MES</title>
</head>

<body>
	<!-- 104번부터 127번줄 까지는 추가 버튼 눌렀을 때 나오는 모달 창 -->
	<div id="addRowModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>추가할 자재 정보 입력</h2>
			<form id="addRowForm">
				<label for="prodNum">자재번호:</label> <input type="text" id="prodNum" name="prodnum" required><br> 
				<label for="LOTNum">LOT번호:</label> <input type="text" id="lotnum" name="lotnum" required><br>
				<label for="prodName">자재이름:</label> <input type="text" id="prodName" name="prodname" required><br> 
				<label for="count">규격:</label> <input type="text" id="spec" name="spec" required><br> 
				<label for="loc">저장위치:</label> <input type="text" id="loc" name="loc" required><br> 
				
				<button type="button" onclick="submitAddRowForm()">추가</button>
			</form>
		</div>
	</div>
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
	<!-- 	상단바 -->
	<jsp:include page="/WEB-INF/assetsform/topbar.jsp" />
	<!-- 메인메뉴 아레 정보가 표시될 영역 -->
	<div class="searchID">

			<!-- 해당 페이지의 제목 -->
			<h1>자재현황관리</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>상품의 재고를 기준에 따라 조회하고 정렬해서 관리하는 페이지</span> <br>
            </div>
			<!-- 게시물의 개수를 표시할 select -->
		</div>

		<!-- 해당 목록 -->
		<div class="tableID">
			<label for="rowsPerPage">정렬 갯수 : </label> <select id="rowsPerPage"><!-- 테이블에 표시될 행의 갯수 기본값은 10개 -->
				<option value="5">5</option>
				<option value="10" selected>10</option>
				<option value="15">15</option>
				<option value="20">20</option>
			</select>

			<button onclick="addRow()">추가</button>
			<button id="deleteSelected">체크 된 줄 삭제</button>

			<br> <br> <label for="startDate">Start Date:</label> <input
				type="date" id="startDate"> <label for="endDate">End
				Date:</label> <input type="date" id="endDate"> <br>
			<button id="filterByDateAndStatus">검색</button>
			<button id="resetFilters">필터 해제</button>

			<table id="dataTable">
				<thead>
					<tr>
						<th><input type="checkbox" id="selectAll"></th>
						<th>자재번호</th>
						<th>Lot번호</th>
						<th>자재이름</th>
						<th>수량(EA)</th>
						<th>규격(mm)</th>
						<th>위치</th>
						<th>최신화날짜</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<%
					List<MaterialStatusDTO> list = (List<MaterialStatusDTO>) request.getAttribute("list");
					
					
					// 데이터 삽입
					for (int j = 0; j < list.size(); j++) {
						String prodnum = list.get(j).getProdnum();
						String lotnum = list.get(j).getLotnum();
						String prodname = list.get(j).getProdname();
						int tquantity = list.get(j).getTquantity();
						String spec = list.get(j).getSpec();
						String storage_loc = list.get(j).getStorage_loc();
						Date date = list.get(j).getEditdate();
						
					%>
					<tr>
						<td><input type="checkbox" class="rowCheckbox"></td>
						<td><%=prodnum%></td>
						<td><%=lotnum%></td>
						<td><%=prodname%></td>
						<td><%=tquantity%></td>
						<td><%=spec%></td>
						<td><%=storage_loc%></td>
						<td><%=date%></td>
						<td><button onclick='editRow("<%=prodnum%>")'>수정</button></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<div class="pagination" id="pagination">
				<!-- 페이지네이션 링크가 여기에 동적으로 추가됩니다 -->
			</div>



		</div>
		<script>
        let rowsPerPage = parseInt(document.getElementById("rowsPerPage").value);
        let table = document.getElementById("dataTable").getElementsByTagName("tbody")[0];
        let rows = table.getElementsByTagName("tr");
        let pagination = document.getElementById("pagination");
        let selectAllCheckbox = document.getElementById("selectAll");
        let deleteSelectedButton = document.getElementById("deleteSelected");
        let filterByDateAndStatusButton = document.getElementById("filterByDateAndStatus");
        let resetFiltersButton = document.getElementById("resetFilters");
        let filteredRows = Array.from(rows);

        function displayRows(startIndex, endIndex) {//페이지네이션
            for (let i = 0; i < filteredRows.length; i++) {
                filteredRows[i].style.display = (i >= startIndex && i < endIndex) ? '' : 'none';
            }
        }

        function setupPagination() {
            let pageCount = Math.ceil(filteredRows.length / rowsPerPage);
            pagination.innerHTML = '';

            for (let i = 1; i <= pageCount; i++) {
                let pageLink = document.createElement("a");
                pageLink.innerHTML = i;
                pageLink.href = "#";
                pageLink.onclick = (function(i) {
                    return function() {
                        let start = (i - 1) * rowsPerPage;
                        let end = start + rowsPerPage;
                        displayRows(start, end);

                        let current = document.querySelector(".pagination a.active");
                        if (current) current.classList.remove("active");
                        this.classList.add("active");
                    }
                })(i);

                pagination.appendChild(pageLink);
            }

            // 기본 첫 페이지 표시
            if (pagination.getElementsByTagName("a").length > 0) {
                pagination.getElementsByTagName("a")[0].classList.add("active");
            }
            displayRows(0, rowsPerPage);
        }

        document.getElementById("rowsPerPage").addEventListener("change", function() {
            rowsPerPage = parseInt(this.value);
            setupPagination();
        });

        selectAllCheckbox.addEventListener("change", function() {//모두 체크 버튼 눌렸을 때
            let rowCheckboxes = document.querySelectorAll(".rowCheckbox");
            let visibleRows = Array.from(filteredRows).filter(row => row.style.display !== 'none');
            for (let checkbox of rowCheckboxes) {
                if (visibleRows.includes(checkbox.closest('tr'))) {
                    checkbox.checked = this.checked;
                }
            }
        });

        document.addEventListener("change", function(event) {
            if (event.target.classList.contains("rowCheckbox")) {
                if (!event.target.checked) {
                    selectAllCheckbox.checked = false;
                } else {
                    let visibleCheckboxes = Array.from(filteredRows).filter(row => row.style.display !== 'none')
                        .map(row => row.querySelector('.rowCheckbox'));
                    let allChecked = visibleCheckboxes.every(checkbox => checkbox.checked);
                    selectAllCheckbox.checked = allChecked;
                }
            }
        });

        deleteSelectedButton.addEventListener("click", function() {//삭제 버튼 눌렀을 때
        	//데이터베이스 안에 있는 정보들 수정하기 위한 코드
            let rowCheckboxes = document.querySelectorAll(".rowCheckbox:checked");
            let url="";
            rowCheckboxes.forEach(checkbox => {
                let row = checkbox.closest("tr");
                let prodnum = row.children[1].innerText;
                url += "prodnum="+prodnum+"&";
                
                row.parentNode.removeChild(row);
            });
            url = url.slice(0,-1);
            var xhr = new XMLHttpRequest();
            
            xhr.open("POST", "msd", true);
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");   	    
    	    xhr.send(url);
    	    
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
    	        	filteredRows = Array.from(rows);
					setupPagination();
    	        }
    	    }
            
        });

        
        filterByDateAndStatusButton.addEventListener("click", function() {
            let startDateInput = document.getElementById("startDate").value;
            let endDateInput = document.getElementById("endDate").value;

            
            // 모든 행을 숨긴 후 필터링된 행만 보이도록 설정
            for (let i = 0; i < rows.length; i++) {
                rows[i].style.display = 'none';
            }
            
            filteredRows = Array.from(rows).filter(row => {
                let dateCell = row.getElementsByTagName("td")[7].innerText;
                let rowDate = new Date(dateCell);

                // 필터링 조건: 날짜 범위 내에 있어야 함
                let dateMatches = (!startDateInput || !endDateInput) || (rowDate >= new Date(startDateInput) && rowDate <= new Date(endDateInput));
 
                return dateMatches;
            });

            setupPagination();
        });

        resetFiltersButton.addEventListener("click", function() {
            document.getElementById("startDate").value = '';
            document.getElementById("endDate").value = '';

            filteredRows = Array.from(rows);
            for (let i = 0; i < rows.length; i++) {
                rows[i].style.display = '';
            }

            setupPagination();
        });

        function editRow(prodnum) {
        	var nWidth = "500";
        	var nHeight = "300";
            // URL을 생성하여 새로운 창에서 수정 페이지를 열도록 함
            let url = `mse?prodnum=`+ prodnum;
            var curX = window.screenLeft;
            var curY = window.screenTop;
            var curWidth = document.body.clientWidth;
            var curHeight = document.body.clientHeight;
              
            var nLeft = curX + (curWidth / 2) - (nWidth / 2);
            var nTop = curY + (curHeight / 2) - (nHeight / 2);

            var strOption = "";
            strOption += "left=" + nLeft + "px,";
            strOption += "top=" + nTop + "px,";
            strOption += "width=" + 500 + "px,";
            strOption += "height=" + 500 + "px,";
            strOption += "toolbar=no,menubar=no,location=no,";
            strOption += "resizable=yes,status=yes";
            window.open(url, '_blank', strOption);
        }
        
       
        
	     var modal = document.getElementById("addRowModal");//모달 폼 ID로 받아와서 저장
	
	     //추가 버튼을 변수로 저장
	     var addButton = document.querySelector("button[onclick='addRow()']");
	
	     //모달 창 안에 있는 X키 변수로 저장
	     var span = document.getElementsByClassName("close")[0];
	
	     //추가 버튼 눌렸을 때 모달 창이 display가 블록으로 변경 되면서 화면에 표시됌
	     addButton.onclick = function() {
	         modal.style.display = "block";
	     }
	
	     // 모달 창 안에 있는 x키 눌렸을 때 모달 창을 숨겨주고 모달 창 안에 입력해놨던 정보 리셋
	     span.onclick = function() {
	    	 var form = document.getElementById("addRowForm");
	         modal.style.display = "none";
	         form.reset();
	     }
	
	     // 모달 창 밖에 즉 모달 창 열렸을 때 하얀 부분 바깥 부분을 누르면 모달 창 닫게 되는 함수
	     window.onclick = function(event) {
	         if (event.target == modal) {
	        	 var form = document.getElementById("addRowForm");
	             modal.style.display = "none";
	             form.reset();
	         }
	     }
	
	     // Function to handle form submission
	     function submitAddRowForm() {//모달 창 안에 있는 추가 버튼을 눌렀을 때
	    	 //모달 창 안에 있는 정보들을 데이터베이스에 추가 해주기 위한 함수
	    	 
	    		var form = document.getElementById("addRowForm");
	    	    var formData = new FormData(form);//모달창 정보들이 여기에 있음

	    	    // 각 필드의 값을 추출
	    	    var prodnum = formData.get("prodnum");
	    	    var lotnum = formData.get("lotnum");
	    	    var prodname = formData.get("prodname");
	    	    var spec = formData.get("spec");
	    	    var loc = formData.get("loc");
				
	    	    console.log(prodnum);
	    	    console.log(lotnum);
	    	    console.log(prodname);
	    	    console.log(spec);
	    	    console.log(loc);
	    	    
	    	    // 빈 값이 있는지 확인
	    	    if (!prodnum || !lotnum || !prodname || !spec || !loc ) {
	    	        alert("모든 필드를 입력해 주세요.");
	    	        return false; // 입력 되지 않은 정보가 있다면 폼 제출 중단
	    	    }

	    	    var table = document.getElementById("dataTable").getElementsByTagName("tbody")[0];
	    	    var xhr = new XMLHttpRequest();

	    	    xhr.open("POST", "msa", true);
	    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    	    xhr.send("prodnum=" + prodnum +
	    	             "&lotnum=" + lotnum +
	    	             "&prodname=" + prodname +
	    	             "&spec=" + spec +
	    	             "&loc=" + loc
	    	    );

	    	    xhr.onreadystatechange = function() {
	    	        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
	    	            location.reload(true);
	    	        }
	    	    }
	    	}
	        
	        setupPagination();
    </script>
</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/button.js"></script>
</html>