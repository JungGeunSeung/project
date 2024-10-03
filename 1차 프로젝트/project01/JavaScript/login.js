window.onload = function () {
    // 로그인 하는 아이디와 비밀번호를 저장한 배열
    let users = [
        { id: 'geun', pw: '1234', profileId: 'bos', range_grant: 'manager'},
        { id: 'kwon', pw: '1234', profileId: 'kwon', range_grant: 'manager'},
        { id: 'jdo513', pw: 'a1234', profileId: 'daall', range_grant: 'producer' },
        { id: 'sowon0226', pw: 'a6473', profileId: 'sowon', range_grant: 'producer' }
    ];

    // 로그인버튼을 선택해 저장한 변수
    let submit = document.querySelector('#submit');

    // submit이라는 변수가 있을때 if문 실행
    if (submit) {
        submit.addEventListener('click', function (event) {
            // 기존 이벤트를 지우는 함수
            event.preventDefault();
            // 아이디와 비번의 input를 가져와 저장한 변수
            let id = document.querySelector('#id');
            let pw = document.querySelector('#pw');
            // 아이디와 비밀번호가 배열에 있는지 확인
            let user = users.find(user => user.id == id.value && user.pw == pw.value);

            if (user) {
                // id와pw를 로컬스토리지에 저장하는 함수
                localStorage.setItem('dataid', user.id);
                localStorage.setItem('datapw', user.pw);
                localStorage.setItem('profileId', user.profileId);
                localStorage.setItem('range_grant', user.range_grant);
                // 하이퍼링크로 해당 html로 이동
                window.location.href = "main.html";
            } else {
                // 틀렸을 때, 로그인 버튼 위에 글씨를 출력
                document.querySelector('#falseID').setAttribute('style', 'display: block');
            }
        });
    }

}