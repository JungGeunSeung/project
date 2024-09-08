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
	
	<title>정보/BOM > 문서관리 > 검색</title>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />

	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1><a href="/mes/BOM/list">문서관리</a></h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>회사에서 사용하는 문서들을 관리하는 페이지입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->

		<div>
			<form method="get" action="/mes/doc/list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="title_id" placeholder="문서명을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<a href="/mes/doc/list" class="newbtn">목록으로 돌아가기</a>
			<button class="newbtn createBtn">새로 작성</button>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th>NO</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>Ver</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${ doc != null }">
					<c:forEach var="bom" items="${ doc }">
						<tr>
							<c:url var="read" value="/doc/read">
								<c:param name="document_id" value="${ bom.document_id }" />
							</c:url>
							<td>${ bom.userid } </td>
							<td><a href="${ read }" id="underline">${ bom.document_id }</a> </td>
							<td>${ bom.title } </td>
							<td>${ bom.content } </td>
							<td>${ bom.created_date } </td>
							<td>${ bom.updated_date } </td>
							<td>${ bom.version } </td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${ empty doc}">
					<tr>
						<td colspan="9">
							조회된 항목이 없습니다.
						</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
	<hr>
<!-- 	모달창 -->
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
	<!-- 	두번째 모달창 -->
	<div class="bom_modal_create">
		<div class="bom_modal_body_create">
			<form id="createmodalForm" method="post" action="create">
				<table id="createModalTable">
					<tr>
						<td style="width: 60px">NO</td>
						<td>문서번호는 자동으로 생성 됩니다.</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="userid" id="create_userid"></td>
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
			<div class="createModal" onclick="createSubmit()">생성하기</div>
			<div class="createCloseModal">닫기</div>
		</div>
	</div>

	<script src="/mes/JavaScript/정보_BOM문서관리_modal.js"></script>
	<script src="/mes/JavaScript/table.js"></script>
	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/date.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>