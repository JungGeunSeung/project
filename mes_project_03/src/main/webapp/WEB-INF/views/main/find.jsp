<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<link rel="stylesheet" href="resources/CSS/find.css" />
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>정보찾기</title>
	<link rel="stylesheet" href="resources/CSS/loading.css" />
	<link rel="stylesheet" href="resources/CSS/find.css" />
	<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
	<style>
	
	</style>
</head>

<body>
	<div class="container">
		<form id="signup-form" action="updatePW" method="post">
			<div class="logo">
				<img src="resources/img/팀 로고 2.png">Grand All Win
			</div>

			<!-- 아이디 입력 -->
			<div class="form-group">
				<label for="id"><img src="resources/img/사람.png" class="icon">아이디</label>
				<input type="text" id="user_id" name="user_id" placeholder="아이디 입력">
			</div>

			<!-- 이메일 입력 -->
			<div class="form-group">
				<label for="email"><img src="resources/img/편지지.png" class="icon">이메일 주소</label> <input type="email"
					id="email" name="email" placeholder="이메일 주소 (필수 인증필요)">
			</div>

			<!-- 인증 약관 -->
			<div class="agreement" id="toggle-agreement">
				<span><input type="checkbox" id="agree-all" class="chk-agree">[필수]
					인증 약관 전체동의</span> <span class="arrow">▼</span>
			</div>

			<!-- 드롭다운 약관 동의 -->
			<div class="agreement-content" id="agreement-content">
				<label><input type="checkbox" class="chk-agree" name="agree">
					[필수]개인정보 이용</label> <label><input type="checkbox" class="chk-agree" name="agree"> [필수]통신사
					이용약관</label> <label><input type="checkbox" class="chk-agree" name="agree"> [필수]개인정보 수집</label>
			</div>

			<!-- 인증번호 입력 필드 -->
			<div id="verification-code-group" class="form-group">
				<label for="verification-code"><img src="resources/img/자물쇠.png" class="icon">인증번호 입력</label> <input
					type="text" id="verification-code" placeholder="인증번호 입력">
			</div>

			<!-- 인증 요청 버튼 -->
			<button type="button" class="submit-btn" id="request-verification">인증요청</button>
			<button type="submit" class="submit-btn hidden" id="response-verification">인증하기</button>

		</form>
	</div>
	<!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

	<script>
		const agreementToggle = document.getElementById('toggle-agreement');
		const agreementContent = document.getElementById('agreement-content');
		const arrow = document.querySelector('.arrow');
		const agreeAllCheckbox = document.getElementById('agree-all');
		const agreeCheckboxes = document.querySelectorAll('input[name="agree"]');
		const loading = document.querySelector('.loading-overlay');
		let sentToken;

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

		// 인증 요청 버튼 클릭 시 이벤트 처리
		document.getElementById('request-verification').addEventListener('click', function() {
		    const email = document.getElementById('email').value;
		    const user_id = document.getElementById('user_id').value;

		    if (email === "") {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
		    if (user_id === "") {
		        alert("아이디를 입력해주세요.");
		        return;
		    }
		    
		 	// 모든 체크박스가 선택되었는지 확인하는 코드
			const checkboxes = document.querySelectorAll('input[name="agree"]');
			let allChecked = true;
			
			checkboxes.forEach(function(checkbox) {
			    if (!checkbox.checked) {
			        allChecked = false;
			    }
			});
			
			if (!allChecked) {
			    alert('모든 필수 약관에 동의해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
		    const requestData = { email: email, user_id: user_id };

		    document.querySelector('.loading-overlay').classList.remove('hidden');

		    fetch('email.find', {
		        method: 'POST',
		        headers: {
		            'Content-Type': 'application/json'
		        },
		        body: JSON.stringify(requestData)
		    })
		    .then(response => response.json())
		    .then(data => {
		        document.querySelector('.loading-overlay').classList.add('hidden');

		        if (data.success) {
		            alert("인증 코드가 전송되었습니다.");
		            document.getElementById('verification-code-group').style.display = 'block';
		            sentToken = data.token
		            console.log("인증 코드: " + data.token);
		            document.getElementById('request-verification').classList.add('hidden');
		            document.getElementById('response-verification').classList.remove('hidden');
		        } else {
		            // 서버에서 전달한 오류 메시지 표시
		            alert(data.message);
		        }
		    })
		    .catch(error => {
		        console.error("인증 요청 중 오류 발생: ", error);
		        alert("오류가 발생했습니다. 다시 시도해주세요. error");
		        document.querySelector('.loading-overlay').classList.add('hidden');
		    });
		});
		
		// 비밀번호를 변경하는 페이지 이동
		document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            const inputToken = document.getElementById('verification-code').value; // 사용자가 입력한 인증 코드
            if (inputToken != sentToken) {
                alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
                return;
            }
            alert("인증 되었습니다.");
             document.querySelector('#signup-form').submit();
        });
	</script>
</body>

</html>