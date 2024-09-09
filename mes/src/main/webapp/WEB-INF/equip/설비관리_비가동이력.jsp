<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>설비관리 > 비가동이력</title>
<link rel="stylesheet" href="button.css">
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">
		<!-- 해당 페이지의 제목 -->
		<h1>설비관리 > 비가동이력</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>생산 설비의 비가동 이력을 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<div class="cntdiv">
			<form method="post" action="Equip">
				<span>게시물</span> <select name="pageSize" id="cnt"
					onchange="this.form.submit()">
					<option value="10" selected>10개씩</option>
					<option value="20">20개씩</option>
					<option value="30">30개씩</option>
					<option value="40">40개씩</option>
					<option value="50">50개씩</option>
				</select> <input type="hidden" name="pageNumber" value="1"> <input
					type="hidden" name="action" value="changePageSize">
			</form>

			<form method="post" action="Equip">
				<span>날짜별 조회</span> <input type="date" name="startDate"
					id="startdate"> ~ <input type="date" name="endDate"
					id="enddate">
				<button type="submit" class="btn">검색</button>
				<input type="hidden" name="action" value="searchByDate">
			</form>

			<form method="post" action="/mes/equip/del">
				<button type="button" class="btn" onclick="openAddWindow()">추가</button>
				<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="allchk"></th>
					<th>번호</th>
					<th>설비번호</th>
					<th>비가동 사유</th>
					<th>비가동 이력</th>
				</tr>
			</thead>
			<tbody>
			<tbody>
				<c:forEach var="item" items="${nonOperHistoryList}">
					<tr>
						<td><input type="checkbox" name="chk" value="${item.equiID}"></td>
						<td>${item.resultID}</td>
						<td>${item.equiID}</td>
						<td>${item.downReason}</td>
						<td>${item.downtimeHistory}</td>
					</tr>
				</c:forEach>
			</tbody>

			</tbody>

		</table>
	</div>
	<div>
		<hr>
		<div class="pagenum">
			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="Equip?pageNumber=${i}&pageSize=${param.pageSize}">${i}</a>
			</c:forEach>
		</div>
	</div>
</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>

</html>
