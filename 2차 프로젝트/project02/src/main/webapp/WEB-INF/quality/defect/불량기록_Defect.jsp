<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link rel="stylesheet" href="/mes/CSS/Qualitymodal.css">

<title>품질관리 불량기록</title>
<link rel="stylesheet" href="button.css">
<style>
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
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

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}
#modiA {
	color: rgb(0, 51, 102);
	background-color: rgb(173, 216, 230);
	padding: 1px 5px;
	border-radius: 4px;
	border: 1px solid rgb(173, 216, 225);
}
</style>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1>불량 기록</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>품질관리 불량기록을 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="불량기록_Defect_SelectForm.jsp">
			<jsp:param name="select" value="select" />
		</jsp:include>
		<div>
			<form method="get" action="/mes/defect/list/search">
				<span>상품코드로 검색</span> <input type="text" name="production_id"
					placeholder=" "> <input type="submit" value="검색"
					class="btn">
			</form>
			<button class="newbtn" onclick="add()">새로 작성</button>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
		</div>
	</div>

	<div id="addRowModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>추가할 품질 정보 입력</h2>
			<form id="addRowForm"  method="POST" action="/mes/defect/create">
				<label for="prodNum">불량기록 ID :</label> <input type="text"
					id="prodNum" name="report_id" required><br>
					 <label
					for="LOTNum">품질검사 ID : </label> <input type="text" id="LOTNum"
					name="ins_id" required><br> 
					<label for="prodName">제품
					ID :</label> <input type="text" id="prodName" name="production_id" required><br>
				<label for="prodName">계획 ID : </label> <input type="text"
					id="prodName" name="planid" required><br> 
				<label for="count">불량수량 :</label> <input type="number" id="count"
					name="defect_count" required><br>


				<button type="submit">추가</button>
			</form>
		</div>
	</div>
<!-- 		모달창 -->
	<div class="quality_modal">
		<div class="quality_modal_body">
			<form id="modalForm" method="post" action="/mes/defect/modify">
				<table id="modalTable">
					<tr>
						<td>불량기록 ID </td>
						<td><span id="report_id"></span><input type="hidden" name="report_id"
								id="input_report_id"></td>
					</tr>
					<tr>
						<td>품질검사 ID</td>
						<td><input type="text" name="ins_id" id="ins_id">
						</td>
					</tr>
					<tr>
						<td>제품 ID</td>
						<td><input type="text" name="production_id" id="production_id"></td>
					</tr>
					<tr>
					<tr>
						<td>계획 ID</td>
						<td><input type="text" name="planid" id="planid"></td>
					</tr>
						<td>불량 수량</td>
						<td><input type=number" name="defect_count" id="defect_count"></td>
					</tr>
				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="allchk"></th>
                    <th>불량기록 ID</th>
                    <th>품질검사 ID</th>
                    <th>제품 ID</th>
                    <th>계획 ID</th>
                    <th>불량 수량</th>
					<th style="width: 100px">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${ map.list }">
					<tr>
						<td><input type="checkbox" class="selectchk"></td>

						<c:url var="read" value="read">
							<c:param name="ins_id" value="${ dto.ins_id }" />
							<c:param name="production_id" value="${ dto.production_id }" />
						</c:url>

						<td id="deID">${ dto.report_id }</td>
						<td>${ dto.ins_id }</td>
						<td>${ dto.production_id }</td>
						<td>${ dto.planid }</td>
						<td>${ dto.defect_count }</td>
						<td><button class="quality_modal_btn">수정</button></td>
					</tr>

				</c:forEach>
			</tbody>

		</table>

		<div>
			<hr>
			<div class="pagenum">
				<%
				Map map = (Map) request.getAttribute("map");

				int totalCount = (int) map.get("totalCount");

				String str_countPerPage = (String) request.getAttribute("countPerPage");
				int countPerPage = Integer.parseInt(str_countPerPage);

				String str_pageNo = (String) request.getAttribute("page");
				int pageNo = Integer.parseInt(str_pageNo);

				int lastPage = (int) Math.ceil((double) totalCount / (double) countPerPage);

				int countPerSection = 3;
				int position = (int) Math.ceil((double) pageNo / (double) countPerSection);
				int sec_first = ((position - 1) * countPerSection) + 1;
				int sec_last = position * countPerSection;
				if (sec_last > lastPage) {
					sec_last = lastPage;
				}
				%>
				<c:set var="lastPage" value="<%=lastPage%>" scope="page" />
				<c:set var="countPerSection" value="<%=countPerSection%>"
					scope="page" />
				<a href="list?page=${ pageNo - 1 }&countPerPage=${countPerPage}">이전</a>
				<c:forEach var="i" begin="1" end="${ lastPage }">
					<c:if test="${ i eq pageNo }">
						<a href="list?page=${i}&countPerPage=${countPerPage}"><strong>[${i}]</strong></a>
					</c:if>
					<c:if test="${ !(i eq pageNo) }">
						<a href="list?page=${i}&countPerPage=${countPerPage}">[${i}]</a>
					</c:if>
				</c:forEach>
				<a href="list?page=${ pageNo + 1 }&countPerPage=${countPerPage}">다음</a>
			</div>

		</div>
