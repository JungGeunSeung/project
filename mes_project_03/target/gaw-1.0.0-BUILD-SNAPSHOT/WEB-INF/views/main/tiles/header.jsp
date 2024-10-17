<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.gaw.dto.EmpDTO, javax.servlet.http.HttpSession"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
<div class="header">
	<div class="headerBox">
		<div class="logo">
			<a href="/gaw/mainpage"><img src="resources/img/팀 로고 2.png" alt="메인페이지로이동"></a>
		</div>
		<div style="display: flex; align-items: center;">
			<p>
			어서오세요.
			<a id="profileTag" href="#">
			<% 
			String username ="";
			String userposition ="";
			try {
		        EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");

		        // 로그인 정보가 없는 경우 (Null 체크)
		        if (loggedInUser == null) {
		            response.sendRedirect("/gaw/login"); // 로그인 페이지로 리다이렉트
		            return; // 리다이렉트 후 아래 코드를 실행하지 않도록 종료
		        }

		        username = loggedInUser.getName();
		        userposition = loggedInUser.getPosition();

		    } catch (Exception e) {
		        // 예외 발생 시 로그인 페이지로 리다이렉트
		        response.sendRedirect("/gaw/login");
		        return;
		    } %>
			<%= username %>
			</a>
			님!
			</p>
			<a href="logout" id="logoutBtn">로그아웃</a> | 
			<a href="allposts" id="boardBtn">커뮤니티</a> | 
			<% if(userposition.equals("부장")) { %>
			<a href="adminpage" id="adminBtn">관리자 페이지</a> | <%} %>
			<a href="mypage" id="adminBtn">마이 페이지</a> |
			<img id="lanImg" src="resources/img/지구 이모지 흰색.png"> 
			<form class="lanBox">
				<select id="languageSelect">
					<option value="ko" selected>한국어</option>
					<option value="en">영어</option>
					<option value="ja">일본어</option>
				</select>
			</form>
		</div>
	</div>
</div>
<script src="resources/javascript/translate.js"></script>
