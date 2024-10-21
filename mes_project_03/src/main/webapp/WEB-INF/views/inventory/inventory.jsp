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
<title>재고 관리</title>
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
/* 	padding: 5px 15px; */
	cursor: pointer;
	border-radius: 5px;
}

.btn:hover {
	background-color: #218838;
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

/* 모달창 스타일 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>
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
		<h1>재고 관리</h1>
		<span>재고 관리하는 페이지 입니다</span>
		<div class="top-section">
			<!-- 페이지당 항목 수 선택 -->
			<form method="get" action="/gaw/inventory">
				<label for="countperpage">페이지당 항목 수:</label> <select
					name="countperpage" id="countperpage" onchange="this.form.submit()">
					<option value="10" ${countperpage == 10 ? 'selected' : ''}>10</option>
					<option value="20" ${countperpage == 20 ? 'selected' : ''}>20</option>
					<option value="50" ${countperpage == 50 ? 'selected' : ''}>50</option>
					<option value="100" ${countperpage == 100 ? 'selected' : ''}>100</option>
				</select> <input type="hidden" name="page" value="${currentPage}">
			</form>

			<!-- 추가 버튼 -->
			<a href="/gaw/inventory">
				<button class="btn">
					<span>추가</span>
				</button>
			</a>
		</div>

		<!-- 재고 리스트 테이블 -->
		<table id="productTable">
			<tr>
				<th>제품 ID</th>
				<th>제품 이름</th>
				<th>제품 수량</th>
				<th>제품 위치</th>
				<th colspan="2">수정 및 삭제</th>
			</tr>
			<c:forEach var="inventory" items="${inventoryList}">
				<tr class="bom-row">
					<td>${inventory.inventory_id}</td>
					<td>${inventory.product_id}</td>
					<td>${inventory.quantity}</td>
					<td>${inventory.location}</td>
					<td>
						<button class="btn openEditModal"
							data-id="${inventory.inventory_id}"
							data-product="${inventory.product_id}"
							data-quantity="${inventory.quantity}"
							data-location="${inventory.location}">
							<span>수정</span>
						</button>
					</td>
					<td>
						<form action="/gaw/inventorydelete" method="post">
							<input type="hidden" value="${inventory.inventory_id}"
								name="inventory_id">
							<button type="submit" class="btn">
								<span>삭제</span>
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>

		<!-- 페이징 -->
		<div class="pagination">
			<ul>
				<!-- 이전 페이지로 이동 -->
				<c:if test="${currentPage > 1}">
					<li><a
						href="?page=${currentPage - 1}&countperpage=${countperpage}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="${i == currentPage ? 'active' : ''}"><a
						href="?page=${i}&countperpage=${countperpage}">${i}</a></li>
				</c:forEach>

				<!-- 다음 페이지로 이동 -->
				<c:if test="${currentPage < totalPage}">
					<li><a
						href="?page=${currentPage + 1}&countperpage=${countperpage}">다음</a></li>
				</c:if>
			</ul>
		</div>
	</article>

	<!-- 추가/수정 모달 -->
	<div id="modal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2 id="modalTitle">재고 추가</h2>
			<form id="modalForm" method="post" action="">
				<input type="hidden" id="inventoryId" name="inventory_id"> <label
					for="productId">제품 ID:</label> <input type="text" id="productId"
					name="product_id" required><br>
				<br> <label for="quantity">수량:</label> <input type="number"
					id="quantity" name="quantity" required><br>
				<br> <label for="location">위치:</label> <input type="text"
					id="location" name="location" required><br>
				<br>
				<button type="submit" class="btn">저장</button>
			</form>
		</div>
	</div>

	<script>
        // 모달 열기 및 닫기
        var modal = document.getElementById("modal");
        var span = document.getElementsByClassName("close")[0];
        
        // 추가 버튼 클릭 시
        document.getElementById("openAddModal").onclick = function() {
            document.getElementById("modalTitle").innerText = "재고 추가";
            document.getElementById("modalForm").action = "/gaw/inventory/insert";
            document.getElementById("inventoryId").value = "";
            document.getElementById("productId").value = "";
            document.getElementById("quantity").value = "";
            document.getElementById("location").value = "";
            modal.style.display = "block";
        };

        // 수정 버튼 클릭 시
        document.querySelectorAll(".openEditModal").forEach(button => {
            button.onclick = function() {
                document.getElementById("modalTitle").innerText = "재고 수정";
                document.getElementById("modalForm").action = "/gaw/inventory/update";
                document.getElementById("inventoryId").value = this.dataset.id;
                document.getElementById("productId").value = this.dataset.product;
                document.getElementById("quantity").value = this.dataset.quantity;
                document.getElementById("location").value = this.dataset.location;
                modal.style.display = "block";
            };
        });

        // 모달 닫기
        span.onclick = function() {
            modal.style.display = "none";
        };

        // 모달 외부 클릭 시 닫기
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    </script>
</body>

</html>
