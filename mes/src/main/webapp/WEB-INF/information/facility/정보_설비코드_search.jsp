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
	
	<title>정보/BOM > 설비코드 > 검색</title>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1><a href="/mes/equip/list">설비코드</a></h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>제품을 생산하는 설비의 코드를 관리, 조회하는 페이지 입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="/WEB-INF/information/BOM/정보_BOM_SelectForm.jsp">
			<jsp:param name="select" value="select" />
		</jsp:include>

		<div>
			<form method="get" action="/mes/Equip/list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<a href="/mes/Equip/list" class="newbtn">목록으로 가기</a>
			<button class="newbtn createbtn">새로 작성</button>
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
				<c:if test="${ Equip != null }">
					<c:forEach var="Equip" items="${ Equip }">
						<tr>
							<td><input type="checkbox" class="selectchk"></td>
	
							<c:url var="read" value="/Equip/read">
								<c:param name="equiID" value="${ Equip.equiID }" />
								<c:param name="equiname" value="${ Equip.equiname }" />
							</c:url>
							<td>${ Equip.equiID }</td>
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
				</c:if>
				<c:if test="${ empty Equip }">
					
				</c:if>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="modify">
				<table id="modalTable">
					
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