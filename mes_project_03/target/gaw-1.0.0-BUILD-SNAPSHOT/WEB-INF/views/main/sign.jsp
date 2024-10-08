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
	width:100%;
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

.form-group.gender button.active, .form-group.nationality button.active {
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
</style>
</head>
<body>
    <div class="container">
        <div class="logo"><img src="resources/img/팀 로고 2.png">Grand All Win</div>

        <!-- 아이디 입력 -->
        <div class="form-group">
            <label for="id"><img src="resources/img/사람.png" class="icon">아이디</label>
            <input type="text" id="id" placeholder="아이디 입력">
        </div>

        <!-- 비밀번호 입력 -->
        <div class="form-group">
            <label for="password"><img src="resources/img/자물쇠.png" class="icon">비밀번호</label>
            <input type="password" id="password" placeholder="비밀번호 입력">
        </div>

        <!-- 이메일 입력 -->
        <div class="form-group">
            <label for="email"><img src="resources/img/편지지.png" class="icon">이메일 주소</label>
            <input type="email" id="email" placeholder="이메일 주소 (선택)">
        </div>

        <!-- 이름 입력 -->
        <div class="form-group">
            <label for="name"><img src="resources/img/사람.png" class="icon">이름</label>
            <input type="text" id="name" placeholder="이름 입력">
        </div>

        <!-- 생년월일 입력 -->
        <div class="form-group">
            <label for="birthdate"><img src="resources/img/달력.png" class="icon">생년월일</label>
            <input type="text" id="birthdate" placeholder="생년월일 8자리 (예: 19900101)">
        </div>

        <!-- 통신사 선택 -->
        <div class="form-group">
            <label for="carrier"><img src="resources/img/통신탑.png" class="icon">통신사 선택</label>
            <select id="carrier">
                <option value="">통신사 선택</option>
                <option value="skt">SKT</option>
                <option value="kt">KT</option>
                <option value="lg">LG U+</option>
            </select>
        </div>

        <!-- 성별 선택 -->
        <div class="form-group gender">
            <button type="button" class="gender-btn">남자</button>
            <button type="button" class="gender-btn">여자</button>
        </div>

        <!-- 내/외국인 선택 -->
        <div class="form-group nationality">
            <button type="button" class="nationality-btn active">내국인</button>
            <button type="button" class="nationality-btn">외국인</button>
        </div>

        <!-- 휴대전화번호 입력 -->
        <div class="form-group">
            <label for="phone"><img src="resources/img/폰.png" class="icon">휴대전화번호</label>
            <input type="text" id="phone" placeholder="휴대전화번호 입력">
        </div>

        <!-- 인증 약관 -->
        <div class="agreement" id="toggle-agreement">
            <span><input type="checkbox" id="agree-all" class="chk-agree">[필수] 인증 약관 전체동의</span>
            <span class="arrow">▼</span>
        </div>

        <!-- 드롭다운 약관 동의 -->
        <div class="agreement-content" id="agreement-content">
            <label><input type="checkbox" class="chk-agree" name="agree"> 개인정보 이용</label>
            <label><input type="checkbox" class="chk-agree" name="agree"> 통신사 이용약관</label>
            <label><input type="checkbox" class="chk-agree" name="agree"> 네이버 개인정보 수집</label>
        </div>

        <!-- 인증번호 입력 필드 -->
        <div id="verification-code-group" class="form-group">
            <label for="verification-code"><img src="resources/img/자물쇠.png" class="icon">인증번호 입력</label>
            <input type="text" id="verification-code" placeholder="인증번호 입력">
        </div>

        <!-- 인증 요청 버튼 -->
        <button class="submit-btn" id="request-verification">인증요청</button>

    </div>

    <script>
        const agreementToggle = document.getElementById('toggle-agreement');
        const agreementContent = document.getElementById('agreement-content');
        const arrow = document.querySelector('.arrow');
        const agreeAllCheckbox = document.getElementById('agree-all');
        const agreeCheckboxes = document.querySelectorAll('input[name="agree"]');
        const verificationCodeGroup = document.getElementById('verification-code-group');
        const requestVerificationButton = document.getElementById('request-verification');

        // 전체 동의 클릭 시, 드롭다운 토글
        agreementToggle.addEventListener('click', function () {
            const isExpanded = agreementContent.style.display === 'block';
            
            // 드롭다운 내용 표시/숨김
            agreementContent.style.display = isExpanded ? 'none' : 'block';
            
            // 화살표 회전
            arrow.classList.toggle('active');
        });

        // 성별 버튼 활성화
        const genderButtons = document.querySelectorAll('.gender-btn');
        genderButtons.forEach(button => {
            button.addEventListener('click', function () {
                genderButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // 내/외국인 버튼 활성화
        const nationalityButtons = document.querySelectorAll('.nationality-btn');
        nationalityButtons.forEach(button => {
            button.addEventListener('click', function () {
                nationalityButtons.forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });

        // 전체 동의 클릭 시, 하위 체크박스들도 모두 선택/해제
        agreeAllCheckbox.addEventListener('change', function () {
            agreeCheckboxes.forEach(checkbox => {
                checkbox.checked = agreeAllCheckbox.checked;
            });
        });

        // 인증 요청 버튼 클릭 시 인증번호 입력 필드 나타나기
        requestVerificationButton.addEventListener('click', function() {
            verificationCodeGroup.style.display = 'block'; // 인증번호 입력 필드를 보이게 함
        });
    </script>
</body>
</html>
