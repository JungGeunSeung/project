<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/mes/CSS/button.css">
	<link rel="stylesheet" href="/mes/CSS/calender.css">
	<link rel="stylesheet" href="/mes/CSS/common.css">
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/sidebar.css">
	<link rel="stylesheet" href="/mes/CSS/table.css">
	<link rel="stylesheet" href="/mes/CSS/topbar.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	
	<title>품질관리/생산검사현황> 검색</title>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />


	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1><a href="/mes/quality/list">Quality</a></h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>품질관리 생산검사현황을 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="생산검사현황_Quality_SelectForm.jsp">
			<jsp:param name="select" value="select" />
		</jsp:include>

		<div>
			<form method="get" action="/mes/quality/list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<a href="/mes/BOM/create" class="newbtn">새로 작성</a>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
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
					<th>품질검사 ID</th>
					<th>제품 ID</th>
					<th>계획 ID</th>
					<th>검사 날짜</th>
					<th>검사 결과</th>
					<th>불량 수량</th>
					<th>불량 유형</th>
					<th>결과 ID</th>
					<th>작업 ID</th>


				</tr>
			</thead>
			<tbody>
				<c:forEach var="quality" items="${ quality }">
					<tr>
						<td><input type="checkbox" id="allchk"></td>

						<c:url var="read" value="/quality/read">
							<c:param name="ins_id" value="${ quality.ins_id }" />
							<c:param name="production_id" value="${ quality.production_id }" />
						</c:url>

						<td>${ quality.ins_id }</td>
						<td>${ quality.planid }</td>
						<td>${ quality.ins_date }</td>
						<td>${ quality.result }</td>
						<td>${ quality.defect_count }</td>
						<td>${ quality.defect_cause }</td>
						<td>${ quality.resultID }</td>
						<td>${ quality.taskid }</td>
						<c:url var="modify" value="/quality/modify">
							<c:param name="ins_id" value="${ quality.ins_id }" />
							<c:param name="production_id" value="${ quality.production_id }" />
							<c:param name="planid" value="${ quality.planid }" />
							<c:param name="ins_date" value="${ quality.ins_date }" />
							<c:param name="result" value="${ quality.result }" />
							<c:param name="defect_count" value="${ quality.defect_count }" />
							<c:param name="defect_cause" value="${ quality.defect_cause }" />
							<c:param name="resultid" value="${ quality.resultID }" />
							<c:param name="taskid" value="${ quality.taskid }" />
						</c:url>
						<c:url var="delete" value="/quality/delete">
							<c:param name="ins_id" value="${ quality.ins_id }" />
						</c:url>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>

	<script src="/mes/JavaScript/table.js"></script>
	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/date.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>