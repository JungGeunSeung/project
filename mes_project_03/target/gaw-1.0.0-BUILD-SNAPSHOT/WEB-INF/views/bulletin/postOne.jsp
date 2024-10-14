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
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/category.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/loading.css">
<link rel="stylesheet" href="resources/CSS/btn.css">
<link rel="stylesheet" href="resources/CSS/table.css">
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
<title>${post.title }</title>

<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 60%;
	margin: 0 auto;
	padding: 20px 0px;
	border-bottom: 1px solid #ddd;
}

.title {
	font-size: 24px;
	font-weight: bold;
}

.meta {
	color: #888;
	font-size: 14px;
}

.content {
	margin-top: 20px;
	font-size: 16px;
	border: 1px solid #ddd;
	border-radius: 5px;
	min-height: 200px;
	padding: 10px;
}

.highlight {
	background-color: #000;
	color: #fff;
	font-size: 18px;
	padding: 10px;
	margin-top: 10px;
	display: inline-block;
}

.info {
	margin-top: 30px;
	font-size: 14px;
}

.info .label {
	font-weight: bold;
	display: inline-block;
	width: 120px;
}

.info .value {
	display: inline-block;
}

.comment-section {
	width: 60%; /* 화면 너비의 60% */
	margin: 20px auto; /* 상단에서 20px의 여백을 주고, 좌우를 자동으로 설정하여 가운데 정렬 */
	padding: 10px;
	background-color: #fff;
}

.comment-box form {
	width: 90%;
	display: flex;
	flex-direction: column;
}

.comment-header {
	font-weight: bold;
	margin-bottom: 10px;
}

.comment-input {
	width: 90%;
	height: 80px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	resize: none;
	margin-bottom: 10px;
}

.comment-actions {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.comment-icon {
	background: none;
	border: none;
	cursor: pointer;
	padding: 5px;
}

.comment-icon img {
	width: 24px;
	height: 24px;
}

.comment-submit:hover {
	color: #000;
}

.content-btns {
	margin: 20px 0px;
}

.comment-container {
	width: 60%;
	margin: 20px auto;
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
	display: flex;
	align-items: flex-start;
	gap: 15px;
}

.comment-container:last-child {
	border-bottom: none;
}

.profile-picture {
	width: 50px;  /* 정사각형 크기 */
	height: 50px; /* 정사각형 크기 */
	border-radius: 50%; /* 원형으로 만듦 */
	object-fit: cover; /* 이미지가 잘리지 않도록 설정 */
	background-color: #eee; /* 이미지가 없을 때 배경색 */
}

.comment-content {
	width: 100%;
}

.user-name {
	font-weight: bold;
	font-size: 14px;
	color: #333;
}

.user-badge {
	font-size: 12px;
	color: #0073e6;
	margin-left: 5px;
}

.comment-text {
	margin: 5px 0;
	font-size: 14px;
	color: #333;
}

.comment-footer {
	font-size: 12px;
	color: #999;
}

.comment-actions {
	display: inline-block;
	margin-left: 15px;
	font-size: 12px;
	cursor: pointer;
	color: #999;
}

.notification-toggle {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	margin-bottom: 10px;
	font-size: 12px;
}

.notification-toggle input[type="checkbox"] {
	margin-left: 5px;
}

.comment-header {
	width: 60%;
	margin: 0 auto;
	border-bottom: 1px solid #ddd;
	padding-bottom: 5px;
	
}

.comment-header span {
	margin: 5px;
}

.post-navination a {
	text-decoration: none;
	color: black;
	cursor: pointer;
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
		<!-- 게시글 내용 -->
		<div class="container">
			<div class="post-navination">
				<a href="allposts">전체글</a> > <a href="allposts?board_name=${post.board_name }">${post.board_name }</a> > <a
					href="#">${post.title }</a>
			</div>
			<div class="title"><h2>${post.title }</h2></div>
			<div><img src="profile2.png" alt="Profile Picture" class="profile-picture">${post.author_name }</div>
			<div class="meta">
				|
				<fmt:formatDate value="${post.created_at}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				| ${post.view_cnt }
			</div>

			<div class="content">${post.content }</div>
			<div class="content-btns">
				<button class="btn">수정</button>
				<button class="btn">삭제</button>
			</div>
		</div>
		<div class="comment-header">
			<h3>댓글</h3>
			<span>등록순</span>
			<span>최신순</span>
		</div>
		<!-- 등록된 댓글들 -->
		<c:forEach var="comment" items="${comments}">
		    <div class="comment-container">
		        <!-- 사용자 프로필 사진 -->
<%-- 		        <img src="${pageContext.request.contextPath}/resources/img/${comment.profile_image}" alt="Profile Picture" class="profile-picture"> --%>
		        <input type="hidden" class="commentsId" id="${comment.comment_id }" name="comment_id" value="${comment.comment_id }">
		        <div class="comment-content">
		            <!-- 사용자 이름 및 뱃지 -->
		            <div class="user-name">
		            <img src="profile2.png" alt="Profile Picture" class="profile-picture">
		                <span>${comment.employee_name}</span> 
		            </div>
		            
		            <!-- 댓글 내용 -->
		            <div class="comment-text">${comment.content}</div>
		            
		            <!-- 댓글 작성 시간 및 액션 -->
		            <div class="comment-footer">
		                <fmt:formatDate value="${comment.created_at}" pattern="yyyy.MM.dd HH:mm" /> 
		                <span class="comment-actions">답글쓰기</span>
		                <span class="comment-actions">수정</span>
		                <span class="comment-actions">삭제</span>
		                <span class="comment-actions">❤️</span>
		            </div>
		        </div>
		    </div>
		</c:forEach>
		<!-- 댓글 작성 -->
		<div class="comment-section">
			<div class="comment-box">
			<form action="comment.insert" method="post">
				<input type="hidden" name="post_id" value="${ post.post_id }">
				<!-- 댓글 작성자의 이름이 표시되어야 함. -->
				<textarea class="comment-input" name="content" placeholder="댓글을 남겨보세요"></textarea>
				<div class="comment-actions">
					<button class="comment-submit btn">등록</button>
				</div>
			</form>
			</div>
		</div>
		<!-- 로딩 CSS에 해당하는 HTML -->
		<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	</article>

	<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
	<script src="resources/javascript/postOne.js"></script>
	
</body>
</html>
