document.addEventListener('DOMContentLoaded', function () {

    let all = document.querySelector('#allchk');
    // 위 체크박스 체크시 모든 체크박스가 체크되는 이벤트
    all.addEventListener('click', function () {
        let chk = table.querySelectorAll('input[type="checkbox"]');
        chk.forEach(function (checkbox) {
            checkbox.checked = all.checked;
        });
    });
});