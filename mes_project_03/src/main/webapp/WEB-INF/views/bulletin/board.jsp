<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/CSS/category.css">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/loading.css">
<title>Grand All Win</title>
<style>
/* 전체 페이지를 플렉스박스로 중앙 정렬 */
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* 콘텐츠 영역을 가운데 배치 */
.container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-grow: 1;
    width: 100%;
    padding: 20px;
    box-sizing: border-box;
}

/* article를 중앙에 배치하고 양쪽 여백을 유지 */
article {
    display: flex;
    justify-content: flex-start;
    max-width: 1200px;
    width: 100%;
    margin: 0 auto;
    box-sizing: border-box;
    padding: 0 20px;
}

/* 왼쪽 리스트 스타일 */
.sidebar {
    width: 250px;
    background-color: #f4f4f4;
    border-right: 1px solid #ddd;
    padding: 10px;
    box-sizing: border-box;
    flex-shrink: 0;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar li {
	
    font-size: 12px;
    padding: 5px;
    background-color: #fff;
    margin-bottom: 5px;
    cursor: pointer;
    border: 1px solid #ccc;
}

.sidebar li:hover {
    background-color: #ddd;
}

/* 오른쪽 상세 입력창 스타일 */
.content {
    flex-grow: 1;
    padding: 20px;
    box-sizing: border-box;
}

.content h2 {
    margin-top: 0;
}

.input-group {
    margin-bottom: 15px;
}

.input-group label {
    display: block;
    margin-bottom: 5px;
}

#board,
.input-group textarea,
.input-group select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn-save {
    background-color: #4CAF50;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.btn-save:hover {
    background-color: #45a049;
}

#description {
	min-height: 200px;
}

#like-function {
	height: 25px;
	width:25px;
}

.input-group span {
}
</style>
</head>
<body>
    <!--------------------- 헤더 --------------------->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-------------------- 메뉴바 --------------------->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
    
    <!------------------ 메인 콘텐츠 ------------------>
    <article>
    	
        <!-- 왼쪽 리스트 -->
        <div class="container">
        <article>
            <!-- 왼쪽 리스트 -->
            <div class="sidebar">
                <h3>게시판 목록</h3>
                <ul>
                	<c:forEach var="list" items="${list }">
	                    <li onclick="loadDetail('${list.board_name}','${ list.description }','${ list.board_id }')">${ list.board_name }
	                    	<input type="hidden" name="board_id" value="${ list.board_id }">
	                    </li>
                    </c:forEach>
                </ul>
            </div>
        
            <!-- 오른쪽 상세 입력창 -->
            <div class="content">
                <div>
		    		<h2>게시판</h2>
		    		<span>게시글을 등록할 게시판을 관리하는 곳입니다.</span>
		    		<span>왼쪽 게시판 리스트를 클릭하여 수정하거나, 새롭게 게시판을 만들수 있습니다.</span>
	    		</div>
	    		<hr>
                <h3>상세 정보</h3>
        		<form method="post" action="board.do">
        		<input type="hidden" id="board_id" name="board_id">
                <div class="input-group">
                    <label for="menu-name">게시판 제목</label>
                    <input type="text" name="board_name" id="board" placeholder="메뉴명을 입력하세요">
                </div>
        
                <div class="input-group">
                    <label for="menu-desc">게시판 설명</label>
                    <textarea name="description" id="description" placeholder="메뉴 설명을 입력하세요"></textarea>
                </div>
        	
                <input class="btn-save" type="submit" value="저장하기">
                </form>
            </div>
        </article>
    </div>
    </article>
    
    <!------------------- 하단 내용 ------------------->
    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    
    <script>
		function loadDetail(detail, description, id) {
			console.log(detail, description);
			document.querySelector("#board").value = detail;
			document.querySelector("#description").value = description;
			document.querySelector("#board_id").value = id;

		}
    </script>
</body>
</html>
