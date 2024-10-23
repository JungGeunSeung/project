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
<title>bom정보</title>
<style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
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
	background-color: #28a745; /* Green color on hover */
	color: white;
	border: 1px solid #28a745;
}

table {
	text-align: center;
}

tabel td {
	padding: 5px;
	height: 30px;
}

table tr {
	padding: 5px;
	height:
}
/* 페이지당 항목 수와 추가 버튼을 동일한 라인에 배치 */
.top-section {
	display: flex;
	flex-direction: column;
	align-items: flex-end; /* 오른쪽 정렬 */
	margin-bottom: 20px;
}

/* 페이지당 항목 선택 */
.top-section form {
	margin-bottom: 10px; /* 추가 버튼과 간격을 주기 위한 마진 */
}
/* 모달창 배경 */
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

/* 모달창 내용 */
.modal-content {
	background-color: #fff;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.3);
	text-align: left;
}

/* 닫기 버튼 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #28a745; /* 초록색 */
	cursor: pointer;
}

/* 버튼 스타일 */
button.btn {
	background-color: #28a745; /* 초록색 */
	color: white;
	/* 	padding: 10px 20px; */
	border: none;
	cursor: pointer;
}

button.btn:hover {
	background-color: darkgreen;
}

button#deleteBtn {
	background-color: red; /* 삭제 버튼은 빨간색 */
}

