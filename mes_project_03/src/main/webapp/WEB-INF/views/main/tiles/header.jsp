<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="kr.or.gaw.dto.EmpDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
			EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");
			String username = loggedInUser.getName(); %>
			<%= username %>
			</a>
			님!
			</p>
			<a href="logout" id="logoutBtn">로그아웃</a> | 
			<a href="allposts" id="boardBtn">커뮤니티</a> | 
			<a href="adminpage" id="adminBtn">관리자 페이지</a> |
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
