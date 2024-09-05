<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	<link rel="stylesheet" href="/mes/CSS/read.css">
	<link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
	<script src="/mes/JavaScript/load_info.js"></script>
	<title>소원을 들어주는 MES</title>

	<style>
		#readtable {
			border-collapse: collapse;
			text-align: center;
			background-color: rgba(173, 216, 230, 0.3);
			border: 1px solid black;
			width: 400px;
		}

		#readtable td {
			border: 1px solid black;
			padding: 5px
		}

		#readtable th {
			background-color: rgb(135, 206, 250);
			color: white;
			font-size: 20px;
			border: 1px solid black;
			padding: 0px 10px;
		}

		#readtable tr:nth-child(2n) {
			background-color: rgba(173, 216, 230, 0.2);
		}

		#readtable tr td:nth-child(1) {
			background-color: rgb(173, 216, 230);
		}

		#prodTD {
			background-color: rgb(135, 206, 250);
		}
	</style>
	<script>
		document.addEventListener('DOMContentLoaded', function () {
			const modal = document.querySelector('.bom_modal');
			const btns = document.querySelector('.bom_modal_btn');
			const closeModal = document.querySelector('.closeModal');
			const tds = document.querySelectorAll('.tdDoc');

			btns.addEventListener("click", function () {
				document.getElementById('document_id').textContent = tds[0].textContent.trim();
				document.getElementById('userid').textContent = tds[1].textContent.trim();
				document.getElementById('input_document_id').value = tds[0].textContent.trim();
				document.getElementById('input_userid').value = tds[1].textContent.trim();
				document.getElementById('title').value = tds[2].textContent.trim();
				document.getElementById('content').value = tds[3].textContent.trim();

				let created_date = tds[4].textContent.trim();
				const cDate = new Date(created_date);
				let updated_date = tds[5].textContent.trim();
				const uDate = new Date(updated_date);

				let cyyyy = cDate.getFullYear();
				let cmm = String(cDate.getMonth() + 1).padStart(2, '0');
				let cdd = String(cDate.getDate()).padStart(2, '0');
				const create = `\${cyyyy}-\${cmm}-\${cdd}`;

				let pyyyy = uDate.getFullYear();
				let pmm = String(uDate.getMonth() + 1).padStart(2, '0');
				let pdd = String(uDate.getDate()).padStart(2, '0');
				const update = `\${pyyyy}-\${pmm}-\${pdd}`; // 여기를 수정했습니다

				document.getElementById('created_date').value = create;
				document.getElementById('updated_date').value = update;

				document.getElementById('version').value = tds[6].textContent.trim();
				modal.style.display = "flex";
			});

			// 닫기 버튼 클릭 시 모달창 닫기
			closeModal.addEventListener("click", function () {
				modal.style.display = "none";
			});

			// 모달창 외부 클릭 시 모달창 닫기
			window.addEventListener("click", function (event) {
				if (event.target === modal) {
					modal.style.display = "none";
				}
			});

			document.querySelector('.modifyModal').addEventListener('click', function () {
				document.querySelector('#modalForm').submit();
			})

			document.querySelector('#dleForm').onsubmit = function (event) {
				if (!confirm("정말로 삭제하시겠습니까?")) {
					event.preventDefault();
				} else {
					alert("삭제 되었습니다. 문서번호 : " + tds[0].textContent.trim());
				}

			};
		});


	</script>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="contentDiv">
		<div class="searchID">
			<!-- 해당 페이지의 제목 -->
			<h1><a href="/mes/doc/list">문서관리</a></h1>
			<!-- 해당 페이지의 설명 -->
			<div class="subhead">
				<span>회사에서 사용하는 문서들을 관리하는 페이지입니다.</span> <br>
			</div>
			<!-- 게시물의 개수를 표시할 select -->
		</div>

		<!-- 해당 목록 -->
		<c:url var="list1" value="/doc/list" />
		<a href="${ list1 }" class="btn">돌아가기</a>

		<button class="btn bom_modal_btn">수정하기</button>
		<div id="dleForm">
			<form id="dleForm" method="post" action="delete">
				<input type="hidden" name="document_id" value="${doc.document_id}">
				<input type="submit" value="삭제하기" class="btn dlebtn">
			</form>
		</div>
		<div>
			<table id="readtable">
				<tr>
					<td style="width: 60px">NO</td>
					<td class="tdDoc">${doc.document_id}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td class="tdDoc">${doc.userid}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td class="tdDoc">${doc.title}</td>
				</tr>
				<tr>
					<td>내용</td>
					<td class="tdDoc">${doc.content}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td class="tdDoc">${doc.created_date}</td>
				</tr>
				<tr>
					<td>수정일</td>
					<td class="tdDoc">${doc.updated_date}</td>
				</tr>
				<tr>
					<td>Ver</td>
					<td class="tdDoc">${doc.version}</td>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="modify">
				<table id="modalTable">
					<tr>
						<td style="width: 60px">NO</td>
						<td><span id="document_id"></span><input type="hidden" name="document_id"
								id="input_document_id"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><span id="userid"></span><input type="hidden" name="userid"
								id="input_userid">
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" rows="4" cols="50"></textarea>
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="date" name="created_date" id="created_date"></td>
					</tr>
					<tr>
						<td>수정일</td>
						<td><input type="date" name="updated_date" id="updated_date"></td>
					</tr>
					<tr>
						<td>Ver</td>
						<td><input type="number" name="version" id="version"></td>
					</tr>
				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>