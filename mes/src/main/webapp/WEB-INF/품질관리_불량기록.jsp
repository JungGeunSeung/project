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
    <link rel="stylesheet" href="button.css">
</head>

<body>
   <!-- 사이드바 -->
    <jsp:include page="assetsform/sidebar.jsp"/>
    <!-- 	상단바 -->
    <jsp:include page="assetsform/topbar.jsp"/>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>검사 현황</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질 검사 현황을 볼 수 있는 페이지 입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
             <div class="cntdiv">
                <span>게시물</span>
                 <select name="cnt" id="cnt" onchange="changePageSize()">
                    <option value="10">10개씩</option>
                    <option value="20">20개씩</option>
                    <option value="30">30개씩</option>
                    <option value="40">40개씩</option>
                    <option value="50" selected>50개씩</option>
                </select>
                <div>
                    <div class="divbtn">
                        <button class="btn">전체</button>
                        <button class="btn">검사전</button>
                        <button class="btn">검사중</button>
                        <button class="btn">검사후</button>
                        <button class="btn">합격</button>
                        <button class="btn">불합격</button>
                    </div>
                    <div>
                    <button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
                    <span>날짜별 조회</span>
                    <input type="date" id="startdate"> ~ <input type="date" id="enddate">
                    <button class="btn">검색</button>
                    </div>

                </div> 

            </div>
        </div>

        <!-- 해당 목록 -->
        <div class="tableID">
            <table>
                <thead>
                  <tr>
                    <th><input type="checkbox" id="allchk"></th>
                    <th>품질기준 불량기록</th>
                    <th>불량기록 ID</th>
                    <th>품질검사 ID</th>
                    <th>제품 ID</th>
                    <th>계획 ID</th>
                    <th>불량 수량</th>
                    
                  </tr>
                </thead>
                <tbody>
                </tbody>
              </table>    
        </div>
        



</body>

<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
</html>