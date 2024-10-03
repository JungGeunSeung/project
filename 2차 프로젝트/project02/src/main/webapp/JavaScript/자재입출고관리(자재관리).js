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
                let inum = row.children[1].innerText;
                let prodnum = row.children[2].innerText;
                let inout = row.children[5].innerText;
                let count = row.children[6].innerText;
                url += "inum="+inum+"&inout="+inout+"&prodnum="+prodnum+"&count="+count+"&";
                
                row.parentNode.removeChild(row);
            });
            url = url.slice(0,-1);
          	console.log(url);
            var xhr = new XMLHttpRequest();
            
            xhr.open("POST", "materialdelete", true);
    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");   	    
    	    xhr.send(url);
    	    
    	    xhr.onreadystatechange = function() {
    	        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
    	        	console.log(3)
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

        function editRow(num) {
        	var nWidth = "500";
        	var nHeight = "300";
            // URL을 생성하여 새로운 창에서 수정 페이지를 열도록 함
            let url = `Materialprint?num=`+ num;
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
	    	    var prodnum = formData.get("prodNum");
	    	    var lotnum = formData.get("LOTNum");
	    	    var prodname = formData.get("prodName");
	    	    var inout = formData.get("inout");
	    	    var count = formData.get("count");
	    	    var date = formData.get("date");
	    	    var checker = formData.get("checker");

	    	    
	    	    // 빈 값이 있는지 확인
	    	    if (!prodnum || !lotnum || !prodname || !inout || !count || !date || !checker) {
	    	        alert("모든 필드를 입력해 주세요.");
	    	        return false; // 입력 되지 않은 정보가 있다면 폼 제출 중단
	    	    }

	    	    var table = document.getElementById("dataTable").getElementsByTagName("tbody")[0];
	    	    var xhr = new XMLHttpRequest();
	    	    let inum = table.rows.length + 1;

	    	    xhr.open("POST", "materialadd", true);
	    	    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	    	    xhr.send("inum=" + inum +
	    	             "&productnum=" + prodnum +
	    	             "&lotnum=" + lotnum +
	    	             "&productname=" + prodname +
	    	             "&inout=" + inout +
	    	             "&count=" + count +
	    	             "&date=" + date +
	    	             "&inspector=" + checker
	    	    );

	    	    xhr.onreadystatechange = function() {
	    	        if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
	    	            location.reload(true);
	    	        }
	    	    }
	    	}
	        
	        setupPagination();