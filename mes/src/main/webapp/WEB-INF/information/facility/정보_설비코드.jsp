<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
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
	<link rel="stylesheet" href="/mes/CSS/table.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
	<link rel="stylesheet" href="/mes/CSS/topbar.css">
	<link rel="stylesheet" href="/mes/CSS/sidebar.css">
	<title>정보/BOM > 설비코드</title>

	<style>
		.newbtn {
			display: inline;
			color: rgb(0, 51, 102);
			background-color: rgb(173, 216, 230);
			font-size: 16px;
			padding: 7px 10px;
			border-radius: 4px;
			border: 1px solid rgb(173, 216, 225);
			margin: 0px;
		}

		#modiA {
			color: rgb(0, 51, 102);
			background-color: rgb(173, 216, 230);
			padding: 1px 5px;
			border-radius: 4px;
			border: 1px solid rgb(173, 216, 225);
		}
	</style>
	<script>
		function delchk() {
			if (!confirm("정말로 삭제하시겠습니까?")) {
				event.preventDefault();
			} else {
			let selectchk = document.querySelectorAll('.selectchk');
			let equipIDs = [];

			// 체크된 체크박스에 대한 docID 수집
			for (let checkbox of selectchk) {
				if (checkbox.checked) {
					let row = checkbox.closest('tr');  // 체크박스가 포함된 <tr> 찾기
					let equipID = row.querySelector('#equipID');  // 해당 <tr> 내의 #docID 요소 찾기
					if (equipID) {
						equipIDs.push(equipID.textContent);  // docID 값을 배열에 추가
					}
				}
			}
			// docID 값들을 쉼표로 구분된 문자열로 서블릿에 전송
			if (equipIDs.length > 0) {
				let xhr = new XMLHttpRequest();
				xhr.open("POST", "/mes/Equip/deleteselect", true);  // 서블릿 URL로 POST 요청
				xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

				// 데이터를 쉼표로 구분된 문자열 형식으로 전송
				xhr.send("equipIDs=" + encodeURIComponent(equipIDs.join(',')));

				xhr.onreadystatechange = function () {
					if (xhr.readyState === 4 && xhr.status === 200) {
						// 서버 응답을 처리하는 부분 (성공시)
						console.log("서버로부터 응답:", xhr.responseText);
					}
				};
			} else {
				alert("선택된 항목이 없습니다.");
			}

			alert("삭제 되었습니다.");
			window.location.href = "/mes/Equip/list";
			}
		}



		document.addEventListener('DOMContentLoaded', function () {
			const modal = document.querySelector('.bom_modal');
			const btns = document.querySelectorAll('.bom_modal_btn');
			const closeModal = document.querySelector('.closeModal');

			// 모든 수정 버튼에 클릭 이벤트 리스너 추가
			btns.forEach(function (btn) {
				btn.addEventListener("click", function () {
					const tr = btn.closest('tr');
					const tds = tr.querySelectorAll('td');
					var equiIDInput = document.querySelector("#equiID");
				    var equinameInput = document.querySelector("#equiname");
				    var equiImgInput = document.querySelector("#equiImg");
				    var equiTypeInput = document.querySelector("#equiType");
				    var equiDescTextarea = document.querySelector("#equiDesc");
				    var sellDateInput = document.querySelector("#sellDate");
				    var equiLocInput = document.querySelector("#equiLoc");
				    var statusInput = document.querySelector("#status");
				    var useridInput = document.querySelector("#userid");
				    
				    equiIDInput.value = tds[1].textContent.trim();
			        equinameInput.value = tds[2].textContent.trim();
			        equiImgInput.value = tds[3].textContent.trim();
			        equiTypeInput.value = tds[4].textContent.trim();
			        equiDescTextarea.value = tds[5].textContent.trim();
			        sellDateInput.value = tds[6].textContent.trim();
			        equiLocInput.value = tds[7].textContent.trim();
			        statusInput.value = tds[8].textContent.trim();
			        useridInput.value = tds[9].textContent.trim();
						
					modal.style.display = "flex";
				});
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


			///////////////////// create modal js ///////////////////////////////////

			const createBtn = document.querySelector('.createBtn');
			const createModal = document.querySelector('.bom_modal_create');
			const createCloseModal = document.querySelector('.createCloseModal');

			createBtn.addEventListener('click', function () {
				createModal.style.display = "flex";
			})

			createCloseModal.addEventListener("click", function () {
				createModal.style.display = "none";
			});

			// 모달창 외부 클릭 시 모달창 닫기
			window.addEventListener("click", function (event) {
				if (event.target === createModal) {
					createModal.style.display = "none";
				}
			});

			// 수정하기 클릭시 form submit 하기
			document.querySelector('.createModal').addEventListener('click', function () {
				document.querySelector('#createmodalForm').submit();
			});

		});
	</script>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1><a href="/mes/Equip/list">설비코드</a></h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>제품을 생산하는 설비의 코드를 관리, 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="/WEB-INF/information/BOM/정보_BOM_SelectForm.jsp">
			<jsp:param name="select" value="select" />
		</jsp:include>

		<div>
			<form method="get" action="list/search">
				<span>설비명으로 검색</span>
				<input type="text" name="equiname" placeholder="설비명를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<div class="flex-container">
				<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
				<span><button class="newbtn createBtn">새로 작성</button></span>
			</div>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="allchk">
					</th>
                    <th>설비코드</th>
                    <th>설비 명</th>
                    <th>설비사진</th>
                    <th>설비유형</th>
                    <th>설비설명</th>
                    <th>구매일자</th>
                    <th>위치</th>
                    <th>상태</th>
                    <th>관리자</th>
                    <th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Equip" items="${ map.list }">
						<tr>
							<td><input type="checkbox" class="selectchk"></td>
	
							<c:url var="read" value="/Equip/read">
								<c:param name="equiID" value="${ Equip.equiID }" />
								<c:param name="equiname" value="${ Equip.equiname }" />
							</c:url>
							<td id="equipID">${ Equip.equiID }</td>
                        	<td><a href="${ read }">${ Equip.equiname }</a></td>
	                        <td>${ Equip.equiImg }</td>
	                        <td>${ Equip.equiType }</td>
	                        <td>${ Equip.equiDesc }</td>
	                        <td>${ Equip.sellDate }</td>
	                        <td>${ Equip.equiLoc }</td>
	                        <td>${ Equip.status }</td>
	                        <td>${ Equip.userid }</td>
							<td class="modifyTD"><button class="bom_modal_btn">수정</button></td>
						</tr>
					</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 	페이징 넘버 -->
	<div>
		<hr>
		<div class="pagenum">
			<% Map map=(Map)request.getAttribute("map"); int totalCount=(int)map.get("totalCount");
				String str_countPerPage=(String)request.getAttribute("countPerPage"); int
				countPerPage=Integer.parseInt(str_countPerPage); String
				str_pageNo=(String)request.getAttribute("page"); int
				pageNo=Integer.parseInt(str_pageNo); int lastPage=(int)Math.ceil( (double)totalCount
				/ (double)countPerPage ); int countPerSection=3; int
				position=(int)Math.ceil((double)pageNo / (double)countPerSection); int sec_first=( (
				position - 1 ) * countPerSection ) + 1; int sec_last=position * countPerSection;
				if(sec_last> lastPage) {
				sec_last = lastPage;
				}
				%>
				<c:set var="lastPage" value="<%= lastPage %>" scope="page" />
				<c:set var="countPerSection" value="<%= countPerSection %>" scope="page" />
				<a href="list?page=${ page - 1 }&countPerPage=${countPerPage}">이전</a>
				<c:forEach var="i" begin="1" end="${ lastPage }">
					<c:if test="${ i eq page }">
						<a
							href="list?page=${i}&countPerPage=${countPerPage}"><strong>[${i}]</strong></a>
					</c:if>
					<c:if test="${ !(i eq page) }">
						<a href="list?page=${i}&countPerPage=${countPerPage}">[${i}]</a>
					</c:if>
				</c:forEach>
				<a href="list?page=${ page + 1 }&countPerPage=${countPerPage}">다음</a>
		</div>
	</div>
	<!-- 		모달창 -->
	<div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="/mes/Equip/modify">
				<table id="modalTable">
					<tr>
					    <td>설비코드</td>
					    <td><input type="text" id="equiID" name="equiID" value="${ Equip.equiID }" /></td>
					</tr>
					<tr>
					    <td>설비 명</td>
					    <td><input type="text" id="equiname" name="equiname" value="${ Equip.equiname }" /></td>
					</tr>
					<tr>
					    <td>설비사진</td>
					    <td><input type="text" id="equiImg" name="equiImg" value="${ Equip.equiImg }" /></td>
					</tr>
					<tr>
					    <td>설비유형</td>
					    <td><input type="text" id="equiType" name="equiType" value="${ Equip.equiType }" /></td>
					</tr>
					<tr>
					    <td>설비설명</td>
					    <td><textarea id="equiDesc" name="equiDesc" rows="4" cols="50">${ Equip.equiDesc }</textarea></td>
					</tr>
					<tr>
					    <td>구매일자</td>
					    <td><input type="date" id="sellDate" name="sellDate" value="${ Equip.sellDate }" /></td>
					</tr>
					<tr>
					    <td>위치</td>
					    <td><input type="text" id="equiLoc" name="equiLoc" value="${ Equip.equiLoc }" /></td>
					</tr>
					<tr>
					    <td>상태</td>
					    <td><input type="text" id="status" name="status" value="${ Equip.status }" /></td>
					</tr>
					<tr>
					    <td>관리자</td>
					    <td><input type="text" id="userid" name="userid" value="${ Equip.userid }" /></td>
					</tr>

				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
	<!-- 	두번째 모달창 -->
	<div class="bom_modal_create">
		<div class="bom_modal_body_create">
			<form id="createmodalForm" method="post" action="create">
				<table id="modalTable">
					<tr>
					    <td>설비코드</td>
					    <td>설비코드는 자동 생성됩니다.</td>
					</tr>
					<tr>
					    <td>설비 명</td>
					    <td><input type="text" id="equiname" name="equiname" value="${ Equip.equiname }" /></td>
					</tr>
					<tr>
					    <td>설비사진</td>
					    <td><input type="text" id="equiImg" name="equiImg" value="${ Equip.equiImg }" /></td>
					</tr>
					<tr>
					    <td>설비유형</td>
					    <td><input type="text" id="equiType" name="equiType" value="${ Equip.equiType }" /></td>
					</tr>
					<tr>
					    <td>설비설명</td>
					    <td><textarea id="equiDesc" name="equiDesc" rows="4" cols="50">${ Equip.equiDesc }</textarea></td>
					</tr>
					<tr>
					    <td>구매일자</td>
					    <td><input type="date" id="sellDate" name="sellDate" value="${ Equip.sellDate }" /></td>
					</tr>
					<tr>
					    <td>위치</td>
					    <td><input type="text" id="equiLoc" name="equiLoc" value="${ Equip.equiLoc }" /></td>
					</tr>
					<tr>
					    <td>상태</td>
					    <td><input type="text" id="status" name="status" value="${ Equip.status }" /></td>
					</tr>
					<tr>
					    <td>관리자</td>
					    <td><input type="text" id="userid" name="userid" value="${ Equip.userid }" /></td>
					</tr>

				</table>
			</form>
			<div class="createModal" onclick="createSubmit()">생성하기</div>
			<div class="createCloseModal">닫기</div>
		</div>
	</div>

	<script src="/mes/JavaScript/table.js"></script>
	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>