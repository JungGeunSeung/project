<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	color: #ffffff;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
	background-color: #e6f7e1;
	/* 연한 초록 배경색 */
}

.header {
	position: fixed;
	top: 0;
	width: 100%;
/* 	background-color: #4caf50; */
	/* 헤더 배경 초록색 */
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	z-index: 1000;
}

.headerBox {
	display: flex;
	justify-content: space-between;
	width: 100%;
	align-items: center;
}

.headerBox .logo img {
	height: 80px;
}

#lanImg {
	width: 30px;
	margin-left: 10px;
	margin-right: 10px;
}

.lanBox select {
	background-color: inherit;
	/* 선택 박스도 초록 */
	color: #2e7d32;
	border: none;
	padding: 5px;
	border-radius: 1px;
}

.lanBox {
	margin: 0px;
	font-size: 18px;
}

.login-container {
	text-align: center;
	background-color: #c8e6c9;
	/* 연한 초록 컨테이너 */
	padding: 40px;
	border-radius: 10px;
	width: 350px;
	box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.2);
	margin-top: 120px;
}

.logo h1 {
	font-size: 24px;
	color: #2e7d32;
	/* 짙은 초록색 */
	margin-bottom: 20px;
}

.logo img {
	width: 100%
}

h2 {
	font-size: 22px;
	margin-bottom: 10px;
	color: #388e3c;
	/* 짙은 초록색 제목 */
}

p {
	font-size: 14px;
	margin-bottom: 30px;
	color: #4caf50;
	/* 중간 초록색 설명 */
}

form {
	margin-bottom: 20px;
}

input[type="email"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid #81c784;
	/* 연한 초록 테두리 */
	background-color: #ffffff;
	color: #4caf50;
	font-size: 16px;
}

input[type="email"]::placeholder {
	color: #8f8f8f;
}

input[type="password"] {
	width: 100%;
	padding: 12px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid #81c784;
	/* 연한 초록 테두리 */
	background-color: #ffffff;
	color: #4caf50;
	font-size: 16px;
}

input[type="password"]::placeholder {
	color: #8f8f8f;
}

.submit-btn {
	width: 100%;
	padding: 12px;
	background-color: #4caf50;
	/* 메인 버튼 초록색 */
	border: none;
	border-radius: 5px;
	color: #ffffff;
	font-size: 16px;
	cursor: pointer;
}

.submit-btn:hover {
	background-color: #66bb6a;
	/* hover 시 더 밝은 초록색 */
}

.alt-login {
	display: block;
	margin-bottom: 20px;
	color: #2e7d32;
	text-decoration: none;
}

.alt-login:hover {
	color: #4caf50;
}

.or-divider {
	margin: 20px 0;
	font-size: 14px;
	color: #4caf50;
}

.social-login {
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.social-btn {
	padding: 12px;
	border: none;
	border-radius: 5px;
	width: 70px;
	font-size: 14px;
	cursor: pointer;
	background-color: #81c784;
	/* 소셜 버튼도 초록 계열 */
	color: white;
}

.signup {
	margin-bottom: 20px;
}

.signup a {
	color: #4caf50;
	text-decoration: underline;
}

.signup a:hover {
	text-decoration: underline;
}

.footer {
	font-size: 12px;
	color: #388e3c;
}

.footer a {
	color: #388e3c;
	text-decoration: none;
}

.footer a:hover {
	color: #66bb6a;
}
</style>
</head>
<body>
	<div class="header">
		<div class="headerBox">
			<div class="logo">
				<a href="#"><img src="resources/img/Logo(white).png"></a>
			</div>
			<div style="display: flex; align-items: center;">
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

	<div class="login-container">
		<div class="logo">
			<img src="resources/img/Logo(white).png">
			<h1>Grand All Win</h1>
		</div>
		<h2>로그인</h2>
		<p>Grand All Win의 가구 조립 업체 MES 입니다.</p>
		<form action="#" method="post">
			<input type="email" placeholder="이메일 주소" required>
			<input type="password" placeholder="비밀번호" required>
			<button type="submit" class="submit-btn">로그인</button>
		</form>
		<div class="signup">
			<p>
				아직 회원이 아니신가요? <a href="#">회원가입</a>
			</p>
		</div>
		<div class="footer">
			<a href="#">이용약관</a> | <a href="#">개인정보처리방침</a>
		</div>
	</div>
</body>
</html>