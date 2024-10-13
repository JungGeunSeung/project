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
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
<title>게시글</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	width: 800px;
	margin: 0 auto;
	padding-top: 20px;
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
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fff;
}

.comment-box {
	display: flex;
	flex-direction: column;
}

.comment-header {
	font-weight: bold;
	margin-bottom: 10px;
}

.comment-input {
	width: 100%;
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

.comment-submit {
	background-color: #fff;
	border: none;
	color: #666;
	cursor: pointer;
	font-size: 14px;
}

.comment-submit:hover {
	color: #000;
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
			<div class="title">${post.title }</div>
			<div class="meta">${post.author_name }|${post.created_at } |
				${post.view_cnt }</div>

			<div class="content">${post.content }</div>
			<div>
				<button>수정</button>
				<button>삭제</button>
			</div>
		</div>
		<!-- 댓글 내용 -->
		<div class="comment-section">
			<div class="comment-box">
				<div class="comment-header">
					<strong>${user.nickname}</strong>
					<!-- Display current user's nickname -->
				</div>
				<textarea class="comment-input" placeholder="댓글을 남겨보세요"></textarea>
				<div class="comment-actions">
					<button class="comment-icon">
						<img src="resources/img/camera-icon.png" alt="Upload Image" />
					</button>
					<button class="comment-icon">
						<img src="resources/img/emoji-icon.png" alt="Emoji" />
					</button>
					<button class="comment-submit">등록</button>
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
</body>
</html>
