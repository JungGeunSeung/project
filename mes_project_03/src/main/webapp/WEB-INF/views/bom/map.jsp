<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">


	<style>
    .map1 {
        width: 70%; 
	    margin: auto; /* 가로, 세로 중앙 정렬 */
	    margin-top: 50px;
	    padding: 20px;
	    text-align: center;
	    border: 1px solid #ddd;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); 
    }

    .map1 img {
        width: 100%;
	    height: auto; /* 이미지 비율 유지 */
	    margin-top: 10px;
	    border: 1px solid #ddd;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
	</style>

</head>
<body>
<header>
        <!----------------- 헤더 ----------------->
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!----------------- 메뉴바 ----------------->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>

	<div class="map1">
		<h2>저장 위치(MAP)</h2>
		<span>회사의 맵을 나타낸 지도 입니다.</span><br>
		<img src = "resources/img/맵.png" alt="맵 이미지">
	</div>
    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
</body>
</html>