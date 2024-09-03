

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
    
    <style>
    	#readtable {
    		border-collapse: collapse;
    		text-align: center;
    		background-color: rgba(173, 216, 230, 0.3);
    		border: 1px solid black;
    	}
    	
    	#readtable td {
   			border: 1px solid black;
   			padding: 5px
    	}
    	
    	#readtable th {
   			background-color: rgb(135, 206, 250);
		    color: white;
		    font-size: 20px;
		    border: 1px solid black;
		    padding: 0px 10px;
    	}
    	
    	#readtable tr:nth-child(2n) {
    		background-color: rgba(173, 216, 230, 0.6);
    	}
    	
    	#prodTD {
    		background-color: rgb(135, 206, 250);
    	}
    </style>
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
        <!-- 게시물의 개수를 표시할 select -->
    </div>

    <!-- 해당 목록 -->
    <div>
        <c:url var="list1" value="/doc/list" />
        <a href="${ list1 }" class="btn">돌아가기</a>
        
        <c:url var="modify" value="/doc/modify">
            <c:param name="document_id" value="${ doc.document_id }" />
            <c:param name="userid" value="${ doc.userid }" />
            <c:param name="title" value="${ doc.title }" />
            <c:param name="content" value="${ doc.content }" />
            <c:param name="created_date" value="${ doc.created_date }" />
            <c:param name="updated_date" value="${ doc.updated_date }" />
            <c:param name="version" value="${ doc.version }" />
        </c:url>

        <a href="${modify}" name="modify" class="btn">수정하기</a>

        <form method="post" action="delete">
            <input type="hidden" name="bom_id" value="${doc.document_id}">
            <input type="submit" value="삭제하기" class="btn">
        </form>
        <div>
       		<div>문서번호 : ${ doc.document_id }</div>
       		<div>작성자 : ${ doc.userid }</div>
       		<div>제목 : ${ doc.title }</div>
       		<div>내용 : ${ doc.content }</div>
       		<div>작성일 : ${ doc.created_date }</div>
       		<div>수정일 : ${ doc.updated_date }</div>
       		<div>개정번호 : ${ doc.version }</div>
        </div>
    </div>
    <hr>
    <script src="/mes/JavaScript/table.js"></script>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</body>

</html>