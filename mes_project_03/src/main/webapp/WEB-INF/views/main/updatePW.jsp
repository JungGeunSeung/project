<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>정보찾기</title>
	<link rel="stylesheet" href="resources/CSS/loading.css" />
	<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
	<style>
		body {
			font-family: Arial, sans-serif;
			background-color: #e6f7e1;
			color: #2e7d32;
			padding: 20px;
			display: flex;
			justify-content: center;
			align-items: center;
			height: 100vh;
		}

		.container {
			width: 350px;
			background-color: #c8e6c9;
			padding: 20px;
			border-radius: 10px;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
			margin-top: 50px;
		}

		.logo {
			text-align: center;
			font-size: 24px;
			font-weight: bold;
			color: #00c73c;
			margin-bottom: 20px;
		}
		
		.logo img {
			width: 100%;
		}

		.form-group {
			margin-bottom: 20px;
		}

		.form-group label {
			display: block;
			margin-bottom: 5px;
			color: #2e7d32;
		}

		.form-group input {
			width: calc(100% - 20px);
			padding: 10px;
			background-color: #ffffff;
			border: 1px solid #4caf50;
			border-radius: 5px;
			color: #2e7d32;
			box-sizing: border-box;
		}

		.submit-btn {
			width: 100%;
			padding: 15px;
			background-color: #4caf50;
			border: none;
			border-radius: 5px;
			color: #ffffff;
			font-size: 16px;
			cursor: pointer;
		}

		.submit-btn:hover {
			background-color: #66bb6a;
		}

		.icon {
			width: 25px;
			margin-right: 5px;
			display: inline-block;
			vertical-align: middle;
		}

		#verification-code-group {
			display: none;
			margin-top: 10px;
		}

		.spanEL {
			margin-left: 30px;
		}
	</style>
</head>

<body>
	<div class="container">
		<form id="signup-form" action="updatePW.do" method="post">
			<div class="logo">
				<img src="resources/img/팀 로고 2.png">Grand All Win
			</div>

			<!-- 아이디 입력 -->
			<div class="form-group">
				<label for="id"><img src="resources/img/사람.png" class="icon">아이디<br>
				<input type="hidden" name="user_id" value="${dto.user_id}">
				<span class="spanEL">${dto.user_id}</span></label>
			</div>

			<!-- 이메일 입력 -->
			<div class="form-group">
				<label for="email"><img src="resources/img/편지지.png" class="icon">이메일 주소<br>
				<span class="spanEL">${dto.email}</span></label>
			</div>

			<!-- 비밀번호 입력 -->
			<div class="form-group">
				<label for="password"><img src="resources/img/자물쇠.png" class="icon">비밀번호</label> 
				<input type="password" id="password" name="password" placeholder="비밀번호 입력">
				<span id="password-condition" style="color: red; display: none; font-size:12px;">비밀번호는 숫자,문자,특수문자를 포함하여 8~20 글자 이내가 되야 합니다.</span>
			</div>

			<!-- 비밀번호 확인 -->
			<div class="form-group">
				<label for="confirm-password"><img src="resources/img/자물쇠.png" class="icon">비밀번호 확인</label>
				<input type="password" id="confirm-password" name="confirm-password" placeholder="비밀번호 확인">
				<!-- 경고 메시지 -->
				<span id="password-error" style="color: red; display: none;">비밀번호가 일치하지 않습니다.</span>
			</div>

			<!-- 인증 요청 버튼 -->
			<button type="submit" class="submit-btn" id="request-verification">변경하기</button>
		</form>
	</div>

	<!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	<script>
	// 정규식: 숫자, 문자, 특수문자 포함 여부 및 길이 확인
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	document.getElementById('confirm-password').addEventListener('keyup', function() {
	    // 비밀번호와 비밀번호 확인 입력값을 가져옴
	    const password = document.getElementById('password').value;
	    const confirmPassword = document.getElementById('confirm-password').value;
	    const errorMessage = document.getElementById('password-error');
	
	    // 비밀번호와 비밀번호 확인이 일치하지 않을 때 경고 메시지 표시
	    if (password !== confirmPassword) {
	        errorMessage.style.display = 'block';
	    } else {
	        errorMessage.style.display = 'none';
	    }
	});
	
	// 패스워드 유효성 검사
/*	document.getElementById('password').addEventListener('input', function() {
	    const password = this.value;
	    const errorMessage = document.getElementById('password-condition');
	    

	    if (passwordRegex.test(password)) {
	        // 비밀번호가 유효할 때
	        errorMessage.style.display = 'none';
	    } else {
	        // 비밀번호가 유효하지 않을 때
	        errorMessage.style.display = 'block';
	    }
		});
		*/
	
	document.querySelector('#signup-form').addEventListener('submit', function(event) {
	    event.preventDefault(); // 기본 폼 제출 방지
	    if (confirm("비밀번호를 변경하시겠습니까?")) {
	        alert('비밀번호가 변경되었습니다.');
	        document.querySelector('#signup-form').submit(); // 폼 제출
	    } else {
	        alert('비밀번호 변경이 취소되었습니다.');
	        return;
	    }
	});
	</script>
</body>

</html>
