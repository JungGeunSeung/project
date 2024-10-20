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
<link rel="stylesheet" href="resources/CSS/btn.css">
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
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
    text-align: center;
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

#description {
	min-height: 200px;
}

#like-function {
	height: 25px;
	width:25px;
}

.sidebar .btnLi {
	background-color: inherit;
  	text-align: center;
  	border: none;
	
}

.sidebar .btnLi:hover {
	background: none;
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
                <ul id="boardList">
                	<c:forEach var="list" items="${list }">
	                    <li onclick="loadDetail('${list.board_name}','${ list.description }','${ list.board_id }')">${ list.board_name }</li>
                    </c:forEach>
                </ul>
                <button class="btn addBtn"><span>추가하기</span></button>
            </div>
        
            <!-- 오른쪽 상세 입력창 -->
            <div class="content">
                <div>
		    		<h2>게시판 관리</h2>
		    		<span>게시글을 등록할 게시판을 관리하는 곳입니다.</span>
		    		<span>왼쪽 게시판 리스트를 클릭하여 수정하거나, 새롭게 게시판을 만들수 있습니다.</span>
	    		</div>
	    		<hr>
                <h3>상세 정보</h3>
        		<form id="board_form" method="post" action="board.do">
        		<input type="hidden" id="board_id" name="board_id">
                <div class="input-group">
                    <label for="menu-name">게시판 제목</label>
                    <input type="text" name="board_name" id="board" placeholder="메뉴명을 입력하세요">
                </div>
        
                <div class="input-group">
                    <label for="menu-desc">게시판 설명</label>
                    <textarea name="description" id="description" placeholder="메뉴 설명을 입력하세요"></textarea>
                </div>
        	
                <button class="btn"><span>저장하기</span></button>
                <button class="btn deleteBtn"><span>삭제하기</span></button>
                </form>
            </div>
            <form style="display:none;" action="board.delete" method="post" id="delete_form">
            	<input type="hidden" id="delete_id" name="board_id">
            </form>
        </article>
    </div>
    </article>
    <!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
    
    <!------------------- 하단 내용 ------------------->
    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    
    <script>
		function loadDetail(detail, description, id) {
			document.querySelector("#board").value = detail;
			document.querySelector("#description").value = description;
			document.querySelector("#board_id").value = id;

		}
		
		document.querySelector("#board_form").addEventListener('submit', function() {
			event.preventDefault();
			if(document.querySelector("#board").value == "" || document.querySelector("#board").value == null) {
				alert("게시판 제목은 필수 입니다.");
				return;
			}
			
			alert("게시판이 추가(변경) 되었습니다. \n 제목 : " + document.querySelector("#board").value);
			document.querySelector("#board_form").submit();
		})
		
	// 추가하기 버튼
	document.querySelector(".addBtn").addEventListener("click", function() {
		document.querySelector("#board").value = "";
		document.querySelector("#description").value = "";
		document.querySelector("#board_id").value = "";
		const boardList = document.querySelector("#boardList");
		boardList.innerHTML += `
            <li onclick="loadDetail('새로운게시판', '게시판 설명', '')">새로운게시판</li>`;
		
		
    });
		
	//삭제하기 버튼
	document.querySelector(".deleteBtn").addEventListener("click", function() {
		event.preventDefault();
		document.querySelector("#delete_id").value = document.querySelector("#board_id").value
		if(confirm("정말로 삭제하시겠습니까? \n 삭제할 게시판 : " + document.querySelector("#board").value)) {
			alert("삭제 되었습니다.");
			document.querySelector("#delete_form").submit();
		} else {
			alert("삭제가 취소되었습니다.");
			return;
		}
		
	});

    </script>
</body>
</html>
