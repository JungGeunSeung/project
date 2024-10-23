<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>구매/발주 관리</title>
<style>
/* 전체 컨테이너 */
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

/* 테이블 스타일링 */
table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

table th, table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table th {
	background-color: #28a745;
	color: white;
}

table td {
	height: 40px;
}

/* 버튼 스타일링 */
.btn {
    background-color: #28a745;
    color: white;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

/* 추가 버튼을 오른쪽에 배치 */
.add-btn-container {
    display: flex;
    justify-content: flex-end;
    margin-bottom: 10px;
}

.btn:hover {
	background-color: #218838;
}

/* 모달 스타일링 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 페이지당 항목 수와 추가 버튼을 동일한 라인에 배치 */
.top-section {
	display: flex;
	flex-direction: column;
	align-items: flex-end;
	margin-bottom: 20px;
}

/* 페이지당 항목 선택 */
.top-section form {
	margin-bottom: 10px;
}

.pagination ul {
	list-style-type: none;
	padding: 0;
	display: flex;
	justify-content: center;
}

.pagination ul li {
	display: inline-block;
	margin: 0 5px;
}

.pagination ul li a {
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ddd;
	color: #333;
}

.pagination ul li.active a {
	background-color: #28a745;
	color: white;
	border: 1px solid #28a745;
}

.pagination ul li a:hover {
	background-color: #28a745;
	color: white;
	border: 1px solid #28a745;
}
</style>

<script>
//모달 열기
function openModal(modalId) {
    document.getElementById(modalId).style.display = "block";
}

// 모달 닫기
function closeModal(modalId) {
    document.getElementById(modalId).style.display = "none";
}

// 수정 모달에 데이터 채우기
function openUpdateModal(requestId, materialId, request_by, req_date, quantity, status) {
    console.log("Modal Opened with: ", requestId, materialId, request_by, req_date, quantity, status); // 확인용 로그
    document.getElementById('update_request_id').value = requestId;
    document.getElementById('update_material_id').value = materialId;
    document.getElementById('update_request_by').value = request_by; 
    document.getElementById('update_req_date').value = req_date;
    document.getElementById('update_quantity').value = quantity;
    document.getElementById('update_status').value = status;
    openModal('updateModal');
}
</script>
</head>

<body>
	<!-- 헤더 -->
	<header>
		<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
	</header>

	<!-- 메뉴바 -->
	<nav>
		<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>

	<article>
		<h1>구매/발주 관리</h1>
		<span>구매/발주 관리하는 페이지 입니다</span>
		<div class="top-section">
			<form method="get" action="/gaw/material">
				<label for="countperpage">페이지당 항목 수:</label> <select
					name="countperpage" id="countperpage" onchange="this.form.submit()">
					<option value="10" ${countperpage==10 ? 'selected' : '' }>10</option>
					<option value="20" ${countperpage==20 ? 'selected' : '' }>20</option>
					<option value="50" ${countperpage==50 ? 'selected' : '' }>50</option>
					<option value="100" ${countperpage==100 ? 'selected' : '' }>100</option>
				</select> <input type="hidden" name="page" value="${currentPage}">
			</form>
		</div>

	<!-- 추가 버튼 -->
	<div class="add-btn-container">
    <button class="btn" onclick="openModal('addModal')">추가</button>
</div>
		<table id="productTable">
			<thead>
				<tr>
					<th>요청 ID</th>
					<th>자재 이름</th>
					<th>요청자</th>
					<th>요청 날짜</th>
					<th>요청 수량</th>
					<th>요청 상태</th>
					<th> 수정 </th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="request" items="${requests}">
					<tr>
						<td>${request.request_id}</td>
						<td>${request.material_id}</td>
						<td>${request.request_by}</td>
						<td>${request.req_date}</td>
						<td>${request.quantity}</td>
						<td>${request.status}</td>
					<td>
						<!-- 수정 버튼 -->
						<button class="btn"
							onclick="openUpdateModal('${request.request_id}', '${request.material_id}', '${request.request_by}', '${request.req_date}','${request.quantity}','${request.status}')">
							<span>수정</span>
						</button>
					</td>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<ul>
				<c:if test="${currentPage > 1}">
					<li><a
						href="?page=${currentPage - 1}&countperpage=${countperpage}">이전</a></li>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="${i == currentPage ? 'active' : ''}"><a
						href="?page=${i}&countperpage=${countperpage}">${i}</a></li>
				</c:forEach>
				<c:if test="${currentPage < totalPage}">
					<li><a
						href="?page=${currentPage + 1}&countperpage=${countperpage}">다음</a></li>
				</c:if>
			</ul>
		</div>

<!-- 추가 모달 -->
<div id="addModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal('addModal')">&times;</span>
        <h2>추가 요청</h2>
      <form action="/gaw/materialReq/add" method="post">
    요청 ID: <input type="text" name="request_id" required><br>
    자재 ID: <input type="text" name="material_id" required><br>
    요청자: <input type="text" name="request_by" required><br>
    요청 날짜: <input type="date" name="req_date" required><br>
    요청 수량: <input type="number" name="quantity" required><br>
    요청 상태: <input type="text" name="status" required><br>
    <input type="submit" value="추가" class="btn">
</form>
    </div>
</div>
	<!-- 수정 모달 -->
	<div id="updateModal" class="modal">
	    <div class="modal-content">
	        <span class="close" onclick="closeModal('updateModal')">&times;</span>
	        <h2>수정 요청</h2>
	         <form action="${pageContext.request.contextPath}/materialReq/update" method="post">
	            요청 ID: <input type="text" id="update_request_id" name="request_id" required><br>
	            자재 ID: <input type="text" id="update_material_id" name="material_id" required><br>
	            요청자: <input type="text" id="update_request_by" name="request_by" required><br>
	            요청 날짜: <input type="date" id="update_req_date" name="req_date" required><br>
	            요청 수량: <input type="number" id="update_quantity" name="quantity" required><br>
	            요청 상태: <input type="text" id="update_status" name="status" required><br>
	            <input type="submit" value="수정" class="btn">
	        </form>
	    </div>
	</div>

	</article>
		<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
	<!-- 로딩 CSS에 해당하는 HTML -->
   <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
</body>

</html>
