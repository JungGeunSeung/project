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
	padding: 20px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
}

.container2 {
	width: 60%;
	padding: 20px;
	border-bottom: 1px solid #ddd;
	box-shadow: 0px 6px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
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
	align-items: flex-start;
	gap: 15px;
}

.comment-container:last-child {
	border-bottom: none;
}

.profile-picture {
	width: 50px; /* 정사각형 크기 */
	height: 50px; /* 정사각형 크기 */
	object-fit: contain; /* 비율을 유지하면서 컨테이너 안에 맞추기 */
	border-radius: 50%; /* 원형으로 만들고 싶을 경우 */
	background-color: #eee; /* 이미지가 없을 때 배경색 */
}

.comment-content {
	width: 100%;
}

.user-name, .reply-name {
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

.content-btns {
	display: flex;
	justify-content: space-between; /* 양옆에 위치하게 설정 */
}

.content-btns form {
	margin: 0; /* 불필요한 여백 제거 */
}

.reply-form {
	display: block;
}

.reply-input {
	height: 40px;
	padding: 5px;
	resize: none;
	margin-top: 5px;
	width: 230px;
}

.reply-save-btn {
	margin-bottom: 5px;
}

.reply-comment {
	font-size: .7em;
	color: #bbbbbb;
}

.reply-text {
	font-size: .8em;
}

.reply-container {
	margin-top: 10px;
	margin-left: 30px;
}

.navination {
	color: black;
	text-decoration: none;
}

.author span {
	font-size: 20px;
	margin-left: 10px;
}

.profileImg {
	border: 1px soild green;
	border-radius: 50%;
	width: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<!-- 헤더 및 메뉴바 -->
	<header>
		<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
	</header>
	<nav>
		<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>

	<!-- 메인 콘텐츠 -->
	<article>
		<!-- 게시글 내용 -->
		<div class="container">

			<div class="navination">
				<a href="allposts">전체글</a> > <a
					href="allposts?board_name=${post.board_name }">${post.board_name }</a>
			</div>

			<div class="title">
				<h3>${post.title }<input type="hidden" id="post_id"
						value="${post.post_id}">
				</h3>
			</div>

			<div class="author">
				<img class="profileImg" src="${post.profile_url}"> <span>${post.author_name }</span>
			</div>

			<div class="meta">
				| 등록일
				<fmt:formatDate value="${post.created_at}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				| 수정일
				<fmt:formatDate value="${post.updated_at}"
					pattern="yyyy-MM-dd HH:mm:ss" />
				| 조회수 ${post.view_cnt }
			</div>

			<div class="content">${post.content }</div>

			<div class="content-btns">
				<form action="post.modify">
					<input type="hidden" name="post_id" id="post_id"
						value="${post.post_id}">
					<button class="btn">수정</button>
				</form>

				<form action="post.delete">
					<input type="hidden" name="post_id" id="post_id"
						value="${post.post_id}">
					<button class="btn">삭제</button>
				</form>
			</div>
		</div>

		<!-- 댓글 섹션 -->
		<div class="comment-header">
			<h3>댓글</h3>
		</div>
		<c:forEach var="comment" items="${comments}">
			<div class="comment-container">
				<input type="hidden" class="commentsId" id="${comment.comment_id}"
					name="comment_id" value="${comment.comment_id}">
				<div class="comment-content">
					<div class="user-name">
						<img class="profileImg" src="${comment.profile_url}"> <span>${comment.employee_name}</span>
					</div>
					<div class="comment-text">${comment.content}</div>
					<div class="comment-footer">
						<fmt:formatDate value="${comment.created_at}"
							pattern="yyyy.MM.dd HH:mm" />
						<span class="comment-actions reply-btn"
							data-comment-id="${comment.comment_id}">답글쓰기</span>
						<!-- 댓글 내용 및 수정/삭제 버튼 -->
						<span class="comment-actions commentModifyBtn">수정</span> <span
							class="comment-actions commentDeleteBtn">삭제</span>
					</div>

					<!-- 답글 리스트 -->
					<c:forEach var="reply" items="${reply}">
						<c:if test="${reply.comment_id == comment.comment_id}">
							<div class="reply-container">
								<input type="hidden" class="replyId" name="reply_id"
									value="${reply.reply_id}">
								<div class="reply-comment">
									<span>${comment.employee_name}님에게 답글</span>
								</div>

								<div class="reply-name">
									<img class="profileImg" src="${reply.profile_url}"> <span>${reply.reply_name }</span>
								</div>
								<div class="reply-text">
									<span>${reply.content}</span>
								</div>
								<div class="comment-footer">
									<fmt:formatDate value="${reply.updated_at}"
										pattern="yyyy.MM.dd HH:mm" />
									<span class="comment-actions replyModifyBtn">수정</span> <span
										class="comment-actions replyDeleteBtn">삭제</span>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>

				<!-- 답글 작성 폼 -->
				<div class="reply-form" id="reply-form-${comment.comment_id}"
					style="display: none;">
					<textarea class="reply-input"
						id="reply-input-${comment.comment_id}" placeholder="답글을 입력하세요"></textarea>
					<button class="reply-save-btn btn"
						data-comment-id="${comment.comment_id}">저장하기</button>
				</div>
			</div>
		</c:forEach>

		<!-- 댓글 작성 폼 -->
		<div class="comment-section">
			<form action="comment.insert" method="post">
				<input type="hidden" name="post_id" value="${post.post_id}">
				<textarea class="comment-input" name="content"
					placeholder="댓글을 남겨보세요"></textarea>
				<div class="comment-actions">
					<button class="comment-submit btn">등록</button>
				</div>
			</form>
		</div>
	</article>
	<!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	<!-- 푸터 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>

	<!-- 스크립트 포함 -->
	<script src="resources/javascript/postOne.js"></script>
</body>
</html>
