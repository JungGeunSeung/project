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
        <h1><a href="/mes/BOM/list">BOM</a></h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>제품의 BOM을 조회하는 페이지입니다.</span> <br>
        </div>
        <!-- 게시물의 개수를 표시할 select -->
    </div>

    <!-- 해당 목록 -->
    <div>
        <c:url var="list1" value="/BOM/list" />
        <a href="${ list1 }" class="btn">돌아가기</a>
        <c:url var="modify" value="/BOM/modify">
            <c:param name="bom_id" value="${ bom.bom_id }" />
            <c:param name="production_id" value="${ bom.production_id }" />
            <c:param name="mid" value="${ bom.mid }" />
            <c:param name="bom_quantity" value="${ bom.bom_quantity }" />
        </c:url>

        <a href="${modify}" name="modify" class="btn">수정하기</a>

        <form method="post" action="delete">
            <input type="hidden" name="bom_id" value="${bom.bom_id}">
            <input type="submit" value="삭제하기" class="btn">
        </form>
        <div>
            <table id="readtable">
                <tr>
                    <th>제품코드</th>
                    <th>BOM 코드</th>
                    <th>자재 코드</th>
                    <th>사용 개수</th>
                </tr>
                <tr>
                    <td rowspan="${ promat.size() }" id="prodTD">${ bom.production_id }</td>
                    <td>${ bom.bom_id }</td>
                    <td>${ bom.mid }</td>
                    <td>${ bom.bom_quantity }</td>
                </tr>
                <c:forEach var="bom" items="${ promat }" begin="1">
                    <tr>
                        <td>${ bom.bom_id }</td>
                        <td>${ bom.mid }</td>
                        <td>${ bom.bom_quantity }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <hr>
    <script src="/mes/JavaScript/table.js"></script>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</body>

</html>