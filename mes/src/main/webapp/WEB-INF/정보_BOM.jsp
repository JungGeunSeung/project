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
	<script src="/mes/JavaScript/load_info.js"></script>
	<title>소원을 들어주는 MES</title>

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
</head>

<body>
	<!-- 사이드바 -->
	<jsp:include page="assetsform/sidebar.jsp"/>
	
	<!-- 	상단바 -->
	<jsp:include page="assetsform/topbar.jsp"/>

	<!-- 메인메뉴 아레 정보가 표시될 영역 -->
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
			<form method="get" action="list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<span class="newbtn"><a href="create" class="newbtn">새로 작성</a></span>
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
					<th>BOM 코드</th>
					<th>상품 코드</th>
					<th>자재 코드</th>
					<th style="width:200px">제품별 자재 사용개수</th>
					<th style="width:100px"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bom" items="${ map.list }">
					<tr>
						<td><input type="checkbox" id="selectchk"></td>

						<c:url var="read" value="read">
							<c:param name="bom_id" value="${ bom.bom_id }" />
							<c:param name="production_id" value="${ bom.production_id }" />
						</c:url>

						<td>${ bom.bom_id } </td>
						<td><a href="${ read }" id="underline">${ bom.production_id }</a> </td>
						<td>${ bom.mid } </td>
						<td>${ bom.bom_quantity } </td>
						<c:url var="modify" value="/BOM/modify">
							<c:param name="bom_id" value="${ bom.bom_id }" />
							<c:param name="production_id" value="${ bom.production_id }" />
							<c:param name="mid" value="${ bom.mid }" />
							<c:param name="bom_quantity" value="${ bom.bom_quantity }" />
						</c:url>
						<c:url var="delete" value="/BOM/delete">
							<c:param name="bom_id" value="${ bom.bom_id }" />
						</c:url>
						<td class="modifyTD"><a href="${ modify }" id="modiA">수정</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

		<div>
			<hr>
			<div class="pagenum">
				<% Map map=(Map)request.getAttribute("map"); int
					totalCount=(int)map.get("totalCount"); String
					str_countPerPage=(String)request.getAttribute("countPerPage"); int
					countPerPage=Integer.parseInt(str_countPerPage); String
					str_pageNo=(String)request.getAttribute("page"); int
					pageNo=Integer.parseInt(str_pageNo); int lastPage=(int)Math.ceil(
					(double)totalCount / (double)countPerPage ); int countPerSection=3; int
					position=(int)Math.ceil((double)pageNo / (double)countPerSection); int
					sec_first=( ( position - 1 ) * countPerSection ) + 1; int sec_last=position *
					countPerSection; if(sec_last> lastPage) {
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
	</div>
	<script src="/mes/JavaScript/table.js"></script>
	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/date.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>