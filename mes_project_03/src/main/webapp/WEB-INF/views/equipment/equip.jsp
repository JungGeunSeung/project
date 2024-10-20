<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.gaw.dto.PaginationDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <title>제목</title>
    <style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.equipType, .equipLocation, .equipStatus {
	display: inline-block;
	background-color: white;
	border: 1px solid green;
	border-radius: 5px;
	margin: 10px;
	text-align: center;
	color: green;
}

.equipType select, 
.equipLocation select, 
.equipStatus select,
.equipSearch select,
.paginationDiv select {
	width: 100px;
	height: 20px;
	border: 1px solid green;
	color: green;
	border-radius: 5px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	text-align: center;
	margin: 5px;
}

.equipType select option:hover, 
.equipLocation select option:hover, 
.equipStatus select option:hover {
	background-color: green;
	color: white;
}

.equipSearch input {
	font-size: 16px;
	width: 200px;
	height: 20px;
	border: 1px solid green;
	border-radius: 5px;
	color: green;
}

.equipSearch input::placeholder {
	color: green;
}

.selectDiv {
	
	width: 100%;
}

.paginationDiv {
	float: right;
	margin: 20px 5px;
}

.search-type {
	width: 100%;
	margin: 20px 5px;
	padding: 10px 5px;
}

/* Pagination 스타일 */
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination .page-numbers {
    display: inline-block;
    padding: 10px 15px;
    margin: 0 5px;
    background-color: #e5ffd8;
    border: 1px solid #3bdf25da;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
    text-decoration: none;
}

.pagination .page-numbers:hover,
.pagination .page-numbers.active {
    background-color: #3bdf25da;
    color: white;
}

.pagination .prev2, .pagination .next2 {
    font-size: 18px;
    margin: 0 10px;
    background-color: inherit;
    border: none;
    cursor: pointer;
    text-decoration: none;
}

#countPerPageForm {
    margin-top: 20px;
}

#insertEquipBtn {
	float: right;
}

/* 모달 창 배경 */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    align-items: center;
    justify-content: center;
}

/* 모달 내용 */
.modal-content {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    width: 500px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    text-align: center;
}

.modal-actions {
    display: flex;
    justify-content: space-between;
}

/* 닫기 버튼 */
.close {
    float: right;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}

