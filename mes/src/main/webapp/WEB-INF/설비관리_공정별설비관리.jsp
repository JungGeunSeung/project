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
	<jsp:include page="assetsform/sidebar.jsp">
		<jsp:param name="side" value="sidebar"></jsp:param>
	</jsp:include>
	<!-- 	상단바 -->
	<jsp:include page="assetsform/topbar.jsp">
		<jsp:param name="top" value="topbar"></jsp:param>
	</jsp:include>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>공정별 설비관리/ 수리 보고서</h1>
            <div class="subhead">
            <!-- 해당 페이지의 설명 -->
            <span>공정별로 작동되는 설비를 관리하는 페이지입니다.</span>
            </div>
            <div class="subhead">
                <div class="resultdiv">
                    <span>설비관리 보고서</span>
                    <button class="btn">작성</button>
                    <button class="btn">수정</button>
                    <button class="btn">삭제</button>
                </div>
                
                <div class="resultdiv">
                    <span>장비 수리 보고서</span>
                    <button class="btn">작성</button>
                    <button class="btn">수정</button>
                    <button class="btn">삭제</button>
                </div>

                <div class="resultdiv">
                    <span>금형 수리 보고서</span>
                    <button class="btn">작성</button>
                    <button class="btn">수정</button>
                    <button class="btn">삭제</button>
                </div>
            </div>
            <!-- 보고서 내용 -->
            
            <div>

            </div>
        </div>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/table.js"></script>

</html>