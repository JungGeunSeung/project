<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/mes/JavaScript/load_info.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>소원을 들어주는 MES</title>

<style>
a {
            display: inline-block;
            padding: 0;
            margin: 0;
            text-decoration-line: none;
        }
        #userinfo {
            line-height: normal;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        #pagination button {
            margin: 0 4px;
            padding: 8px 16px;
        }
        #pagination {
            text-align: center;
        }
        .write {
            text-align: right;
            margin-top: 35px;
        }
        .btnnn {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
        }
        .xxx {
            position: absolute;
            right: 180px;
            top: -11px;
        }
        .yyy {
            position: relative;
            left: 500px;
        }
        .mainmain {
            width: 100%;
            height: 100%;
        }
        body, html {
            width: 100%;
            height: 100%;
        }
        .cate .menu {
            background-color: #ffffff;
            border: 1px solid #ccc;
        }
        .cate .menu.active {
            background-color: rgb(218, 231, 255);
        }
        .asdasd {
            height: 80px;
            color: black;
            font-size: 24px;
            border-bottom: 1px solid lightgray;
        }
        .delete-btn {
            background-color: #d9534f;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        .delete-btn:hover {
            background-color: #c9302c;
        }
</style>

</head>

<body>
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!--/////////////////////////////////////////////////////////////-->
	<!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
	<div class="content">
		<hr>
		<!-- 메인메뉴 아레 정보가 표시될 영역 -->

		<div class="main_page">
			<div class="notince" style="width: 80%; height: 80%; display: inline-block; margin-left: 100px;">
				<div class="t1" style="width: 100%; height: 78%;">
					<div style="height: 515px;">
						<table>
							<tr>
								<th style="width: 50px;">번호</th>
								<th>제목</th>
								<th style="width: 130px;">작성자</th>
								<th>작성날짜</th>
								<th>조회수</th>
								<th>삭제</th>
							</tr>
							<tbody id="posts">
								<!-- 게시글 데이터가 여기에 삽입됩니다 -->
							</tbody>
						</table>
					</div>
					<div id="pagination"></div>
				</div>
				<div class="scc" style="text-align:center;">
					<input class="sch" type="text" name="search"
						placeholder="검색어를 입력하세요">
					<button class="sb" name="검색" value="검색">검색</button>
				</div>
				<div class="write">
					<a href="articletocomm"> 
						<input type="button" class="btnnn" value="글쓰기">
					</a>
				</div>
			</div>
		</div>
	</div>
       
</body>
<!-- <script src="/mes/JavaScript/comments.js"></script> -->
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/perchart.js"></script>


</html>