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
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
</head>

<body>
    <!-- 카테고리바와 사이드바 동시 jsp -->
    <jsp:include page="/WEB-INF/topSide/topSide.jsp" />
    <!-- 메인메뉴 아래 정보가 표시될 영역 -->
    <div class="searchID">
        <!-- 해당 페이지의 제목 -->
        <h1>조직도</h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>회사의 조직도입니다. 비상연락망을 구축하여 빠르게 연락을 취할수 있습니다.</span> <br>
        </div>
    </div>
    <div>
        <img style="width: 100%;" src="/mes/Image/조직도.jpg" alt="">
    </div>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>

</html>