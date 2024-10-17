<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="resources/CSS/loading.css" />
<link rel="stylesheet" href="resources/CSS/sign.css" />
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
</head>
<body>
	<div class="container">
		<form id="signup-form" action="sign.do" method="post">
			<div class="logo">
				<a href="login"><img src="resources/img/팀 로고 2.png" alt="로그인 페이지로 이동"></a>Grand All Win
			</div>

			<!-- 아이디 입력 -->
			<div class="form-group">
				<label for="id"><img src="resources/img/사람.png" class="icon">아이디</label>
				<input type="text" id="user_id" name="user_id" placeholder="아이디 입력">
				<button class="overlap-btn" id="check-duplicate-btn">중복확인</button>
			</div>

			<!-- 비밀번호 입력 -->
			<div class="form-group">
				<label for="password"><img src="resources/img/자물쇠.png"
					class="icon">비밀번호</label> <input type="password" id="password"
					name="password" placeholder="비밀번호 입력"><br>
					<!-- 경고 메시지 -->
				<span id="password-condition" style="color: red; display: none; font-size:12px;">비밀번호는 숫자,문자,특수문자를 포함하여 8~20 글자 이내가 되야 합니다.</span>
			</div>

			<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="confirm-password"><img
					src="resources/img/자물쇠.png" class="icon">비밀번호 확인</label> <input
					type="password" id="confirm-password" name="confirm-password"
					placeholder="비밀번호 확인">
				<!-- 경고 메시지 -->
				<span id="password-error" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
			</div>

			<!-- 이메일 입력 -->
			<div class="form-group">
				<label for="email"><img src="resources/img/편지지.png"
					class="icon">이메일 주소</label> <input type="email" id="email"
					name="email" placeholder="이메일 주소 (필수 인증필요)">
			</div>

			<!-- 이름 입력 -->
			<div class="form-group">
				<label for="name"><img src="resources/img/사람.png"
					class="icon">이름</label> <input type="text" id="name" name="name"
					placeholder="이름 입력">
			</div>

			<!-- 생년월일 입력 -->
			<div class="form-group">
				<label for="birthdate"><img src="resources/img/달력.png"
					class="icon">생년월일</label> <input type="date" id="birthdate"
					name="birth_date" placeholder="생년월일 8자리 (예: 19900101)">
			</div>

			<!-- 성별 선택 -->
			<div class="form-group gender">
				<button type="button" class="gender-btn active gender-btn-1" data-value="1">남자</button>
				<button type="button" class="gender-btn gender-btn-2" data-value="2">여자</button>
				<input type="hidden" id="gender" name="gender" value="1">
			</div>

			<!-- 내/외국인 선택 -->
			<div class="form-group nationality">
				<button type="button"
					class="nationality-btn active nationality-btn-1" data-value="1">내국인</button>
				<button type="button" class="nationality-btn nationality-btn-2"
					data-value="2">외국인</button>
				<input type="hidden" id="nationality" name="nationality" value="1">
			</div>

			<!-- 휴대전화번호 입력 -->
			<div class="form-group">
				<label for="phone"><img src="resources/img/폰.png"
					class="icon">휴대전화번호</label> <input type="text" id="phone"
					name="phone" placeholder="휴대전화번호 입력">
			</div>

			<!-- 인증 약관 -->
			<div class="agreement" id="toggle-agreement">
				<span><input type="checkbox" id="agree-all" class="chk-agree">[필수]
					인증 약관 전체동의</span> <span class="arrow">▼</span>
			</div>

			<!-- 드롭다운 약관 동의 -->
			<div class="agreement-content" id="agreement-content">
				<label><input type="checkbox" class="chk-agree" name="agree">
					[필수]개인정보 이용</label> <label><input type="checkbox" class="chk-agree"
					name="agree"> [필수]통신사 이용약관</label> <label><input
					type="checkbox" class="chk-agree" name="agree"> [필수]개인정보 수집</label>
			</div>

			<!-- 인증번호 입력 필드 -->
			<div id="verification-code-group" class="form-group">
				<label for="verification-code"><img
					src="resources/img/자물쇠.png" class="icon">인증번호 입력</label> <input
					type="text" id="verification-code" placeholder="인증번호 입력">
			</div>

			<!-- 인증 요청 버튼 -->
			<button type="button" class="submit-btn" id="request-verification">인증요청</button>

			<!-- 가입하기 버튼 (처음에는 숨김 처리) -->
			<input type="submit" value="가입하기" class="submit-btn hidden"
				id="signup-button">
		</form>
	</div>
	<!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

	<script src="resources/javascript/sign.js"></script>
</body>
</html>
