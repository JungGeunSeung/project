document.addEventListener('DOMContentLoaded', function () {

    let all = document.querySelector('#allchk');
    // 위 체크박스 체크시 모든 체크박스가 체크되는 이벤트
    let table = document.querySelector('#tableID table');
    all.addEventListener('click', function () {
        let chk = document.querySelectorAll('.selectchk');
        chk.forEach(function (checkbox) {
            checkbox.checked = all.checked;
        });
    });
    
     let chk = document.querySelectorAll('.selectchk');
	chk.forEach(function (checkbox) {
    checkbox.addEventListener('click', function () {
        let allChecked = true;
        chk.forEach(function (item) {
            if (!item.checked) {
                allChecked = false;
            }
        });
        all.checked = allChecked;  // 하나라도 체크되지 않으면 전체 선택 체크박스 해제
    });
});
});