window.onload = function () {
    // 로그인 하는 아이디와 비밀번호를 저장한 변수
    let gsid = 20000302
    let gspw = 1234

    // 로그인버튼을 선택해 저장한 변수
    let submit = document.querySelector('#submit');

    // submit이라는 변수가 있을때 if문 실행
    if (submit) {
        submit.addEventListener('click', function (event) {
            // 기존 이벤트를 지우는함수
            event.preventDefault();
            // 아이디와 비번의 input를 가져와 저장한 변수
            let id = document.querySelector('#id');
            let pw = document.querySelector('#pw');
            // 입력한 id와pw가 위에 저장한 변수와 맞는지 비교
            if (id.value == gsid && pw.value == gspw) {
                // id와pw를 로컬스토리지에 저장하는 함수
                localStorage.setItem('dataid', id.value);
                localStorage.setItem('datapw', pw.value);
                // 하이퍼링크로 해당 html로 이동
                window.location.href = "Main.html";
            } else {
                // 틀렸을때, 로그인 버튼위에 글씨를 출력
                document.querySelector('#falseID').setAttribute('style', 'display: block')
            }
        })
    }


}
















