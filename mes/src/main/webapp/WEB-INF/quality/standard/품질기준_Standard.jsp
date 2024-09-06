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
<script src="/mes/JavaScript/load_info.js"></script>
<title>품질관리/줌질기준 > Standard코드</title>
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
</style>
</head>

<body>
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
	<!-- 	상단바 -->
	<jsp:include page="/WEB-INF/assetsform/topbar.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1>품질 관리</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>품질관리 시험기준을 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
			<jsp:include page="품질기준_Standard_SelectForm.jsp">
				<jsp:param name="select" value="select" />
			</jsp:include>

		<div>
			<form method="get" action="/mes/standard/list/search">
				<span>상품코드로 검색</span> <input type="text" name="production_id"
					placeholder="상품코드를 입력하세요."> <input type="submit" value="검색"
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
			<form id="addRowForm">
				<label for="prodNum">시험기준 ID :</label> <input type="text"
					id="prodNum" name="prodNum" required><br> <label
					for="LOTNum">품질기준 : </label> <input type="text" id="LOTNum"
					name="LOTNum" required><br> <label for="prodName">관리자
					 :</label> <input type="text" id="prodName" name="prodName" required><br>
					 <label for="prodName">인증기관
					: </label> <input type="text" id="prodName" name="prodName" required><br>
				<label for="date">인증날짜 :</label> <input type="date" id="date"
					name="date" required><br>
				


				<button type="button" onclick="submitAddRowForm()">추가</button>
			</form>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="allchk"></th>
					<th>시험기준 ID</th>
					<th>품질기준</th>
					<th>관리자</th>
					<th>인증기관</th>
					<th>인증날짜</th>
					<th style="width: 100px">수정</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="standard" items="${ map.list }">
					<tr>
						<td><input type="checkbox" class="selectchk"></td>

						<c:url var="read" value="read">
							<c:param name="quality_id" value="${ standard.quality_id }" />
							<c:param name="title" value="${ standard.title }" />
						</c:url>

					    

						<td id="stID">${ standard.quality_id }</td>
						<td>${ standard.title }</td>
						<td>${ standard.mgr }</td>
						<td>${ standard.insti }</td>
						<td>${ standard.revision }</td>
						<c:url var="modify" value="/standard/modify">
							<c:param name="quality_id" value="${ standard.quality_id }" />
						</c:url>
						<c:url var="delete" value="/standard/delete">
							<c:param name="ins_id" value="${ standard.quality_id }" />
						</c:url>
						<td class="modifyTD"><a href="${ modify }" id="modiA">수정</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
</div>
		
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

		
</body>
<script>
var modal = document.getElementById("addRowModal");

// Get the button that opens the modal
//var addButton = document.querySelector("button[onclick='addRow()']");
var addButton = document.querySelector("button[onclick='add()']");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
addButton.onclick = function() {
	modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	var form = document.getElementById("addRowForm");
	modal.style.display = "none";
	form.reset();
}

// When the user clicks anywhere outside of the modal, close it
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
	let stIDs = [];

	// 체크된 체크박스에 대한 docID 수집
	for (let checkbox of selectchk) {
		if (checkbox.checked) {
			let row = checkbox.closest('tr');  // 체크박스가 포함된 <tr> 찾기
			let stID = row.querySelector('#stID');  // 해당 <tr> 내의 #docID 요소 찾기
			if (stID) {
				stIDs.push(stID.textContent);  // docID 값을 배열에 추가
			}
		}
	}
	// docID 값들을 쉼표로 구분된 문자열로 서블릿에 전송
	if (stIDs.length > 0) {
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "/mes/Standard/deleteSelect", true);  // 서블릿 URL로 POST 요청
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		// 데이터를 쉼표로 구분된 문자열 형식으로 전송
		xhr.send("stIDs=" + encodeURIComponent(stIDs.join(',')));

		xhr.onreadystatechange = function () {
			if (xhr.readyState === 4 && xhr.status === 200) {
				// 서버 응답을 처리하는 부분 (성공시)
				console.log("서버로부터 응답:", xhr.responseText);
			}
		};
	} else {
		alert("선택된 항목이 없습니다.");
	}

	window.location.href = "/mes/standard/list";
}
</script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/load_info.js"></script>
</html>