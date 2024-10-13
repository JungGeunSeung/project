<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<title>게시판</title>
<style>
.container {
	width: 70%;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.search-bar {
	align-items: center;
	margin-bottom: 20px;
}

.board-container {
    position: relative;
    width: 600px;
    margin: 20px auto;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* prev, next 버튼을 슬라이드 바깥의 양옆에 배치 */
.prev, .next {
    cursor: pointer;
    background-color: inherit;
    border: none;
    color: black;
    font-size: 18px;
    padding: 10px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    z-index: 10;
    display: block;
}

.prev {
    left: -50px; /* 슬라이드 왼쪽 바깥에 위치 */
}

.next {
    right: -50px; /* 슬라이드 오른쪽 바깥에 위치 */
}

.board-list {
    width: 600px;
    overflow: hidden;
    background-color: #e5ffd8;
    border-radius: 10px;
    padding: 0px 20px;
}

#boardList {
    display: flex;
    transition: transform 0.5s ease-in-out;
    white-space: nowrap;
    list-style: none;
    padding: 0;
}

.board-item {
    min-width: auto;
    text-align: center;
    margin-right: 10px;
}

.boardBtn {
    padding: 10px;
    background-color: inherit;
    cursor: pointer;
    border: none;
    transition: background-color 0.3s ease; /* 색상 변경 시 애니메이션 추가 */
}

.boardBtn:hover {
    background-color: #3bdf25da; /* 호버 시 색상 변경 */
    border-radius: 5px;
}

/* 클릭한 버튼에 호버 색상을 유지하기 위한 클래스 */
.boardBtn.active-btn {
    background-color: #3bdf25da; /* 선택된 버튼에 동일한 색상 유지 */
    border-radius: 5px;
}


.search-type {
	text-align: right;
	margin: 30px 0;
}

.search-type select, .search-type input[type="text"] {
	padding: 5px;
	margin-left: 10px;
}

.search-type input[type="text"] {
	width: 200px;
	margin-right: 10px;
	border: 1px solid rgb(138, 206, 138);
}

.search-type input[type="text"]:focus {
	border: 1px solid green;
}

.search-type input[type="text"]::placeholder {
	color: rgb(0, 77, 0);
}

.search-type select {
	width: 100px;
	border: 1px solid green;
	color: green;
	border-radius: 5px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	text-align: center;
}

.search-type select option:hover {
	background-color: green;
	color: white;
}

/* Pagination 스타일 추가 */
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination .page-numbers {
    display: inline-block;
    padding: 10px 15px;
    margin: 0 5px;
    background-color: #e5ffd8;
    border: 1px solid #3bdf25da;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
    text-decoration: none;
}

.pagination .page-numbers:hover {
    background-color: #3bdf25da;
    color: white;
}

.pagination .page-numbers.active {
    background-color: #3bdf25da;
    color: white;
}

.pagination .prev2, .pagination .next2 {
    cursor: pointer;
    background-color: inherit;
    border: none;
    font-size: 18px;
    color: black;
    margin: 0 10px;
    text-decoration: none;
}

table {
	text-align: center;
}

table thead {
	text-align: center;
}

table thead tr #number {
	width: 40px;
}
table thead tr #board {
	width: 120px;
}
table thead tr #title {
	width: 300px;
}
table thead tr #author {
	width: 50px;
}
table thead tr #date {
	width: 70px;
}
table thead tr #view {
	width: 40px;
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
		<div class="container">
			<h1>전체글</h1>
			<div class="search-bar">
				<div class="board-container">
					<button class="prev" id="prevBtn">«</button>
					<div class="board-list">
						<ul id="boardList">
								<li class="board-item"><button class="boardBtn">전체</button></li>
							<c:forEach var="list" items="${board}">
								<li class="board-item">
									<button class="boardBtn">${list.board_name}</button>
								</li>
							</c:forEach>
						</ul>
					</div>
					<button class="next" id="nextBtn">»</button>
				</div>
				<div class="search-type">
					<select name="searchType">
						<option value="all">전체</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
					</select> 
					<input type="text" placeholder="검색어를 입력하세요." />
					<button type="submit" class="btn"><span>조회</span></button>
				</div>
			</div>

			<table>
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
					<c:forEach var="post" items="${post}">
				        <tr>
				            <td>${post.rnum}<input type="hidden" name="post_id" value="${ post.post_id }"></td>
				            <td>${post.board_name}</td>
				            <td><a href="post/read?post_id=${post.post_id }">${post.title}</a></td>
				            <td>${post.author_name}</td>
				            <td><fmt:formatDate value="${post.created_at}" pattern="yyyy.MM.dd" /><input type="hidden" name="updated_at" value="${ post.updated_at }"></td>
				            <td>${post.view_cnt}</td>
				        </tr>
				    </c:forEach>
				</tbody>
			</table>

			<div class="pagination">
			    <div>
			        <c:if test="${pagination.hasPrev}">
			            <a href="?page=${pagination.prevPage}" class="prev2 page-numbers">«</a>
			        </c:if>
			        <c:forEach var="page" begin="${pagination.startPage}" end="${pagination.endPage}">
			            <a href="?page=${page}" class="page-numbers ${page == pagination.currentPage ? 'active' : ''}">${page}</a>
			        </c:forEach>
			        <c:if test="${pagination.hasNext}">
			            <a href="?page=${pagination.nextPage}" class="next2 page-numbers">»</a>
			        </c:if>
			    </div>
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
