<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="hong.material.dto.UserDTO" %>
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
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

	<title>소원을 들어주는 MES</title>

</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->

	<div class="main_page">
		<!-- <h3>현황판</h3> -->
		<div class="main_page_kw">
			<div class="main_page_kw2">
				<!-- 생산계획 -->
				<h1>생산계획/작업지시서</h1>
				<div class="tableID">
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" id="allchk"></th>
								<th>순위</th>
								<th>계획날짜</th>
								<th>제품명</th>
								<th>원료</th>
								<th>현 재고</th>
								<th>계획 수량</th>
								<th>단가</th>
								<th>발주처</th>
								<th>작업위치</th>
								<th>작성자</th>
								<th>승인자</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" id="tablechk"></td>
								<td>3</td>
								<td>24.08.03</td>
								<td>EF 110mm Pipe</td>
								<td>E839127</td>
								<td>1,500</td>
								<td>6,000</td>
								<td>40,000</td>
								<td>(주)대한</td>
								<td>7호기, 8호기</td>
								<td>김승환</td>
								<td><a href="">정근승</a></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="tablechk"></td>
								<td>2</td>
								<td>24.08.04</td>
								<td>EF 140mm End Cap</td>
								<td>E839128</td>
								<td>700</td>
								<td>2,000</td>
								<td>50,000</td>
								<td>(주)휴먼</td>
								<td>9호기, 10호기</td>
								<td>조민정</td>
								<td><a href="">김소원</a></td>
							</tr>
							<tr>
								<td><input type="checkbox" id="tablechk"></td>
								<td>4</td>
								<td>24.08.05</td>
								<td>EF 160mm Pipe</td>
								<td>E839129</td>
								<td>800</td>
								<td>3,500</td>
								<td>55,000</td>
								<td>(주)하나</td>
								<td>11호기, 12호기</td>
								<td>김성령</td>
								<td><a href="">정다올</a></td>
							</tr>
						</tbody>
					</table>
				</div>


			</div>
			<div>
				<!-- 공정현황 -->
				<h2>공정현황</h2>
				<div class="board">
					<!-- 차트를 표시할 캔버스 요소 -->
					<canvas id="bar-chart" width=100% height=100%></canvas>
					<script src="/mes/JavaScript/chart.js"></script>
				</div>

			</div>
		</div>

		<div class="main_page_kw">
			<div>
				<!-- 생산실적 현황 -->
				<h1>생산실적현황</h1>
				<canvas id="productionChart" width="400" height="400"></canvas>
			</div>

			<div>
				<!-- 게시판 -->
				<h2>
					<a href="/mes/board">공지사항(게시판)</a>
				</h2>
				<button id="button1" class="btn">글쓰기</button>
				<script>
					document.getElementById('button1').addEventListener(
						'click',
						function () {
							window.open('글쓰기', '글쓰기',
								'width=400,height=500');
						});
				</script>
				<table class="table">
					<thead>
						<tr class="header">
							<td class="num">번호</td>
							<td class="title">제목</td>
							<td class="content_kw">내용</td>
							<td class="width_kw main_hidden">작성자</td>
							<td class="width_kw">작성날짜</td>
							<td class="width_kw">관리</td>
						</tr>
					</thead>
					<tbody id="list">
						<!-- 버튼 클릭후 게시글 작성시 추가되는 영역 -->
					</tbody>
				</table>
				<br>

				<div id="pagination"></div>
				<script src="/mes/JavaScript/게시판.js"></script>
			</div>




		</div>
	</div>
	</div>

	</div>

</body>
<!-- <script src="/mes/JavaScript/sort.js"></script> -->
<!-- <script src="/mes/JavaScript/date.js"></script> -->
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/perchart.js"></script>


</html>