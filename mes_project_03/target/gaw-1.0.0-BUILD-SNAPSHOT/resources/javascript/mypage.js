	const loading = document.querySelector('.loading-overlay');
	let sentToken; // 이메일로 전송된 인증 코드를 저장할 변수
	const passwordRegex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
	const nowPasswordInput = document.getElementById('nowpassword'); // 현재 비밀번호 입력 필드
	const changePasswordInput = document.getElementById('changepassword'); // 변경할 비밀번호 선택
	const retypePasswordInput = document.getElementById('retypepassword'); // 변경할 비밀번호 확인 필드
	const passwordMessage = document.getElementById('passwordMessage'); // 정규식 비밀번호 불일치 메시지
	const passwordMessage2 = document.getElementById('passwordMessage2'); // 비밀번호 일치 여부 메시지
	const submitButton = document.querySelector('button[type="submit"]'); // 서밋 버튼
	const form = document.getElementById('passwordForm'); // 비밀번호 변경 폼
	let email = document.querySelector('#emailRow span').textContent;
	let name = document.querySelector('#nameRow span').textContent;
	let phone = document.querySelector('#phoneRow span').textContent;
	
	function editEmail() {
	    const emailRow = document.getElementById('emailRow');
	    emailRow.innerHTML = `
	    <form action="emailUpdate" method="post">
	        <input type="email" name="email" id="newEmail" placeholder="새 이메일 입력" value="${email}"><br>
	        <input type="text" id="verification-code" placeholder="이메일 인증 코드 입력"><br>
	        <button class="btn certi" type="button" onclick="verifyEmail(event)"><span>코드 발송</span></button>
	        <button class="btn" type="button" onclick="saveEmail()"><span>저장</span></button>
	    </form>
	    `;
	}
	
	function editName() {
	    const nameRow = document.getElementById('nameRow');
	    nameRow.innerHTML = `
	    <form action="nameUpdate" method="post">
	        <input type="text" name="name" id="newName" placeholder="새 이름 입력" value="${name}"><br>
	        <button class="btn" type="button" onclick="saveName()"><span>저장</span></button>
	    </form>
	    `;
	}
	
	function editPhone() {
	    const phoneRow = document.getElementById('phoneRow');
	    phoneRow.innerHTML = `
	    <form action="phoneUpdate" method="post">
	        <input type="text" name="phone" id="newPhone" placeholder="새 휴대폰 번호 입력" value="${phone}"><br>
	        <button class="btn" type="button" onclick="savePhone()"><span>저장</span></button>
	    </form>
	    `;
	}
	
	function verifyEmail(event) {
	    event.preventDefault();
	    loading.classList.remove('hidden'); // 로딩 CSS 보이기
	
	    const xhr = new XMLHttpRequest();
	    xhr.open('POST', 'email.sign', true);
	    xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
	
	    xhr.onreadystatechange = function () {
	        console.log("AJAX 응답 상태: ", xhr.readyState, xhr.status);
	        if (xhr.readyState === 4) {
	            loading.classList.add('hidden'); // 로딩 CSS 숨기기
	            if (xhr.status === 200) {
	                const response = JSON.parse(xhr.responseText);
	                if (response.success) {
	                    alert('이메일로 인증번호가 전송되었습니다.');
	                    sentToken = response.token; // 전송된 인증 코드 저장
	                    console.log("전송된 토큰:", sentToken);
	                } else {
	                    alert('인증 요청에 실패했습니다. 다시 시도해주세요.');
	                }
	            } else {
	                alert('서버와의 통신 중 오류가 발생했습니다.');
	            }
	        }
	    };
	
	    const payload = JSON.stringify({
	        email: document.getElementById('newEmail').value
	    });
	
	    xhr.send(payload);
	}
	
	function saveEmail() {
	    const inputToken = document.getElementById('verification-code').value;
	
	    if (inputToken.toString() !== sentToken.toString()) {
	        alert('인증 코드가 일치하지 않습니다. 다시 확인해주세요.');
	        return;
	    }
	
	    const newEmail = document.getElementById('newEmail').value;
	    alert(`이메일이 ${newEmail}(으)로 변경되었습니다.`);
	}
	
	function saveName() {
	    const newName = document.getElementById('newName').value;
	    alert(`이름이 ${newName}(으)로 변경되었습니다.`);
	}
	
	function savePhone() {
	    const newPhone = document.getElementById('newPhone').value;
	    alert(`휴대폰 번호가 ${newPhone}(으)로 변경되었습니다.`);
	}
	
	function validatePassword() {
	    const changePassword = changePasswordInput.value;
	
	    if (!passwordRegex.test(changePassword)) {
	        passwordMessage.textContent = "비밀번호는 8~20자, 영문자, 숫자, 특수문자(!@#$%^&*)를 모두 포함해야 합니다.";
	        passwordMessage.style.color = "red";
	        return false;
	    }
	
	    passwordMessage.textContent = "";
	    return true;
	}
	
	function checkPasswordMatch() {
	    if (changePasswordInput.value !== retypePasswordInput.value) {
	        passwordMessage2.textContent = "비밀번호가 일치하지 않습니다.";
	        passwordMessage2.style.color = "red";
	        return false;
	    }
	    passwordMessage2.textContent = "";
	    return true;
	}
	
	form.addEventListener('submit', function (e) {
	    e.preventDefault();
	
	    if (!validatePassword() || !checkPasswordMatch()) {
	        alert('유효하지 않은 비밀번호입니다. 다시 확인해주세요.');
	        return;
	    }
	
	    const data = {
	        nowpassword: nowPasswordInput.value,
	        changepassword: changePasswordInput.value,
	    };
	
	    fetch('passwordUpdate', {
	        method: 'POST',
	        headers: {
	            'Content-Type': 'application/json',
	        },
	        body: JSON.stringify(data),
	    })
	        .then(response => {
	            if (!response.ok) throw new Error('서버 응답 오류');
	            return response.json();
	        })
	        .then(result => {
	            if (result.success) {
	                alert('비밀번호가 성공적으로 변경되었습니다.');
	                window.location.href = "mypage";
	            } else {
	                alert('현재 비밀번호가 일치하지 않습니다. 다시 시도해주세요.');
	            }
	        })
	        .catch(error => {
	            console.error('비밀번호 변경 중 오류 발생:', error);
	            alert('서버와의 통신 중 오류가 발생했습니다. 다시 시도해주세요.');
	        });
	});
	
	changePasswordInput.addEventListener('keyup', validatePassword);
	retypePasswordInput.addEventListener('keyup', checkPasswordMatch);
	
	window.addEventListener('load', function(){
		document.querySelector('#profileDeleteBtn').addEventListener('click', function(){
			if(confirm("현재 프로필 사진을 삭제하시겠습니까?")){
				window.location.href="deleteProfile.do";
			} else {
				return;
			}
			
		});
	});
	
	function home () {
		window.location.href = "/gaw/mainpage";
	}
