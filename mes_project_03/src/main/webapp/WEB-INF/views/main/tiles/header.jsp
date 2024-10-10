<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<div class="header">
	<div class="headerBox">
		<div class="logo">
			<a href="#"><img src="resources/img/팀 로고 2.png" alt="메인페이지로이동"></a>
		</div>
		<div style="display: flex; align-items: center;">
			<p>
			어서오세요.
			<a id="profileTag" href="#">
<%-- 			<c:if test="${dto.name != null}"> --%>
			${dto.name }
<%-- 			</c:if> --%>
			</a>
			님
			</p>
			<a href="logout" id="logoutBtn">로그아웃</a>
			<a href="adminpage" id="adminBtn">관리자 페이지</a>
			<img id="lanImg" src="resources/img/지구 이모지 흰색.png"> 
			<form class="lanBox">
				<select>
					<option selected>한국어</option>
					<option>영어</option>
					<option>일본어</option>
				</select>
			</form>
		</div>
	</div>
</div>
