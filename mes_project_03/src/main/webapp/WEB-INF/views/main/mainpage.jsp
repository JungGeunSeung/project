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
    <title>Grand All Win</title>
    <style>

    /*------------------------------ 메인 영역 ----------------------------------*/
    .main-content {
        display: grid;
        grid-template-rows: auto;  /* 행 방향으로 쌓이도록 설정 */
        gap: 20px;                 /* 각 div 사이의 간격 */
        justify-content: center;   /* 가운데 정렬 */
        padding: 20px;
        
    }

    .main-content div {
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #f4f4f4;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        max-width: 800px;           /* 최대 너비 */
        width: 100%;                /* 가로폭 100% */
        min-height: 300px;          /* 최소 높이 */
        min-width: 800px;
    }

    /* 브라우저 너비에 따라 article 너비를 조정 */
    .main-content {
        max-width: 900px;
        margin: 0 auto;             /* 브라우저 가운데 정렬 */
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

    <article>
        <div class="main-content">
            <div>
                <h2><a href="board">공지사항</a></h2>
            </div>
            <div>
                <h2>실시간 생산현황</h2>
                <span>현재 가동중인 라인</span><br>
                <span>작업지시 현황</span><br>
                <span>생산량 데이터</span><br>
            </div>
            <div>
                <h2>공정 모니터링</h2>
                <span>품질 관리 데이터</span><br>
                <span>설비 상태</span><br>
                <span>설비 성능 지표(OEE)</span><br>
            </div>
            <div>
                <h2>생산계획 및 일정</h2>
                <span>생산 일정</span><br>
                <span>작업지시관리</span><br>
            </div>
        </div>
        <div class="loading-overlay hidden">
			<div class="loading-container">
				<div class="loading"></div>
			<div id="loading-text">loading</div>
		</div>
	</div>
    </article>

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
</body>

</html>
