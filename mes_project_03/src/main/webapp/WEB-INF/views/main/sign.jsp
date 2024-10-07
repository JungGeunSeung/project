<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #e6f7e1; /* 연한 초록 배경 */
	color: #2e7d32; /* 짙은 초록 텍스트 */
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	width: 350px;
	background-color: #c8e6c9; /* 연한 초록 컨테이너 */
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2); /* 컨테이너 그림자 */
}

.logo {
	text-align: center;
	font-size: 24px;
	font-weight: bold;
	color: #00c73c; /* 초록색 로고 */
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

.form-group input, .form-group select {
	width: calc(100% - 20px); /* 좌우 여백을 동일하게 조정 */
	padding: 10px;
	background-color: #ffffff;
	border: 1px solid #4caf50; /* 초록 테두리 */
	border-radius: 5px;
	color: #2e7d32;
	box-sizing: border-box; /* 패딩과 너비를 포함한 계산 */
}

.form-group.gender, .form-group.nationality {
	display: flex;
	justify-content: space-between;
}

.form-group.gender button, .form-group.nationality button {
	flex: 1;
	margin: 0 5px;
	background-color: #e6f7e1; /* 연한 초록색 버튼 */
	color: #2e7d32;
	border: 1px solid #4caf50;
	padding: 10px;
	border-radius: 5px;
	cursor: pointer;
}

.form-group.gender button.active, .form-group.nationality button.active
	{
	background-color: #4caf50; /* 활성화된 버튼 */
	color: white;
}

.agreement {
	display: flex;
	justify-content: space-between;
	background-color: #ffffff;
	padding: 10px;
	border: 1px solid #4caf50;
	border-radius: 5px;
	color: #2e7d32;
	align-items: center;
	margin-bottom: 10px;
	cursor: pointer;
}

.agreement-content {
	display: none; /* 처음에는 숨김 */
	background-color: #f1f8e9;
	border: 1px solid #4caf50;
	padding: 10px;
	border-radius: 5px;
	margin-bottom: 20px;
}

.agreement-content label {
	display: block;
	margin-bottom: 10px;
}

.arrow {
	transform: rotate(0deg);
	transition: transform 0.3s ease;
}

.arrow.active {
	transform: rotate(180deg); /* 화살표 회전 */
}

.submit-btn {
	width: 100%;
	padding: 15px;
	background-color: #4caf50; /* 초록색 버튼 */
	border: none;
	border-radius: 5px;
	color: #ffffff;
	font-size: 16px;
	cursor: pointer;
}

.submit-btn:hover {
	background-color: #66bb6a; /* 버튼 hover 시 밝은 초록 */
}

.icon {
	width: 25px;
	margin-right: 5px;
	display: inline-block;
	vertical-align: middle;
}

.form-group label {
	vertical-align: middle;
}

.chk-agree {
	width: 17px;
	height: 17px;
}

#verification-code-group {
	display: none; /* 인증번호 입력 필드는 처음엔 숨김 */
	margin-top: 10px;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<div class="container">
		<form id="signup-form" action="sign.do" method="post">
			<div class="logo">
				<img src="resources/img/팀 로고 2.png">Grand All Win
			</div>

			<!-- 아이디 입력 -->
			<div class="form-group">
				<label for="id"><img src="resources/img/사람.png" class="icon">아이디</label>
				<input type="text" id="id" name="user_id" placeholder="아이디 입력">
			</div>

			<!-- 비밀번호 입력 -->
			<div class="form-group">
				<label for="password"><img src="resources/img/자물쇠.png" class="icon">비밀번호</label>
				<input type="password" id="password" name="password" placeholder="비밀번호 입력">
			</div>

			<!-- 이메일 입력 -->
			<div class="form-group">
				<label for="email"><img src="resources/img/편지지.png" class="icon">이메일 주소</label>
				<input type="email" id="email" name="email" placeholder="이메일 주소 (필수 인증필요)">
			</div>

			<!-- 이름 입력 -->
			<div class="form-group">
				<label for="name"><img src="resources/img/사람.png" class="icon">이름</label>
				<input type="text" id="name" name="name" placeholder="이름 입력">
			</div>

			<!-- 생년월일 입력 -->
			<div class="form-group">
				<label for="birthdate"><img src="resources/img/달력.png" class="icon">생년월일</label>
				<input type="date" id="birthdate" name="birth_date" placeholder="생년월일 8자리 (예: 19900101)">
			</div>

			<!-- 성별 선택 -->
			<div class="form-group gender">
				<button type="button" class="gender-btn gender-btn-1" data-value="1">남자</button>
				<button type="button" class="gender-btn gender-btn-2" data-value="2">여자</button>
				<input type="hidden" name="gender" value="1">
			</div>

			<!-- 내/외국인 선택 -->
			<div class="form-group nationality">
				<button type="button" class="nationality-btn active nationality-btn-1" data-value="1">내국인</button>
				<button type="button" class="nationality-btn nationality-btn-2" data-value="2">외국인</button>
				<input type="hidden" name="nationality" value="1">
			</div>

			<!-- 휴대전화번호 입력 -->
			<div class="form-group">
				<label for="phone"><img src="resources/img/폰.png" class="icon">휴대전화번호</label>
				<input type="text" id="phone" name="phone" placeholder="휴대전화번호 입력">
			</div>

			<!-- 인증 약관 -->
			<div class="agreement" id="toggle-agreement">
				<span><input type="checkbox" id="agree-all" class="chk-agree">[필수] 인증 약관 전체동의</span>
				<span class="arrow">▼</span>
			</div>

			<!-- 드롭다운 약관 동의 -->
			<div class="agreement-content" id="agreement-content">
				<label><input type="checkbox" class="chk-agree" name="agree"> [필수]개인정보 이용</label>
				<label><input type="checkbox" class="chk-agree" name="agree"> [필수]통신사 이용약관</label>
				<label><input type="checkbox" class="chk-agree" name="agree"> [필수]네이버 개인정보 수집</label>
			</div>

			<!-- 인증번호 입력 필드 -->
			<div id="verification-code-group" class="form-group">
				<label for="verification-code"><img src="resources/img/자물쇠.png" class="icon">인증번호 입력</label>
				<input type="text" id="verification-code" placeholder="인증번호 입력">
			</div>

			<!-- 인증 요청 버튼 -->
			<button type="button" class="submit-btn" id="request-verification">인증요청</button>

			<!-- 가입하기 버튼 (처음에는 숨김 처리) -->
			<input type="submit" value="가입하기" class="submit-btn hidden" id="signup-button">
		</form>
	</div>

	<script>
        const agreementToggle = document.getElementById('toggle-agreement');
        const agreementContent = document.getElementById('agreement-content');
        const arrow = document.querySelector('.arrow');
        const agreeAllCheckbox = document.getElementById('agree-all');
        const agreeCheckboxes = document.querySelectorAll('input[name="agree"]');
        const verificationCodeGroup = document.getElementById('verification-code-group');
        const requestVerificationButton = document.getElementById('request-verification');
        const signupButton = document.getElementById('signup-button');
        const genderButtons = document.querySelectorAll('.gender-btn');
        const nationalityButtons = document.querySelectorAll('.nationality-btn');
        let sentToken; // 이메일로 전송된 인증 코드를 저장할 변수
        
     // 성별 버튼 클릭 시 처리
        genderButtons.forEach(button => {
            button.addEventListener('click', function () {
                const genderInput = document.querySelector('input[name="gender"]');
                genderInput.value = this.getAttribute('data-value'); // data-value 속성에서 값 가져오기

                // 버튼의 active 클래스 처리
                genderButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // 내/외국인 버튼 클릭 시 처리
        nationalityButtons.forEach(button => {
            button.addEventListener('click', function () {
                const nationalityInput = document.querySelector('input[name="nationality"]');
                nationalityInput.value = this.getAttribute('data-value'); // data-value 속성에서 값 가져오기

                // 버튼의 active 클래스 처리
                nationalityButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });
        
        // 전체 동의 클릭 시, 드롭다운 토글
        agreementToggle.addEventListener('click', function () {
            const isExpanded = agreementContent.style.display === 'block';
            agreementContent.style.display = isExpanded ? 'none' : 'block';
            arrow.classList.toggle('active');
        });

        // 전체 동의 클릭 시, 하위 체크박스들도 모두 선택/해제
        agreeAllCheckbox.addEventListener('change', function () {
            agreeCheckboxes.forEach(checkbox => {
                checkbox.checked = agreeAllCheckbox.checked;
            });
        });

        // 인증 요청 버튼 클릭 시 이메일 전송
        requestVerificationButton.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            const email = document.getElementById('email').value;
            if (!email) {
                alert('이메일을 입력해주세요.');
                return;
            }

            // Ajax로 서버에 이메일 인증 요청
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'email', true); // 서버에서 이메일 전송을 처리하는 API
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        alert('이메일로 인증번호가 전송되었습니다.');
                        verificationCodeGroup.style.display = 'block'; // 인증번호 입력 필드를 보이게 함
                        requestVerificationButton.classList.add('hidden'); // 인증요청 버튼 숨기기
                        signupButton.classList.remove('hidden'); // 가입하기 버튼 보이기
                        sentToken = response.token; // 전송된 인증 코드를 저장 (서버에서 반환받은 경우)
                        console.log(sentToken);
                    } else {
                        alert('인증 요청에 실패했습니다. 다시 시도해주세요.');
                    }
                }
            };

            const data = JSON.stringify({ email: email });
            xhr.send(data);
        });
        
     	// 가입하기 버튼 클릭 시 인증 코드 확인
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            const inputToken = document.getElementById('verification-code').value; // 사용자가 입력한 인증 코드
            if (inputToken != sentToken) {
                alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
                return;
            }

            // 인증 코드가 일치할 경우, 가입 처리 로직을 추가합니다.
            alert('가입이 완료되었습니다!'); // 가입 완료 메시지
            document.querySelector('#signup-form').submit();
        });
    </script>
</body>
</html>
