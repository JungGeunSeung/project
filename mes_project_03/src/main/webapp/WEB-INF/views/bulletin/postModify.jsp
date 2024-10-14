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
<title>게시글 수정</title>
<style>
.container {
    width: 60%;
    margin: 20px auto;
    background-color: white;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
}

/* 제목 입력창 스타일 */
.title-input {
    width: 88%;
    padding: 15px;
    font-size: 16px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 게시판 선택 스타일 */
.board-input {
    width: 91%;
    padding: 15px;
    font-size: 16px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 본문 에디터의 영역 */
.editor {
    width: 90%;
    height: 400px;
    border: 1px solid #ccc;
    border-radius: 5px;
    padding: 10px;
    margin-bottom: 20px;
    resize: none;
    font-size: 14px;
}

/* 오른쪽 옵션 박스 */
.options {
    float: right;
    width: 25%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 10px;
    background-color: #f8f8f8;
}

.options h4 {
    margin-bottom: 15px;
}

/* 태그 입력 부분 */
.tag-input {
    margin-top: 20px;
    font-size: 14px;
    color: #999;
}

/* 등록 버튼 */
.submit-btn {
    display: inline-block;
    padding: 10px 20px;
    background-color: #00C851;
    color: white;
    text-align: center;
    border-radius: 5px;
    cursor: pointer;
    border: none;
    margin-top: 20px;
}

.submit-btn:hover {
    background-color: #007E33;
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
	        <h1>글 수정하기</h1>
			<form id="modifyForm" action="post.modify.do" method="post">
		        <!-- 게시판 선택 부분 -->
		        <select name="board_id" class="board-input">
		            <c:forEach var="board" items="${list}">
		            <option value="${board.board_id}">${board.board_name}</option>
		            </c:forEach>
		        </select>
				<input type="hidden" name="post_id" value="${dto.post_id}">
		        <!-- 제목 입력 -->
		        <input id="modifyTitle" type="text" name="title" class="title-input" placeholder="제목을 입력해 주세요." value="${dto.title}">
				<input type="hidden" name="pinned" value="false">
				<input type="checkbox" name="pinned" value="true">공지사항으로 등록<br>
		        <!-- 글쓰기 본문 에디터 -->
		        <textarea id="modifyContent" name="content" class="editor" placeholder="내용을 입력하세요." >${dto.content}</textarea>
				
		        <!-- 등록 버튼 -->
		        <button class="submit-btn">등록</button>
	        </form>
	    </div>
	</article>

	<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
	<script>
	document.querySelector('#modifyForm').addEventListener('submit', function(event) {
		event.preventDafault();
		
		if(document.querySelector('#modifyTitle') == null || document.querySelector('#modifyTitle') == '') {
			alert('제목은 필수입니다.');
			return;
		} else if(document.querySelector('#modifyContent') == null || document.querySelector('#modifyContent') == '') {
			alert('내용은 필수입니다.');
			return;
		}
		
		document.querySelector('#modifyForm').submit();
	})
	</script>
</body>
</html>
