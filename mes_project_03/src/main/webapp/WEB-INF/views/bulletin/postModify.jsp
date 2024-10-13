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
    width: 80%;
    margin: 20px auto;
    background-color: white;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 10px;
}

/* 제목 입력창 스타일 */
.title-input {
    width: 100%;
    padding: 15px;
    font-size: 16px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

/* 본문 에디터의 영역 */
.editor {
    width: 100%;
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
	        <h1>카페 글쓰기</h1>
	
	        <!-- 게시판 선택 부분 -->
	        <select class="title-input">
	            <option value="">게시판을 선택해 주세요.</option>
	            <option value="1">게시판 1</option>
	            <option value="2">게시판 2</option>
	        </select>
	
	        <!-- 제목 입력 -->
	        <input type="text" class="title-input" placeholder="제목을 입력해 주세요.">
	
	        <!-- 글쓰기 본문 에디터 -->
	        <textarea class="editor" placeholder="내용을 입력하세요."></textarea>
	
	        <!-- 태그 입력 -->
	        <div class="tag-input">#태그를 입력해 주세요 (최대 10개)</div>
	
	        <!-- 옵션 박스 -->
	        <div class="options">
	            <h4>공개 설정</h4>
	            <input type="checkbox"> 댓글 허용<br>
	            <input type="checkbox"> 외부 공유 허용<br>
	            <input type="checkbox"> 복사·저작 허용<br>
	        </div>
	
	        <!-- 등록 버튼 -->
	        <button class="submit-btn">등록</button>
	    </div>
	</article>

	<!-- 하단 내용 -->
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
</body>
</html>
