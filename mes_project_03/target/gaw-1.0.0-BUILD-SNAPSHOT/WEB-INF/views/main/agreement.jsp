<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동의 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f7e1; /* 연한 초록 배경 */
            color: #2e7d32; /* 짙은 초록 텍스트 */
            padding: 20px;
        }

        .container {
            width: 500px;
            margin: 0 auto;
            background-color: #c8e6c9; /* 연한 초록 컨테이너 */
            padding: 20px;
            border-radius: 10px;
        }

        .logo {
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            color: #00c73c; /* 메인 로고 색상 */
            margin-bottom: 20px;
        }

        .agreement-item {
            margin-bottom: 20px;
        }

        .agreement-header {
            display: flex;
            justify-content: space-between;
            background-color: #a5d6a7; /* 중간 초록 배경 */
            padding: 10px;
            border-radius: 5px;
            align-items: center;
        }

        .agreement-header label {
            cursor: pointer;
            color: #2e7d32; /* 짙은 초록 텍스트 */
        }

        .agreement-content {
            background-color: #f1f8e9; /* 더 밝은 초록 배경 */
            color: #2e7d32; /* 짙은 초록 텍스트 */
            padding: 10px;
            border-radius: 5px;
            max-height: 100px; /* 최대 높이 설정 */
            overflow-y: auto; /* 스크롤바 추가 */
            margin-top: 10px;
        }

        .agreement-content p {
            margin: 0;
        }

        .button {
            width: 100%;
            padding: 15px;
            text-align: center;
            background-color: #81c784; /* 연한 초록 버튼 */
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 18px;
            cursor: not-allowed;
        }

        .button.active {
            background-color: #4caf50; /* 활성화된 초록 버튼 */
            cursor: pointer;
        }

        .button.active:hover {
            background-color: #66bb6a; /* 버튼 hover 시 더 밝은 초록색 */
        }

        /* 둥근 체크박스 스타일링 */
        .agree, #agree-all {
            appearance: none;
            width: 20px;
            height: 20px;
            background-color: white; /* 체크박스 배경색 */
            border: 2px solid #81c784; /* 테두리 색상 */
            border-radius: 50%; /* 둥근 모서리 */
            cursor: pointer;
            position: relative;
        }

        .agree:checked, #agree-all:checked {
            background-color: #4caf50; /* 선택된 체크박스 배경색 */
            border-color: #4caf50; /* 선택된 체크박스 테두리 */
        }

        .agree:checked::before, #agree-all:checked::before {
            content: "";
            position: absolute;
            top: 2px;
            left: 6px;
            width: 5px;
            height: 10px;
            border: solid white;
            border-width: 0 2px 2px 0;
            transform: rotate(45deg);
        }

    </style>
</head>

<body>
    <div class="container">
        <div class="logo">Grand All Win</div>

        <!-- 전체 동의 -->
        <div class="agreement-item">
            <div class="agreement-header">
                <label for="agree-all">
                    <input type="checkbox" id="agree-all">
                    <strong>전체 동의하기</strong>
                </label>
                <span>필수</span>
            </div>
        </div>

        <div class="agreement-item">
            <div class="agreement-header">
                <label for="agree1">
                    <input type="checkbox" id="agree1" class="agree">
                    원대한 올 승리 이용약관 동의
                </label>
                <span>필수</span>
            </div>
            <div class="agreement-content">
                <p>원대한 올 승리 서비스 이용약관에 따라, 원대한 올 승리 서비스는 다양한 디지털 콘텐츠와 관련된 서비스를 제공합니다. 본 약관은 원대한 올 승리 서비스 이용자와 원대한 올 승리 간의 권리와 의무를 명시합니다.</p>
            </div>
        </div>

        <!-- 개인정보 수집 및 이용 -->
        <div class="agreement-item">
            <div class="agreement-header">
                <label for="agree2">
                    <input type="checkbox" id="agree2" class="agree">
                    개인정보 수집 및 이용 동의
                </label>
                <span>필수</span>
            </div>
            <div class="agreement-content">
                <p>원대한 올 승리는 사용자 개인 정보를 안전하게 보호하며, 관련 법규에 따라 개인 정보를 수집하고 이용합니다. 개인정보는 서비스 제공을 위해 필요한 최소한의 정보로만 수집됩니다.</p>
            </div>
        </div>

        <!-- 위치기반서비스 이용약관 -->
        <div class="agreement-item">
            <div class="agreement-header">
                <label for="agree3">
                    <input type="checkbox" id="agree3" class="agree">
                    위치기반서비스 이용약관 동의
                </label>
                <span>선택</span>
            </div>
            <div class="agreement-content">
                <p>위치기반서비스는 사용자의 현재 위치를 기반으로 맞춤형 정보를 제공합니다. 위치 정보는 사용자의 동의 하에만 수집됩니다.</p>
            </div>
        </div>

        <button id="submit-btn" class="button">다음</button>
    </div>

    <script>
        const agreeAllCheckbox = document.getElementById('agree-all');
        const individualCheckboxes = document.querySelectorAll('.agree');
        const submitButton = document.getElementById('submit-btn');

        // 전체 동의 체크박스 선택 시, 모든 개별 동의 체크박스도 선택되도록 설정
        agreeAllCheckbox.addEventListener('change', function () {
            const isChecked = agreeAllCheckbox.checked;
            individualCheckboxes.forEach(checkbox => {
                checkbox.checked = isChecked;
            });
            toggleSubmitButton();
        });

        // 개별 동의 체크박스 선택 시, 전체 동의 체크박스 상태를 업데이트
        individualCheckboxes.forEach(checkbox => {
            checkbox.addEventListener('change', function () {
                const allChecked = Array.from(individualCheckboxes).every(cb => cb.checked);
                agreeAllCheckbox.checked = allChecked;
                toggleSubmitButton();
            });
        });

        // 모든 필수 항목이 체크되면 "다음" 버튼을 활성화
        function toggleSubmitButton() {
            const allRequiredChecked = Array.from(individualCheckboxes).filter(cb => cb.parentElement.innerText.includes('필수')).every(cb => cb.checked);
            if (allRequiredChecked) {
                submitButton.classList.add('active');
                submitButton.removeAttribute('disabled');
            } else {
                submitButton.classList.remove('active');
                submitButton.setAttribute('disabled', true);
            }
        }

        // 초기 비활성화 상태로 설정
        submitButton.setAttribute('disabled', true);
    </script>
</body>

</html>

