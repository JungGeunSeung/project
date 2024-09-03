<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/mes/CSS/button.css">
    <link rel="stylesheet" href="/mes/CSS/calender.css">
    <link rel="stylesheet" href="/mes/CSS/common.css">
    <link rel="stylesheet" href="/mes/CSS/display.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <link rel="stylesheet" href="/mes/CSS/sidebar.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/topbar.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
</head>

<body>
   <!-- 사이드바 -->
    <jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
    <!-- 	상단바 -->
    <jsp:include page="/WEB-INF/assetsform/topbar.jsp" />
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1><a href="/mes/doc/list">문서관리</a></h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>회사가 사용하는 문서를 관리하는 페이지입니다.</span> <br>
            </div>
			<!-- 게시물 만드는 영역 -->
        </div>
				<span>문서 코드는 자동 생성됩니다.</span>
			<form method="post" action="create">
				사용자 아이디 : <input type="text" name="document_id" placeholder="USER ID"><br>
				문서명 : <input type="text" name="title" placeholder="TITLE"><br>		
				문서 내용 : <input type="text" name="content"><br>
				작성날짜 : <input type="date" name="created_date"><br>
				수정날짜 : <input type="date" name="updated_date"><br>
				수정날짜 : <input type="number" name="version"><br>
			<input type="submit" value="작성하기">
			</form>
		<div>
			
		</div>
        <!-- 해당 목록 -->
		
            <hr>
        </div>

    <script src="/mes/JavaScript/table.js"></script>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</body>
</html>