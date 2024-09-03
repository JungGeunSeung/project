<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <jsp:include page="assetsform/sidebar.jsp"/>
    <!-- 	상단바 -->
    <jsp:include page="assetsform/topbar.jsp"/>
    <!-- 메인메뉴 아레 정보가 표시될 영역 -->
    <div class="searchID">

        <!-- 해당 페이지의 제목 -->
        <h1><a href="/mes/BOM/list">BOM</a></h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>제품의 BOM을 조회하는 페이지입니다.</span> <br>
        </div>
        <!-- 게시물 만드는 영역 -->
    </div>

    <!-- 해당 목록 -->
    <span>BOM 코드는 자동 생성됩니다.</span>
    <form method="post" action="create">
        제품 코드 : <input type="text" name="production_id" placeholder="PRODUCTION ID"><br>
        자재 코드 : <input type="text" name="mid" placeholder="MATERRIAL ID"><br>
        품별 자재사용개수 : <input type="number" name="bom_quantity"><br>
        <input type="submit" value="작성하기">
    </form>

    <script src="/mes/JavaScript/table.js"></script>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</body>

</html>