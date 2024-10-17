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
        const loading = document.querySelector('.loading-overlay');
        let sentToken; // 이메일로 전송된 인증 코드를 저장할 변수
        // 정규식: 숫자, 문자, 특수문자 포함 여부 및 길이 확인
    	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 전체 동의 클릭 시, 드롭다운 토글
        agreementToggle.addEventListener('click', function () {
            const isExpanded = agreementContent.style.display === 'block';
            agreementContent.style.display = isExpanded ? 'none' : 'block';
            arrow.classList.toggle('active');
        });
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 전체 동의 클릭 시, 하위 체크박스들도 모두 선택/해제
        agreeAllCheckbox.addEventListener('change', function () {
            agreeCheckboxes.forEach(checkbox => {
                checkbox.checked = agreeAllCheckbox.checked;
            });
        });
////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // 인증 요청 버튼 클릭 시 이메일 전송
        requestVerificationButton.addEventListener('click', function(event) {
           	loading.classList.remove('hidden'); // 로딩 css 보이기
            event.preventDefault(); // 기본 폼 제출 방지

            let user_id = document.getElementById('user_id').value;
			let password = document.getElementById('password').value;
			let email = document.getElementById('email').value;
			let name = document.getElementById('name').value;
			let birthdate = document.getElementById('birthdate').value;
			let gender = document.getElementById('gender').value;
			let nationality = document.getElementById('nationality').value;
			let phone = document.getElementById('phone').value;
			
			if (!user_id) {
			    alert('아이디를 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!password) {
			    alert('비밀번호를 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!email) {
			    alert('이메일을 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!name) {
			    alert('이름을 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!birthdate) {
			    alert('생년월일을 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!gender) {
			    alert('성별을 선택해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!nationality) {
			    alert('국적을 선택해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
			    return;
			}
			
			if (!phone) {
			    alert('휴대전화번호를 입력해주세요.');
			    loading.classList.add('hidden'); // 로딩을 숨김
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

            // Ajax로 서버에 이메일 인증 요청
            const xhr = new XMLHttpRequest();
            xhr.open('POST', 'email.sign', true); // 서버에서 이메일 전송을 처리하는 API
            xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const response = JSON.parse(xhr.responseText);
                    if (response.success) {
                        alert('이메일로 인증번호가 전송되었습니다.');
                        loading.classList.add('hidden'); // 로딩 css 숨기기
                        verificationCodeGroup.style.display = 'block'; // 인증번호 입력 필드를 보이게 함
                        requestVerificationButton.classList.add('hidden'); // 인증요청 버튼 숨기기
                        signupButton.classList.remove('hidden'); // 가입하기 버튼 보이기
                        sentToken = response.token; // 전송된 인증 코드를 저장 (서버에서 반환받은 경우)
                        console.log(sentToken);
                    } else {
                        alert('인증 요청에 실패했습니다. 다시 시도해주세요.');
                        loading.classList.add('hidden'); // 로딩 css 숨기기
                    }
                }
            };

            const data = JSON.stringify({ email: email });
            xhr.send(data);
        });
////////////////////////////////////////////////////////////////////////////////////////////////////////////
     	// 가입하기 버튼 클릭 시 인증 코드 확인
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 폼 제출 방지

            // 콘솔 로그로 값 확인
		
            const password = document.getElementById('password').value;
		    if (!password) {
		        alert('비밀번호가 입력되지 않았습니다.');
		        return;
		    }
		
            const inputToken = document.getElementById('verification-code').value; // 사용자가 입력한 인증 코드
            console.log('사용자가 입력한 인증코드 : ' + inputToken)
		    if (inputToken.toString() !== sentToken.toString()) {
		        alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
		        return;
		    }
		
		    // 비밀번호 정규식 검증
		    const passwordRegex1 = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
		    if (passwordRegex1.test(password)) {
		        alert('가입이 완료되었습니다!'); // 가입 완료 메시지
		        document.querySelector('#signup-form').submit();
		    } else {
		        console.log('비밀번호가 유효하지 않습니다:', password);
		        alert('비밀번호 생성 규칙을 다시한번 확인해주세요!');
		        return;
		    }
            
        });
////////////////////////////////////////////////////////////////////////////////////////////////////////////
     	// 중복확인 버튼
        document.getElementById('check-duplicate-btn').addEventListener('click', function() {
        	loading.classList.remove('hidden'); // 로딩 css 보이기
        	event.preventDefault();
	    var user_id = document.getElementById('user_id').value;
	    if (user_id == "" || user_id == null) {
	    	alert("아이디를 입력해주세요");
	    	loading.classList.add('hidden'); // 로딩 css 숨기기
	    	return;
	    } 
	    
	    // XMLHTTPRequest 객체 생성
	    var xhr = new XMLHttpRequest();
	    
	    // POST 방식으로 '/check-duplicate' 엔드포인트에 비동기 요청
	    xhr.open('POST', 'check-duplicate.ajax', true);
	    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	    
	    // 서버 응답 처리
	    xhr.onreadystatechange = function () {
	        if (xhr.readyState === 4 && xhr.status === 200) {
	            var response = JSON.parse(xhr.responseText); // 서버 응답을 JSON으로 파싱
	            loading.classList.add('hidden'); // 로딩 css 숨기기
	            if (response.success && response.status === 'duplicate') {
	                alert("이미 사용 중인 아이디입니다.");
	            } else if (response.success && response.status === 'available') {
	                alert("사용 가능한 아이디입니다.");
	            } else {
	                alert("오류가 발생했습니다. 다시 시도해주세요.");
	            }
	        }
	    };
	    
	    // 요청 데이터 준비
	    var data = JSON.stringify({ user_id: user_id });
	    
	    // 서버로 요청 전송
	    xhr.send(data);
		});
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// 비밀번호 유효성 검사
	document.getElementById('password').addEventListener('input', function() {
    const password = document.getElementById('password').value;
    const errorMessage = document.getElementById('password-condition');
    

    if (passwordRegex.test(password)) {
        // 비밀번호가 유효할 때
        errorMessage.style.display = 'none';
    } else {
        // 비밀번호가 유효하지 않을 때
        errorMessage.style.display = 'block';
    }
	});