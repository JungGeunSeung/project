<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/CSS/login.css" />
<link rel="stylesheet" href="resources/CSS/loading.css" />
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<script src="resources/javascript/translate.js"></script>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/tiles/header2.jsp" />

	<div class="login-container">
		<div class="logo">
			<img src="resources/img/팀 로고 2.png">
			<h1>Grand All Win</h1>
		</div>
		<h2>로그인</h2>
		<p>Grand All Win의 가구 조립 업체 MES 입니다.</p>
		<c:if test="${param.login != null}">
			<div style="color: red;">잘못된 아이디나 비밀번호입니다.</div>
		</c:if>

		<c:if test="${param.logout != null}">
			<div style="color: green;">성공적으로 로그아웃되었습니다.</div>
		</c:if>
		<form action="/gaw/login" method="post">
			<input type="text" name="user_id" placeholder="아이디" value="">
			<input type="password" name="password" placeholder="비밀번호" value="">
			<button type="submit" class="submit-btn">로그인</button>
		</form>
		<div class="signup">
			<p>
				아직 회원이 아니신가요? <a href="agreement">회원가입</a>
			</p>
		</div>
		<div class="find_pw">
			<p><a href="find">비밀번호 찾기</a></p>
		</div>
		<div class="footer">
			<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
		</div>
	</div>
	<!-- 로딩 CSS에 해당하는 HTML -->
   <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
</body>
</html>