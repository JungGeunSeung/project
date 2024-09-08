<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hong.material.dto.UserDTO"%>
<!-- 사이드바 -->
	<div class="sidebar">
		<a href="/mes/main"><img class="Logo" src="/mes/Image/로고.png" alt=""></a>

		<%
			HttpSession session1 = request.getSession();
			UserDTO dto = (UserDTO) session1.getAttribute("user");
		
		%>

		<div class="profile">
			<img src="/mes/Image/정근승.png" alt="프로필 사진">
			<h2><%=dto.getName() %></h2>
			<p><%=dto.getGrade() %></p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='/mes/logout'">

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="관리자페이지" class="btn"
					onclick="location.href='/mes/관리자'">
			</div>
		</div>

		<div class="cal_kwon">
			<div id="calendar"></div>
			<script src="/mes/JavaScript/calendar_nomall.js"></script>
		</div>

	</div>

	<!--/////////////////////////////////////////////////////////////-->
	<!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
	<!-- topbar -->
	<!-- 	div 닫는 태그 일부러 안씀 -->
	<div class="content">
		<div class="menu">
			<ul>
				<!--상위 메뉴-->
				<li class="menu-item"><a href="/mes/BOM/list">정보/BOM</a>
					<div class="submenu">
						<ul>
							<!--하위메뉴-->
							<li><a href="/mes/BOM/list">BOM</a></li>
							<%
                            	if(dto.getGrade().equals("관리자")) {
                            %>
							<li><a href="/mes/Equip/list">설비코드</a></li>
							<%
                            	}
                            %>
							<li><a href="/mes/Organization">조직도</a></li>
							<li><a href="/mes/doc/list">BOM문서관리(양식서)</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="/mes/material/list">재고관리</a>
					<div class="submenu">
						<ul>
							<li><a href="/mes/material/list">입출고관리</a></li>
							<%
                            	if(dto.getGrade().equals("관리자")) {
                            %>
							<li><a href="/mes/stock/list">재고관리</a></li>
							<%
                            	}
                            %>
							<li><a href="/mes/map">저장위치(MAP)</a></li>
						</ul>
					</div></li>

				<%
                    if(dto.getGrade().equals("관리자")) {
                %>
				<li class="menu-item"><a href="/mes/standard/list">품질관리</a>
					<div class="submenu">
						<ul>
							<li><a href="/mes/standard/list">제품별 시험항목/품질기준</a></li>
							<li><a href="/mes/quality/list">생산검사현황</a></li>
							<li><a href="/mes/defect/list">불량검사현황</a></li>
						</ul>
					</div></li>
				<%
                    }
                %>
				<li class="menu-item"><a href="#">생산관리</a>
					<div class="submenu">
						<ul>
							<li><a href="">생산계획목록</a></li>
							<li><a href="">작업지시목록</a></li>
							<li><a href="">생산실적</a></li>
							<li><a href="">생산실적보고서</a></li>
						</ul>
					</div></li>
				<%
                    if(dto.getGrade().equals("관리자")) {
                %>
				<li class="menu-item"><a href="#">설비관리</a>
					<div class="submenu">
						<ul>
							<li><a href="/mes/Equip">설비고장/수리이력</a></li>
							<li><a href="/mes/non">비가동이력</a></li>
						</ul>
					</div>
				</li>
				<%
                    }
                %>
			</ul>

		</div>
		<hr>