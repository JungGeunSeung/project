window.onload = function () {

    let gsid = 20000302
    let gspw = 1234

    let submit = document.querySelector('#submit');
    if (submit) {
        submit.addEventListener('click', function (event) {
            event.preventDefault();
            let id = document.querySelector('#id');
            let pw = document.querySelector('#pw');
            if (id.value == gsid && pw.value == gspw) {
                localStorage.setItem('dataid', id.value);
                localStorage.setItem('datapw', pw.value);
                window.location.href = "Main.html";
            } else {
                document.querySelector('#falseID').setAttribute('style', 'display: block')
            }
        })
    }


}
















