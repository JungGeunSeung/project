<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.UserDTO"%>
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

</head>

<body>
	<!-- 사이드바 -->
	<div class="sidebar">
		<a href="main"><img class="Logo" src="/mes/Image/로고.png" alt=""></a>

		<%
			HttpSession session1 = request.getSession();
			UserDTO dto = (UserDTO) session1.getAttribute("user");
			System.out.print(dto.getName());
		
		%>

		<div class="profile">
			<img src="/mes/Image/정근승.png" alt="프로필 사진">
			<h2><%=dto.getName() %></h2>
			<p><%=dto.getGrade() %></p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='logout'">

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
							<%
                            	if(dto.getGrade().equals("관리자")) {
                            %>
							<li><a href="설비코드">설비코드</a></li>
							<%
                            	}
                            %>
							<li><a href="조직도">조직도</a></li>
							<li><a href="문서관리">BOM문서관리(양식서)</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="#">재고관리</a>
					<div class="submenu">
						<ul>
							<li><a href="자재관리">자재입출고(자재관리)</a></li>
							<%
                            	if(dto.getGrade().equals("관리자")) {
                            %>
							<li><a href="재고관리">재고관리</a></li>
							<%
                            	}
                            %>
							<li><a href="저장위치">저장위치(MAP)</a></li>
						</ul>
					</div></li>

				<%
                    if(dto.getGrade().equals("관리자")) {
                %>
				<li class="menu-item"><a href="#">품질관리</a>
					<div class="submenu">
						<ul>
							<li><a href="시험항목_품질기준">제품별 시험항목/품질기준</a></li>
							<li><a href="생산검사현황">생산검사현황</a></li>
							<li><a href="검사현황">검사현황</a></li>
						</ul>
					</div></li>
				<%
                    }
                %>
				<li class="menu-item"><a href="#">생산관리</a>
					<div class="submenu">
						<ul>
							<li><a href="생산계획목록">생산계획목록</a></li>
							<li><a href="작업지시서목록">작업지시목록</a></li>
							<li><a href="생산실적">생산실적</a></li>
							<li><a href="생산실적보고서">생산실적보고서</a></li>
						</ul>
					</div></li>
				<%
                    if(dto.getGrade().equals("관리자")) {
                %>
				<li class="menu-item"><a href="#">설비관리</a>
					<div class="submenu">
						<ul>
							<li><a href="공정별설비관리">공정별설비관리/수리보고서</a></li>
							<li><a href="설비고장_수리이력">설비고장/수리이력</a></li>
							<li><a href="비가동이력">비가동이력</a></li>
						</ul>
					</div>
				</li>
				<%
                    }
                %>
			</ul>

		</div>
		<hr>
		<!-- 메인메뉴 아레 정보가 표시될 영역 -->

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
						<a href="게시판">공지사항(게시판)</a>
					</h2>
					<button id="button1" class="btn">글쓰기</button>
					<script>
						document.getElementById('button1').addEventListener(
								'click',
								function() {
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