/* 입력 필드 */
.modal-content input[type="text"] {
    width: 90%;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

/* 모달 내 버튼 그룹 */
.modal-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

/* 폼 내부 라벨 스타일 */
label {
    display: block;
    text-align: left;
    margin-top: 10px;
    font-weight: bold;
}

    </style>
</head>

<body>
<%
    // 모델에서 PaginationDTO 객체 가져오기
    PaginationDTO pagination = (PaginationDTO) request.getAttribute("pagination");

    // PaginationDTO의 값을 getter 메서드로 가져옵니다.
    int currentPage = pagination.getCurrentPage();
    int startPage = pagination.getStartPage();
    int endPage = pagination.getEndPage();
    int totalPages = pagination.getTotalPages();
    int countPerPage = pagination.getCountPerPage();
    boolean hasPrev = pagination.isHasPrev();
    boolean hasNext = pagination.isHasNext();
    int prevPage = pagination.getPrevPage();
    int nextPage = pagination.getNextPage();
%>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-- 메뉴바 -->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
	<!-- 메인 영역 -->
    <article>
    <h2 class="pageTitle">설비관리</h2>
    <span class="pageDescription">설비를 등록, 관리하는 페이지 입니다.</span>
    
    <div class="search-type">
    	<div class="equipSearch">
			<form id="searchForm" action="equip" method="get">
				<input id="selectequip" type="hidden" name="equip_id" value="">
				
				<select name="searchType" id="searchType">
					<option value="equip_id" ${param.searchType == 'equip_id' ? 'selected' : ''}>설비코드</option>
					<option value="name" ${param.searchType == 'name' ? 'selected' : ''}>설비명</option>
				</select>
				
				<input id="searchInputText" type="text" name="searchKeyword" placeholder="검색어를 입력하세요." value="${param.searchKeyword}" />
				<button type="submit" class="btn">
					<span>조회</span>
				</button>
	
				<!-- 페이지 이동 시에도 검색 정보가 유지되도록 hidden 필드 추가 -->
				<input type="hidden" name="countPerPage"
					value="${pagination.countPerPage}" /> <input type="hidden"
					name="page" value="${pagination.currentPage}" />
			</form>
		</div>
		<div class="selectDiv">
			<div class="equipType">
				<span>설비유형</span>
				<form id="searchForm" action="equip" method="get">
					<input type="hidden" name="searchType" value="type">
					<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
						<c:forEach var="list" items="${listType}">
							<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
						</c:forEach>
					</select>
				</form>
			</div>
			
			<div class="equipLocation">
				<span>설비위치</span>
				<form id="searchForm" action="equip" method="get">
					<input type="hidden" name="searchType" value="Location">
					<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
						<c:forEach var="list" items="${listLocation}">
							<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
						</c:forEach>
					</select>
				</form>
			</div>
			
			<div class="equipStatus">
				<span>설비상태</span>
				<form id="searchForm" action="equip" method="get">
					<input type="hidden" name="searchType" value="status">
					<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
						<c:forEach var="list" items="${listStatus}">
							<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
						</c:forEach>
					</select>
				</form>
			</div>
		</div>
		<div class="contentBtn">
			<button id="insertEquipBtn" class="btn"><span>설비 추가하기</span></button>
		</div>
		<div class="paginationDiv">
			<form id="countPerPageForm"
				action="equip?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}"
				method="get">
				<select name="countPerPage" id="countPerPage"
					onchange="this.form.submit()">
					<option value="5"
						${pagination.countPerPage == 5 ? 'selected' : ''}>5개씩</option>
					<option value="10"
						${pagination.countPerPage == 10 ? 'selected' : ''}>10개씩</option>
					<option value="15"
						${pagination.countPerPage == 15 ? 'selected' : ''}>15개씩</option>
					<option value="20"
						${pagination.countPerPage == 20 ? 'selected' : ''}>20개씩</option>
					<option value="30"
						${pagination.countPerPage == 30 ? 'selected' : ''}>30개씩</option>
					<option value="40"
						${pagination.countPerPage == 40 ? 'selected' : ''}>40개씩</option>
					<option value="50"
						${pagination.countPerPage == 50 ? 'selected' : ''}>50개씩</option>
				</select>
				<input type="hidden" name="page" value="${pagination.currentPage}" /> 
				<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
				<input type="hidden" name="searchType" value="${searchType}" />
			</form>
		</div>

	</div>
	
    <table>
    	<thead>
    		<tr>
    			<th>설비 코드</th>
    			<th>설비 명</th>
    			<th>설비 유형</th>
    			<th>위치</th>
    			<th>설비 상태</th>
    			<th>구매일자</th>
    			<th>최근 보수일자</th>
    			<th colspan="2">수정 및 삭제</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="list" items="${list}">
	    		<tr>
	    			<td>${list.equip_id}</td>
	    			<td>${list.name}</td>
	    			<td>${list.type}</td>
	    			<td>${list.location}</td>
	    			<td>${list.status}</td>
	    			<td>${list.purchase}</td>
	    			<td>${list.last}</td>
	    			<td><button class="btn modifyEquipBtn"><span>수정</span></button></td>
	    			<td><button class="btn deleteEquipBtn"><span>삭제</span></button></td>
	    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    <%-- Pagination --%>
	<div class="pagination">
		<%-- 이전 페이지 링크 --%>
		<% if (hasPrev) {%>
		<a href="?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}" class="prev2 page-numbers">«</a><%}%>
		<%-- 페이지 번호 링크들 --%>
		<%for (int i = startPage; i <= endPage; i++) {%>
		<a href="?page=<%=i%>&countPerPage=<%=countPerPage%>"
			class="page-numbers <%=(i == currentPage) ? "active" : ""%>"> <%=i%>
		</a><%}%>
		<%-- 다음 페이지 링크 --%>
		<%if (hasNext) {%>
		<a href="?page=<%=nextPage%>&countPerPage=<%=countPerPage%>"
			class="next2 page-numbers">»</a><%}%>
	</div>
    </article>
    <!-- 모달창 -->
    <div id="insertmodal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>설비 추가</h2>
	        <form id="equipForm" action="insertEquip.do" method="post">
	            <label for="equipName">설비 명:</label>
	            <input type="text" id="equipName" name="name" placeholder="설비 이름을 입력하세요">
	
	            <label for="equipType">설비 유형:</label>
	            <input type="text" id="equipType" name="type" placeholder="설비 종류를 입력하세요">
	
	            <label for="equipType">설비 위치:</label>
	            <input type="text" id="equipLocation" name="location" placeholder="설비 종류를 입력하세요">
	
	            <label for="equipType">설비 상태:</label>
	            <input type="text" id="equipStatus" name="status" placeholder="설비 종류를 입력하세요">
	
	            <label for="equipType">구매 일자:</label>
	            <input type="date" id="equipPurchase" name="purchase" placeholder="설비 종류를 입력하세요">
	
	            <div class="modal-actions">
	                <button type="submit" class="btn"><span>추가</span></button>
	                <button type="button" class="btn cancel"><span>취소</span></button>
	            </div>
	        </form>
	    </div>
	</div>
	<!-- 수정 모달 창 -->
	<div id="editModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>설비 수정</h2>
	        <form id="editForm" method="post" action="updateEquip.do">
	            <input type="hidden" id="equip_id" name="equip_id">
	
	            <label for="name">설비 명:</label>
	            <input type="text" id="name" name="name" required>
	
	            <label for="type">설비 유형:</label>
	            <input type="text" id="type" name="type" required>
	
	            <label for="location">위치:</label>
	            <input type="text" id="location" name="location" required>
	
	            <label for="status">설비 상태:</label>
	            <input type="text" id="status" name="status" required>
	
	            <label for="purchase">구매일자:</label>
	            <input type="date" id="purchase" name="purchase" required>
	
	            <div class="modal-actions">
	                <button type="submit" class="btn">수정</button>
	                <button type="button" class="btn cancel">취소</button>
	            </div>
	        </form>
	    </div>
	</div>
    <!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    <script>
    const insertEquipBtn = document.getElementById('insertEquipBtn'); // 설비 추가 버튼
    const modifyEquipBtns = document.querySelectorAll('.modifyEquipBtn'); // 설비 수정 버튼 []
    const editModal = document.getElementById('editModal'); // 설비 수정 모달창
    const insertmodal = document.getElementById('insertmodal'); // 설비 추가 모달창
    const modals = document.querySelectorAll('.modal'); // 모달창
    const closeBtns = document.querySelectorAll('.close'); // 모달창에 닫기 버튼
    const cancelBtns = document.querySelectorAll('.cancel'); // 모달창에 취소 버튼
    const deleteEquipBtns = document.querySelectorAll('.deleteEquipBtn'); // 설비 삭제 버튼

    // 설비 추가 모달 열기
    insertEquipBtn.addEventListener('click', () => {
    	insertmodal.style.display = 'flex'; // flex로 설정하여 중앙 정렬
    });
    
    // 설비 수정 모달 열기
    // 각 수정 버튼에 이벤트 리스너 추가
	modifyEquipBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const row = event.target.closest('tr'); // 클릭된 버튼의 부모 행 가져오기
	        const equipId = row.cells[0].textContent;
	        const name = row.cells[1].textContent;
	        const type = row.cells[2].textContent;
	        const location = row.cells[3].textContent;
	        const status = row.cells[4].textContent;
	        const purchase = row.cells[5].textContent;
	
	        // 모달 input 필드에 값 채우기
	        document.getElementById('equip_id').value = equipId;
	        document.getElementById('name').value = name;
	        document.getElementById('type').value = type;
	        document.getElementById('location').value = location;
	        document.getElementById('status').value = status;
	        document.getElementById('purchase').value = purchase;
	
	        // 모달 열기
	        editModal.style.display = 'flex';
	    });
	});
    
    

	// 반복문을 통해 닫기 버튼에 이벤트 리스너 추가
	closeBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const modal = button.closest('.modal'); // 클릭된 버튼의 부모 모달 가져오기
	        modal.style.display = 'none';
	    });
	});

	// 반복문을 통해 취소 버튼에 이벤트 리스너 추가
	cancelBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const modal = button.closest('.modal'); // 클릭된 버튼의 부모 모달 가져오기
	        modal.style.display = 'none';
	    });
	});

	// 반복문을 통해 모달 외부 클릭 시 닫기 이벤트 추가
	modals.forEach((modal) => {
	    window.addEventListener('click', (event) => {
	        if (event.target === modal) {
	            modal.style.display = 'none';
	        }
	    });
	});
    
	// 각 삭제 버튼에 이벤트 리스너 추가
	deleteEquipBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const row = event.target.closest('tr'); // 클릭된 버튼의 부모 행 가져오기
	        const equip_id = row.cells[0].textContent; // equip_id 가져오기

	        // 삭제 확인 창 표시
	        const confirmed = confirm(`설비 ID: \${equip_id}를 정말로 삭제하시겠습니까?`);

	        if (confirmed) {
	            // 삭제 요청 전송
	            fetch(`deleteEquip.do?equip_id=\${equip_id}`, {
	                method: 'POST', // 삭제 요청 전송 (POST로 설정)
	                headers: {
	                    'Content-Type': 'application/x-www-form-urlencoded',
	                },
	            })
	            .then((response) => {
	                if (response.ok) {
	                    alert('삭제가 완료되었습니다.');
	                    // 삭제된 행을 테이블에서 제거
	                    row.remove();
	                } else {
	                    alert('삭제에 실패했습니다.');
	                }
	            })
	            .catch((error) => {
	                console.error('삭제 중 오류가 발생했습니다:', error);
	                alert('삭제 중 오류가 발생했습니다.');
	            });
	        }
	    });
	});

    </script>
</body>
</html>