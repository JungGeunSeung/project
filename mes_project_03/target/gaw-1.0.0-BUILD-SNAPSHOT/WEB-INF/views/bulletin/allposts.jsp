<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/CSS/category.css">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/loading.css">
<link rel="stylesheet" href="resources/CSS/btn.css">
<link rel="stylesheet" href="resources/CSS/table.css">
<link rel="stylesheet" href="resources/CSS/allposts.css">
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
<title>게시판</title>
<style>

.Announcement-Tr {
	background-color: rgba(231, 231, 231, 0.497);
	border-radius: 10px;
	color: rgb(143, 33, 33);
}

.postTitle {
	text-align: left;
}

.newPostIcon {
	font-size: 12px;
	margin-left: 15px;
	color: red;
	display: none;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<header>
		<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
	</header>

	<!-- 메뉴바 -->
	<nav>
		<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>

	<!-- 메인 콘텐츠 -->
	<article>
		<%
		Map<String, Object> pagination = (Map<String, Object>) request.getAttribute("pagination"); // pagination 객체 가져오기
		// Java 코드를 통해 pagination 값을 가져와서 사용할 준비를 합니다.
		int currentPage = (Integer) pagination.get("currentPage");
		int startPage = (Integer) pagination.get("startPage");
		int endPage = (Integer) pagination.get("endPage");
		int totalPages = (Integer) pagination.get("totalPages");
		int countPerPage = (Integer) pagination.get("countPerPage");
		boolean hasPrev = (Boolean) pagination.get("hasPrev");
		boolean hasNext = (Boolean) pagination.get("hasNext");
		int prevPage = (Integer) pagination.get("prevPage");
		int nextPage = (Integer) pagination.get("nextPage");
		%>
		<div class="container">
			<div class="newpost">
			<button class="btn newPostBtn"><sapn>글쓰기</sapn></button>
			<button class="btn newBoardBtn"><sapn>게시판 관리</sapn></button>
			</div>
			<h1>전체글</h1>
			<span>전체 글을 조회합니다.</span>
			<div class="search-bar">
				<div class="board-container">
					<button class="prev" id="prevBtn">«</button>
					<div class="board-list">
						<ul id="boardList">
							<li class="board-item">
								<button class="boardBtn" data-board-id="all"
									data-board-name="전체글" data-board-desc="전체 글을 조회합니다.">전체</button>
							</li>
							<c:forEach var="list" items="${board}">
								<li class="board-item">
									<button class="boardBtn" data-board-id="${list.board_id}"
										data-board-name="${list.board_name}"
										data- board-desc="${list.description}">
										${list.board_name}</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<button class="next" id="nextBtn">»</button>
				</div>
				<div class="search-type">
					<form id="searchForm" action="allposts" method="get">
						<input id="selectBoard_id" type="hidden" name="board_id" value="">
						<select name="searchType" id="searchType">
							<option value="title"
								${param.searchType == 'title' ? 'selected' : ''}>제목</option>
							<option value="author_id"
								${param.searchType == 'author_id' ? 'selected' : ''}>작성자</option>
						</select> <input id="searchInputText" type="text" name="searchKeyword" placeholder="검색어를 입력하세요."
							value="${param.searchKeyword}" />
						<button type="submit" class="btn">
							<span>조회</span>
						</button>

						<!-- 페이지 이동 시에도 검색 정보가 유지되도록 hidden 필드 추가 -->
						<input type="hidden" name="countPerPage"
							value="${pagination.countPerPage}" /> <input type="hidden"
							name="page" value="${pagination.currentPage}" />
					</form>

					<form id="countPerPageForm"
						action="allposts?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}"
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
						</select> <input type="hidden" name="page"
							value="${pagination.currentPage}" /> <input type="hidden"
							name="searchKeyword" value="${searchKeyword}" /> <input
							type="hidden" name="searchType" value="${searchType}" />
					</form>

				</div>
			</div>

			<table id="postTable">
				<thead>
					<tr>
						<th id="number">NO</th>
						<th id="board">게시판</th>
						<th id="title">제목</th>
						<th id="author">작성자</th>
						<th id="date">작성일</th>
						<th id="view">조회</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ pagination.currentPage == 1 }">
						<c:forEach var="post" items="${postAnno}">
								<tr class="Announcement-Tr">
									<td class="Announcement"><span>공지사항</span><input type="hidden" name="post_id"
										value="${ post.post_id }"></td>
									<td class="Announcement">${post.board_name}</td>
									<td class="Announcement postTitle"><a href="post.read?post_id=${post.post_id }">${post.title}</a>
									<input type="hidden" class="created_at" value="${ post.created_at }"><span class="newPostIcon">new</span></td>
									<td class="Announcement">${post.author_name}</td>
									<td class="Announcement"><fmt:formatDate value="${post.created_at}" pattern="yyyy-MM-dd HH:mm:ss" />
									</td>
									<td class="Announcement">${post.view_cnt}</td>
								</tr>
						</c:forEach>
					</c:if>
					<c:forEach var="post" items="${post}" varStatus="status">
						<c:if test="${post.pinned == 'N' }">
							<tr>
								<td>${status.index}<input type="hidden" name="post_id"
									value="${ post.post_id }"></td>
								<td>${post.board_name}</td>
								<td class="postTitle"><a href="post.read?post_id=${post.post_id }">${post.title}</a><span class="newPostIcon">new</span></td>
								<td>${post.author_name}</td>
								<td><fmt:formatDate value="${post.created_at}"
										pattern="yyyy-MM-dd HH:mm:ss" /><input type="hidden" name="updated_at"
									value="${ post.updated_at }"></td>
								<td>${post.view_cnt}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<%-- Pagination --%>
			<div class="pagination">


				<%-- 이전 페이지 링크 --%>
				<%
				if (hasPrev) {
				%>
				<a
					href="?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}"
					class="prev2 page-numbers">«</a>
				<%
				}
				%>

				<%-- 페이지 번호 링크들 --%>
				<%
				for (int i = startPage; i <= endPage; i++) {
				%>
				<a href="?page=<%=i%>&countPerPage=<%=countPerPage%>"
					class="page-numbers <%=(i == currentPage) ? "active" : ""%>"> <%=i%>
				</a>
				<%
				}
				%>

				<%-- 다음 페이지 링크 --%>
				<%
				if (hasNext) {
				%>
				<a href="?page=<%=nextPage%>&countPerPage=<%=countPerPage%>"
					class="next2 page-numbers">»</a>
				<%
				}
				%>
			</div>
		</div>
		<!-- 로딩 CSS에 해당하는 HTML -->
		<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	</article>

	<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>

	<!-- 슬라이드 기능 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="resources/javascript/posts.js"></script>
</body>
</html>
