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
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/sidebar.css">
	<link rel="stylesheet" href="/mes/CSS/table.css">
	<link rel="stylesheet" href="/mes/CSS/topbar.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
	
	<title>정보/BOM > BOM코드 > 검색</title>
	
	<style>
	#tableID {
		
	}
	</style>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1><a href="/mes/BOM/list">BOM</a></h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>제품의 BOM을 조회하는 페이지입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="정보_BOM_SelectForm.jsp">
			<jsp:param name="select" value="select" />
		</jsp:include>

		<div>
			<form method="get" action="/mes/BOM/list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<a href="/mes/BOM/list" class="newbtn">목록으로 가기</a>
			<button class="newbtn createbtn">새로 작성</button>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th>BOM 코드</th>
					<th>상품 코드</th>
					<th>자재 코드</th>
					<th style="width:200px">제품별 자재 사용개수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${ bom != null }">
					<c:forEach var="bom" items="${ bom }">
						<tr>
	
							<c:url var="read" value="/BOM/read">
								<c:param name="bom_id" value="${ bom.bom_id }" />
								<c:param name="production_id" value="${ bom.production_id }" />
							</c:url>
	
							<td>${ bom.bom_id } </td>
							<td><a href="${ read }" id="underline">${ bom.production_id }</a> </td>
							<td>${ bom.mid } </td>
							<td>${ bom.bom_quantity } </td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ empty bom }">
					<tr>
						<td colspan="6">
							조회된 항목이 없습니다.
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="modify">
				<table id="modalTable">
					<tr>
						<td>BOM 코드</td>
						<td><span id="bom_id"></span><input type="hidden" name="bom_id"
								id="input_bom_id"></td>
					</tr>
					<tr>
						<td>상품 코드</td>
						<td><input type="text" name="production_id" id="production_id">
						</td>
					</tr>
					<tr>
						<td>자재 코드</td>
						<td><input type="text" name="mid" id="mid"></td>
					</tr>
					<tr>
						<td>재품별 자재 사용개수</td>
						<td><input type="number" name="bom_quantity" id="bom_quantity"></td>
					</tr>
				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>

	<script src="/mes/JavaScript/table.js"></script>
	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/date.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>