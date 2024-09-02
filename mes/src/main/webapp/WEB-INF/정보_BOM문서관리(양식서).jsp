


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
            <h1>문서관리(양식서)</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>회사에서 사용하는 문서들을 관리하는 페이지입니다.</span> <br>
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
                <!-- 검색조건을 바꿀 select -->
                <div>
                    <button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
                    <span>날짜별 조회</span>
                    <input type="date" id="startdate"> ~ <input type="date" id="enddate">
                    <button class="btn">검색</button>

                </div> 

            </div>
        </div>

        <!-- 해당 목록 -->
        <div class="tableID">
            <table>
                <thead>
                  <tr>
                    <th><input type="checkbox" id="allchk"></th>
                    <th>문서번호</th>
                    <th>문서명</th>
                    <th>부서명</th>
                    <th>다운로드</th>
                    <th>작성/개정자</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>GS001</td>
                    <td>자사 품질 기준</td>
                    <td>품질관리 팀</td>
                    <td>CLICK</td>
                    <td>조민정</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>KS0012</td>
                    <td>KS표준인증</td>
                    <td>품질관리 팀</td>
                    <td>CLICK</td>
                    <td>박규태</td>
                  </tr>
                </tbody>
              </table>
        </div>
            <hr>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
</html>