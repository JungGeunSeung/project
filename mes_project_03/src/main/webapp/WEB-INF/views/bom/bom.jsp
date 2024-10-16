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
<title>bom정보</title>
<style>
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
	background-color: #007bff;
	color: white;
	border: 1px solid #007bff;
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
		<form method="get" action="/gaw/bom">
			<label for="countperpage">페이지당 항목 수:</label> <select
				name="countperpage" id="countperpage" onchange="this.form.submit()">
				<option value="10" ${countperpage==10 ? 'selected' : '' }>10</option>
				<option value="20" ${countperpage==20 ? 'selected' : '' }>20</option>
				<option value="50" ${countperpage==50 ? 'selected' : '' }>50</option>
				<option value="100" ${countperpage==100 ? 'selected' : '' }>100</option>
			</select> <input type="hidden" name="page" value="${currentPage}">
		</form>


		<a href="/gaw/bominsert"><button class="btn">
				<span>추가</span>
			</button></a>
		<table border=1 id="productTable">
			<thead>
				<tr>

					<th>제품명</th>
					<th>제품 규격</th>
					<th>제품 색상</th>
					<th>제품의 BOM 개수</th>
					<th>자제 총 사용 개수</th>
					<th>Update</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bom" items="${bom}">
					<tr class="bom-row">

						<td class="product-name"><input id="product_id" type="hidden" name="product_id" value="${bom.product_id }">${bom.name}</td>
						<td>${bom.standard}</td>
						<td>${bom.color}</td>
						<td>${bom.bom_count}</td>
						<td>${bom.total_quantity}</td>
						<td>
							<form action="/gaw/bomupdate" method="post">
								<input type="hidden" value="${bom.product_id}" name="product_id">
								<input type="submit" value="수정" class="btn">
							</form>
						</td>
						<td>
							<form action="bomdelete" method="post">
								<input type="hidden" value="${bom.product_id}" name="product_id">
								<input type="submit" value="삭제" class="btn">
							</form>
						</td>

					</tr>

				</c:forEach>
				<c:if test="${empty bom}">
					<tr>
						<td colspan="6">자료가 없습니다</td>
					</tr>
				</c:if>

			</tbody>
		</table>
		<!-- 페이지 네비게이션 -->
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
	<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // 테이블의 모든 행을 클릭 이벤트로 처리
    document.querySelector('#productTable tbody').addEventListener('click', function(e) {
        // 클릭된 요소가 tr 또는 그 내부 요소인지 확인
        var row = e.target.closest('tr');
        if (!row) return;

        var product_id = row.querySelector('#product_id').value;  // 클릭된 행의 product_id 가져오기
        console.log(product_id);
        // 이미 bom-details 행이 있는지 확인하여 닫기
        var detailRow = row.nextElementSibling;
        if (detailRow && detailRow.classList.contains('bom-details')) {
            detailRow.remove();  // 이미 열려 있으면 닫기
            return;
        }

        // 이전에 열린 bom-details 행을 모두 제거
        document.querySelectorAll('.bom-details').forEach(function(row) {
            row.remove();
        });

        // Ajax 요청으로 BOM 데이터를 가져오기
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'bomp', true);  // 서버의 URL에 맞춰 수정
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                var details = '<table border="1" cellpadding="5" cellspacing="0"><thead>';
                details += '<tr><th>BOM ID</th><th>Material ID</th><th>Material Name</th><th>Quantity</th><th>Version</th><th>Create At</th></tr></thead><tbody>';

                response.forEach(function(detail) {
                    details += '<tr>';
                    details += '<td>' + detail.bom_id + '</td>';
                    details += '<td>' + detail.material_id + '</td>';
                    details += '<td>' + detail.material_name + '</td>';
                    details += '<td>' + detail.quantity + '</td>';
                    details += '<td>' + detail.version + '</td>';
                    details += '<td>' + detail.create_at + '</td>';
                    details += '</tr>';
                });

                details += '</tbody></table>';

                // 새로운 .bom-details 행 추가
                var newRow = document.createElement('tr');
                newRow.className = 'bom-details';
                newRow.innerHTML = '<td colspan="6">' + details + '</td>';
                row.parentNode.insertBefore(newRow, row.nextSibling);  // 새로운 행을 클릭된 행 바로 다음에 추가
            }
        };

        // POST 요청으로 product_id 전송
        xhr.send('product_id=' + encodeURIComponent(product_id));
    });
});
</script>



</body>

</html>