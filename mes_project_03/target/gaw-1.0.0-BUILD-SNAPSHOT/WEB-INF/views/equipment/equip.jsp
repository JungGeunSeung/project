<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.gaw.dto.PaginationDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <title>제목</title>
    <style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}
    </style>
</head>

<body>
<%
    // 모델에서 PaginationDTO 객체 가져오기
    PaginationDTO pagination = (PaginationDTO) request.getAttribute("pagination");

    // PaginationDTO의 값을 getter 메서드로 가져옵니다.
    int currentPage = pagination.getCurrentPage();
    int startPage = pagination.getStartPage();
    int endPage = pagination.getEndPage();
    int totalPages = pagination.getTotalPages();
    int countPerPage = pagination.getCountPerPage();
    boolean hasPrev = pagination.isHasPrev();
    boolean hasNext = pagination.isHasNext();
    int prevPage = pagination.getPrevPage();
    int nextPage = pagination.getNextPage();
%>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-- 메뉴바 -->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
	<!-- 메인 영역 -->
    <article>
    <h2 class="pageTitle">설비관리</h2>
    <span class="pageDescription">설비를 등록, 관리하는 페이지 입니다.</span>
    
    <div class="search-type">
    	<div class="equipSearch">
			<form id="searchForm" action="equip" method="get">
				<input id="selectequip" type="hidden" name="equip_id" value="">
				
				<select name="searchType" id="searchType">
					<option value="equip_id" ${param.searchType == 'equip_id' ? 'selected' : ''}>설비코드</option>
					<option value="name" ${param.searchType == 'name' ? 'selected' : ''}>설비명</option>
				</select>
				
				<input id="searchInputText" type="text" name="searchKeyword" placeholder="검색어를 입력하세요." value="${param.searchKeyword}" />
				<button type="submit" class="btn">
					<span>조회</span>
				</button>
	
				<!-- 페이지 이동 시에도 검색 정보가 유지되도록 hidden 필드 추가 -->
				<input type="hidden" name="countPerPage"
					value="${pagination.countPerPage}" /> <input type="hidden"
					name="page" value="${pagination.currentPage}" />
			</form>
		</div>
		
		<div class="equipType">
			<span>설비유형</span>
			<form id="searchForm" action="equip" method="get">
				<input type="hidden" name="searchType" value="type">
				<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
					<c:forEach var="list" items="${listType}">
						<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
					</c:forEach>
				</select>
			</form>
		</div>
		
		<div class="equipLocation">
			<span>설비유형</span>
			<form id="searchForm" action="equip" method="get">
				<input type="hidden" name="searchType" value="Location">
				<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
					<c:forEach var="list" items="${listLocation}">
						<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
					</c:forEach>
				</select>
			</form>
		</div>
		
		<div class="equipStatus">
			<span>설비유형</span>
			<form id="searchForm" action="equip" method="get">
				<input type="hidden" name="searchType" value="status">
				<select name="searchKeyword" id="searchType" onchange="this.form.submit()">
					<c:forEach var="list" items="${listStatus}">
						<option value="${list}" ${param.searchType == list ? 'selected' : ''}>${list}</option>
					</c:forEach>
				</select>
			</form>
		</div>
		<div>
			<form id="countPerPageForm"
				action="equip?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}"
				method="get">
				<select name="countPerPage" id="countPerPage"
					onchange="this.form.submit()">
					<option value="5"
						${pagination.countPerPage == 5 ? 'selected' : ''}>5개씩</option>
					<option value="10"
						${pagination.countPerPage == 10 ? 'selected' : ''}>10개씩</option>
					<option value="15"
						${pagination.countPerPage == 15 ? 'selected' : ''}>15개씩</option>
					<option value="20"
						${pagination.countPerPage == 20 ? 'selected' : ''}>20개씩</option>
					<option value="30"
						${pagination.countPerPage == 30 ? 'selected' : ''}>30개씩</option>
					<option value="40"
						${pagination.countPerPage == 40 ? 'selected' : ''}>40개씩</option>
					<option value="50"
						${pagination.countPerPage == 50 ? 'selected' : ''}>50개씩</option>
				</select>
				<input type="hidden" name="page" value="${pagination.currentPage}" /> 
				<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
				<input type="hidden" name="searchType" value="${searchType}" />
			</form>
		</div>

	</div>
	
    <table>
    	<thead>
    		<tr>
    			<th>설비 코드</th>
    			<th>설비 명</th>
    			<th>설비 유형</th>
    			<th>위치</th>
    			<th>설비 상태</th>
    			<th>구매일자</th>
    			<th>최근 보수일자</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="list" items="${list}">
	    		<tr>
	    			<td>${list.equip_id}</td>
	    			<td>${list.name}</td>
	    			<td>${list.type}</td>
	    			<td>${list.location}</td>
	    			<td>${list.status}</td>
	    			<td>${list.purchase}</td>
	    			<td>${list.last}</td>
	    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    
    </article>
    <!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
</body>
</html>