button#deleteBtn:hover {
	background-color: darkred;
}
</style>
</head>

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
		<h1>정보/BOM</h1>
		<span>BOM을 관리하는 페이지 입니다</span>
		<div class="top-section">
			<form method="get" action="/gaw/bom">
				<label for="countperpage">페이지당 항목 수:</label> <select
					name="countperpage" id="countperpage" onchange="this.form.submit()">
					<option value="10" ${countperpage==10 ? 'selected' : '' }>10</option>
					<option value="20" ${countperpage==20 ? 'selected' : '' }>20</option>
					<option value="50" ${countperpage==50 ? 'selected' : '' }>50</option>
					<option value="100" ${countperpage==100 ? 'selected' : '' }>100</option>
				</select> <input type="hidden" name="page" value="${currentPage}">
			</form>


			<!-- 왼쪽 상단에 추가 버튼 배치 -->
			<a href="/gaw/bom">
				<button class="btn">
					<span>추가</span>
				</button>
			</a>
		</div>
		<table border=1 id="productTable">
			<thead>
				<tr>

					<th>제품명</th>
					<th>제품 규격</th>
					<th>제품 색상</th>
					<th>제품의 <br>BOM 개수
					</th>
					<th>자제 총 <br>사용 개수
					</th>
					<th colspan="2">수정 및 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bom" items="${bom}">
					<tr class="bom-row">

						<td class="product-name"><input id="product_id" type="hidden"
							name="product_id" value="${bom.product_id }">${bom.name}</td>
						<td>${bom.standard}</td>
						<td>${bom.color}</td>
						<td>${bom.bom_count}</td>
						<td>${bom.total_quantity}</td>
						<td>
							<form action="/gaw/bomupdate" method="post">
								<input type="hidden" value="${bom.bom_id}" name="bom_id">
								<button type="submit" class="btn">
									<span>수정</span>
								</button>
							</form>
						</td>
						<td>
							<form action="bomdelete" method="post">
								<input type="hidden" value="${bom.bom_id}" name="bom_id">
								<button type="submit" class="btn">
									<span>삭제</span>
								</button>
							</form>
						</td>

					</tr>

				</c:forEach>
				<c:if test="${empty bom}">
					<tr>
						<td colspan="7">자료가 없습니다</td>
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
		<!-- 로딩 CSS에 해당하는 HTML -->
   <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	</footer>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							// 테이블의 모든 행을 클릭 이벤트로 처리
							document
									.querySelector('#productTable tbody')
									.addEventListener(
											'click',
											function(e) {
												// 클릭된 요소가 tr 또는 그 내부 요소인지 확인
												var row = e.target
														.closest('tr');
												if (!row)
													return;

												var product_id = row
														.querySelector('#product_id').value; // 클릭된 행의 product_id 가져오기
												console.log(product_id);
												// 이미 bom-details 행이 있는지 확인하여 닫기
												var detailRow = row.nextElementSibling;
												if (detailRow
														&& detailRow.classList
																.contains('bom-details')) {
													detailRow.remove(); // 이미 열려 있으면 닫기
													return;
												}

												// 이전에 열린 bom-details 행을 모두 제거
												document.querySelectorAll(
														'.bom-details')
														.forEach(function(row) {
															row.remove();
														});

												// Ajax 요청으로 BOM 데이터를 가져오기
												var xhr = new XMLHttpRequest();
												xhr.open('POST', 'bomp', true); // 서버의 URL에 맞춰 수정
												xhr
														.setRequestHeader(
																'Content-Type',
																'application/x-www-form-urlencoded');

												xhr.onreadystatechange = function() {
													if (xhr.readyState === 4
															&& xhr.status === 200) {
														var response = JSON
																.parse(xhr.responseText);
														var details = '<table border="1" cellpadding="5" cellspacing="0"><thead>';
														details += '<tr><th>제품명</th><th>제품 이름</th><th>자재 이름</th><th>사용 개수</th><th>버전</th><th>생성일</th><th colspan="2">수정 및 삭제</th></tr></thead><tbody>';

														response
																.forEach(function(
																		detail) {
																	const create_at = new Date(
																			detail.create_at)
																	const y = create_at
																			.getFullYear()
																	const m = String(
																			create_at
																					.getMonth() + 1)
																			.padStart(
																					2,
																					'0')
																	const d = create_at
																			.getDate()
																	details += '<tr>';
																	details += '<td>'
																			+ detail.bom_id
																			+ '</td>';
																	details += '<td>'
																			+ detail.material_id
																			+ '</td>';
																	details += '<td>'
																			+ detail.material_name
																			+ '</td>';
																	details += '<td>'
																			+ detail.quantity
																			+ '</td>';
																	details += '<td>'
																			+ detail.version
																			+ '</td>';
																	details += '<td>'
																			+ y
																			+ '년'
																			+ m
																			+ '월'
																			+ d
																			+ '일';
																	+'</td>';
																	details += '<td>'
																			+ '<button class="btn">수정</button>'
																			+ '</td>';
																	details += '<td>'
																			+ '<button class="btn">삭제</button>'
																			+ '</td>';
																	details += '</tr>';
																});

														details += '</tbody></table>';

														// 새로운 .bom-details 행 추가
														var newRow = document
																.createElement('tr');
														newRow.className = 'bom-details';
														newRow.innerHTML = '<td colspan="7">'
																+ details
																+ '</td>';
														row.parentNode
																.insertBefore(
																		newRow,
																		row.nextSibling); // 새로운 행을 클릭된 행 바로 다음에 추가
													}
												};

												// POST 요청으로 product_id 전송
												xhr
														.send('product_id='
																+ encodeURIComponent(product_id));
											});
						});

		document.addEventListener('DOMContentLoaded', function() {
		    // 수정 모달 관련 변수
		    var editModal = document.getElementById('editModal');
		    var closeEditBtn = document.querySelector('.close-edit');
		    var bomIdEditField = document.getElementById('bomIdEdit');
		    var materialNameEditField = document.getElementById('materialNameEdit');
		    var quantityEditField = document.getElementById('quantityEdit');
		    var versionEditField = document.getElementById('versionEdit');
		    var editForm = document.getElementById('editForm');

		    // 삭제 모달 관련 변수
		    var deleteModal = document.getElementById('deleteModal'); 
		    var closeDeleteBtn = document.querySelector('.close-delete');
		    var bomIdDeleteField = document.getElementById('bomIdDelete');
		    var deleteForm = document.getElementById('deleteForm');

		    // 테이블에서 수정 버튼 클릭 시 수정 모달창 열기
		    document.querySelector('#productTable tbody').addEventListener('click', function(e) {
		        if (e.target.textContent === '수정') {
		            var row = e.target.closest('tr');
		            bomIdEditField.value = row.querySelector('[name="bom_id"]').value;
		            materialNameEditField.value = row.querySelector('td:nth-child(3)').textContent;
		            quantityEditField.value = row.querySelector('td:nth-child(4)').textContent;
		            versionEditField.value = row.querySelector('td:nth-child(5)').textContent;
		            editModal.style.display = 'block';
		        }
		    });

		    // 수정 모달 닫기 버튼 클릭 시
		    closeEditBtn.addEventListener('click', function() {
		        editModal.style.display = 'none';
		    });

		    // 테이블에서 삭제 버튼 클릭 시 삭제 모달창 열기
		    document.querySelector('#productTable tbody').addEventListener('click', function(e) {
		        if (e.target.textContent === '삭제') {
		            var row = e.target.closest('tr');
		            bomIdDeleteField.value = row.querySelector('[name="bom_id"]').value;
		            deleteModal.style.display = 'block';
		        }
		    });

		    // 삭제 모달 닫기 버튼 클릭 시
		    closeDeleteBtn.addEventListener('click', function() {
		        deleteModal.style.display = 'none';
		    });

		    // 모달 외부 클릭 시 닫기
		    window.addEventListener('click', function(event) {
		        if (event.target === editModal) {
		            editModal.style.display = 'none';
		        } else if (event.target === deleteModal) {
		            deleteModal.style.display = 'none';
		        }
		    });

		    // 수정 폼 제출 이벤트 처리
		    editForm.addEventListener('submit', function(e) {
		        e.preventDefault();
		        // 수정 데이터를 서버로 전송하는 로직 추가
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', '/gaw/bomupdate', true);
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		        xhr.onreadystatechange = function() {
		            if (xhr.readyState === 4 && xhr.status === 200) {
		                alert('수정 완료');
		                editModal.style.display = 'none';
		                location.reload();
		            }
		        };
		        var data = 'bom_id=' + encodeURIComponent(bomIdEditField.value) +
		                   '&material_name=' + encodeURIComponent(materialNameEditField.value) +
		                   '&quantity=' + encodeURIComponent(quantityEditField.value) +
		                   '&version=' + encodeURIComponent(versionEditField.value);
		        xhr.send(data);
		    });

		    // 삭제 폼 제출 이벤트 처리
		    deleteForm.addEventListener('submit', function(e) {
		        e.preventDefault();
		        // 삭제 데이터를 서버로 전송하는 로직 추가
		        var xhr = new XMLHttpRequest();
		        xhr.open('POST', '/bomdelete', true);
		        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		        xhr.onreadystatechange = function() {
		            if (xhr.readyState === 4 && xhr.status === 200) {
		                alert('삭제 완료');
		                deleteModal.style.display = 'none';
		                location.reload();
		            }
		        };
		        var data = 'bom_id=' + encodeURIComponent(bomIdDeleteField.value);
		        xhr.send(data);
		    });
		});
        // 수정 모달 열기
        function openEditModal(bomId, materialName, quantity, version) {
            document.getElementById('bomIdEdit').value = bomId;
            document.getElementById('materialNameEdit').value = materialName;
            document.getElementById('quantityEdit').value = quantity;
            document.getElementById('versionEdit').value = version;
            document.getElementById('editModal').style.display = 'block';
        }

        // 수정 모달 닫기
        document.querySelector('.close-edit').onclick = function() {
            document.getElementById('editModal').style.display = 'none';
        };

        // 수정 폼 제출 처리
        document.getElementById('editForm').addEventListener('submit', function(e) {
            e.preventDefault();
            // 서버로 수정 요청을 보냄 (Ajax)
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/gaw/bomupdate', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    alert('수정 완료');
                    document.getElementById('editModal').style.display = 'none';
                    location.reload();
                }
            };
            var data = 'bom_id=' + encodeURIComponent(document.getElementById('bomIdEdit').value) +
                       '&material_name=' + encodeURIComponent(document.getElementById('materialNameEdit').value) +
                       '&quantity=' + encodeURIComponent(document.getElementById('quantityEdit').value) +
                       '&version=' + encodeURIComponent(document.getElementById('versionEdit').value);
            xhr.send(data);
        });
	</script>

</body>

</html>