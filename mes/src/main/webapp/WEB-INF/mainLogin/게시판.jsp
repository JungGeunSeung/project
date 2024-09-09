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
	<!-- 사이드바 -->
	<div class="sidebar">
		<a href="main"> <img class="Logo" src="/mes/Image/로고.png" alt=""></a>


		<div class="profile" id="bos">
			<img src="/mes/Image/정근승.png" alt="프로필 사진">
			<h2>정근승</h2>
			<p>대표이사</p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='login'">

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="관리자페이지" class="btn"
					onclick="location.href='관리자'">
			</div>
		</div>

		<div class="cal_kwon">
			<div id="calendar"></div>
			<script src="/mes/JavaScript/calendar_nomall.js"></script>
		</div>

		<h3>열어본 페이지 목록</h3>
		<ul>
			<li><a href="#가장최근에 열어본 페이지">재고관리</a></li>
			<li><a href="#열어본 페이지">생산관리</a></li>
		</ul>

	</div>

	<!--/////////////////////////////////////////////////////////////-->
	<!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
	<div class="content">
		<div class="menu">
			<ul>
				<!--상위 메뉴-->
				<li class="menu-item"><a href="#">정보/BOM</a>
					<div class="submenu">
						<ul>
							<!--하위메뉴-->
							<li><a href="BOM">BOM</a></li>
							<li class="manager"><a href="설비코드">설비코드</a></li>
							<li><a href="조직도">조직도</a></li>
							<li><a href="문서관리">BOM문서관리(양식서)</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="#">재고관리</a>
					<div class="submenu">
						<ul>
							<li><a href="자재관리">자재입출고(자재관리)</a></li>
							<li class="manager"><a href="재고관리">재고관리</a></li>
							<li><a href="저장위치">저장위치(MAP)</a></li>
						</ul>
					</div></li>

				<li class="menu-item manager"><a href="#">품질관리</a>
					<div class="submenu">
						<ul>
							<li><a href="시험항목_품질기준">제품별 시험항목/품질기준</a></li>
							<li><a href="생산검사현황">생산검사현황</a></li>
							<li><a href="검사현황">검사현황</a></li>
						</ul>
					</div></li>

				<li class="menu-item"><a href="#">생산관리</a>
					<div class="submenu">
						<ul>
							<li><a href="생산계획목록">생산계획목록</a></li>
							<li><a href="작업지시서목록">작업지시목록</a></li>
							<li><a href="생산실적">생산실적</a></li>
						</ul>
					</div></li>

				<li class="menu-item manager"><a href="#">설비관리</a>
					<div class="submenu">
						<ul>
							<li><a href="공정별설비관리">공정별설비관리/수리보고서</a></li>
							<li><a href="설비고장_수리이력">설비고장/수리이력</a></li>
							<li><a href="비가동이력">비가동이력</a></li>
						</ul>
					</div></li>
			</ul>

		</div>
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