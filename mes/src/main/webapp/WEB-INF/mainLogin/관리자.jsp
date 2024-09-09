<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.UserDTO"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/mes/JavaScript/load_info.js"></script>

<title>관리자 페이지</title>

<style>
.management_kw {
	margin: 10px;
	padding: 10px;
	/* border: solid gray; */
	margin-right: 50px;
	width: 100%;
	height: 300px;
}

.management_profile {
	width: 200px;
	height: 200px;
	border-radius: 70%;
	border: solid gray;
	overflow: hidden;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
}

.id_poto_kw {
	width: 100%;
	height: 120%;
	object-fit: cover;
	
}

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
</style>
</head>

<body>
	<!-- 사이드바 -->
	<%
			HttpSession session1 = request.getSession();
			UserDTO dto = (UserDTO) session1.getAttribute("user");
	%>
	<div class="sidebar">
		<a href="main"> <img class="Logo" src="/mes/Image/로고.png" alt=""></a>


		<div class="profile">
			<img src="/mes/Image/정근승.png" alt="프로필 사진">
			<h2>정근승</h2>
			<p>대표이사</p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='login'">

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> 
				<input type="button" value="관리자페이지" class="btn" onclick="location.href='관리자'">
			</div>
		</div>


		<div class="cal_kwon">
			<div id="calendar"></div>
			<script src="/mes/JavaScript/calendar_nomall.js"></script>
		</div>

	</div>

	<!--/////////////////////////////////////////////////////////////-->
	<!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
	<div class="content">
		<div class="menu">
			<ul>
				<!--상위 메뉴-->
				<li class="menu-item"><a href="#">정보/BOM</a>
					<div class="submenu">
						<ul>
							<!--하위메뉴-->
							<li><a href="BOM">BOM</a></li>
							<li class="manager"><a href="설비코드">설비코드</a></li>
							<li><a href="조직도">조직도</a></li>
							<li><a href="문서관리">BOM문서관리(양식서)</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="#">재고관리</a>
					<div class="submenu">
						<ul>
							<li><a href="자재관리">자재입출고(자재관리)</a></li>
							<%
                     			if(dto.getGrade().equals("관리자")) {
                			%>
							<li><a href="재고관리">재고관리</a></li>
							<%
                     			}
							%>
							<li><a href="저장위치">저장위치(MAP)</a></li>
						</ul>
					</div></li>

				<li class="menu-item manager"><a href="#">품질관리</a>
					<div class="submenu">
						<ul>
							<li><a href="시험항목_품질기준">제품별 시험항목/품질기준</a></li>
							<li><a href="생산검사현황">생산검사현황</a></li>
							<li><a href="검사현황">검사현황</a></li>
						</ul>
					</div></li>

				<li class="menu-item"><a href="#">생산관리</a>
					<div class="submenu">
						<ul>
							<li><a href="생산계획목록">생산계획목록</a></li>
							<li><a href="작업지시서목록">작업지시목록</a></li>
							<li><a href="생산실적">생산실적</a></li>
							<li><a href="생산실적보고서">생산실적보고서</a></li>
						</ul>
					</div></li>

				<li class="menu-item manager"><a href="#">설비관리</a>
					<div class="submenu">
						<ul>
							<li><a href="공정별설비관리">공정별설비관리/수리보고서</a></li>
							<li><a href="설비고장_수리이력">설비고장/수리이력</a></li>
							<li><a href="비가동이력">비가동이력</a></li>
						</ul>
					</div></li>
			</ul>

		</div>
		<hr>
		<!-- 메인메뉴 아레 정보가 표시될 영역 -->



		<div class="main_page">
			<h2>관리자페이지</h2>
			<div class="tableID">
				<label for="rowsPerPage">정렬 갯수 : </label> <select id="rowsPerPage">
					<!-- 테이블에 표시될 행의 갯수 기본값은 10개 -->
					<option value="5">5</option>
					<option value="10" selected>10</option>
					<option value="15">15</option>
					<option value="20">20</option>
				</select>

				<br> <br> <label for="startDate">Start Date:</label> <input
					type="date" id="startDate"> <label for="endDate">End
					Date:</label> <input type="date" id="endDate"> <br>
				<button id="filterByDateAndStatus">검색</button>
				<button id="resetFilters">필터 해제</button>

				<table id="dataTable">
					<thead>
						<tr>
							<th>사원id</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>생년월일</th>
							<th>입사일</th>
							<th>등급</th>
							<th>상태</th>
							<th>사원번호</th>
							<th>부서</th>
							<th>수정</th>
						</tr>
					</thead>
					<tbody>
						<%
						//자재관리.java 컨트롤러에서 보내준 리스트를 getattribute로 받아서 저장
						List<UserDTO> list = (List<UserDTO>) request.getAttribute("list");

						// 테이블에 넣어줄 데이터 삽입

						for (int j = 0; j < list.size(); j++) {//DB에 있는 행의 갯수만큼 반복문 실행
							
							String userid = list.get(j).getUserid();
							String name = list.get(j).getName();
							String email = list.get(j).getEmail();
							String phonenumber = list.get(j).getPhone();
							Date birth = list.get(j).getBirth();
							Date hire = list.get(j).getHire();
							String grade = list.get(j).getGrade();
							String status = list.get(j).getStatus();
							int empno = list.get(j).getEmpno();
							int deptno = list.get(j).getDeptno();
						%>
						<tr>
							<td><%=userid%></td>
							<td><%=name%></td>
							<td><%=email%></td>
							<td><%=phonenumber%></td>
							<td><%=birth%></td>
							<td><%=hire%></td>
							<td><%=grade%></td>
							<td><%=status%></td>
							<td><%=empno%></td>
							<td><%=deptno%></td>
							<td><button onclick='editRow("<%=userid%>")'>수정</button></td>
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

        function editRow(userid) {
        	var nWidth = "500";
        	var nHeight = "300";
            // URL을 생성하여 새로운 창에서 수정 페이지를 열도록 함
            let url = `manageredit?userid=`+ userid;
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

	        setupPagination();
    </script>
</body>

</html>