</body>
<script>

var modal = document.getElementById("addRowModal");

var addButton = document.querySelector("button[onclick='add()']");

var span = document.getElementsByClassName("close")[0];

addButton.onclick = function() {
	modal.style.display = "block";
}

span.onclick = function() {
	var form = document.getElementById("addRowForm");
	modal.style.display = "none";
	form.reset();
}

window.onclick = function(event) {
	if (event.target == modal) {
		var form = document.getElementById("addRowForm");
		modal.style.display = "none";
		form.reset();
	}
}
function add() {
	modal.style.display = "block";
}
function delchk() {
	let selectchk = document.querySelectorAll('.selectchk');
	let deIDs = [];

	for (let checkbox of selectchk) {
		if (checkbox.checked) {
			let row = checkbox.closest('tr');  
			let deID = row.querySelector('#deID');  
			if (deID) {
				deIDs.push(deID.textContent);  
			}
		}
	}
	if (deIDs.length > 0) {
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/mes/Defect/deleteSelect", true);  
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		xhr.send("deIDs=" + encodeURIComponent(deIDs.join(',')));

		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log("서버로부터 응답:", xhr.responseText);
			}
		};
	} else {
		alert("선택된 항목이 없습니다.");
	}

	window.location.href = "/mes/defect/list";
}



const modal1 = document.querySelector('.quality_modal');
const btns = document.querySelectorAll('.quality_modal_btn');
const closeModal = document.querySelector('.closeModal');

// 모든 수정 버튼에 클릭 이벤트 리스너 추가
btns.forEach(function (btn) {
	btn.addEventListener("click", function () {
		const tr = btn.closest('tr');
		const tds = tr.querySelectorAll('td');
		console.log(tds);
		document.getElementById('input_report_id').value = tds[1].textContent.trim();
		document.getElementById('report_id').textContent = tds[1].textContent.trim();
		document.getElementById('ins_id').value = tds[2].textContent.trim();
		document.getElementById('production_id').value = tds[3].textContent.trim();
		document.getElementById('planid').value = tds[4].textContent.trim();
		document.getElementById('defect_count').value = tds[5].textContent.trim();

		modal1.style.display = "flex";
	});
});

// 닫기 버튼 클릭 시 모달창 닫기
closeModal.addEventListener("click", function () {
	modal1.style.display = "none";
});

// 모달창 외부 클릭 시 모달창 닫기
window.addEventListener("click", function (event) {
	if (event.target === modal1) {
		modal1.style.display = "none";
	}
});

document.querySelector('.modifyModal').addEventListener('click', function () {
	document.querySelector('#modalForm').submit();
});
</script>
<script src="/mes/JavaScript/table.js"></script>

</html>