
let table = document.querySelector('.tableID');
let tr = table.getElementsByTagName('tr');


// for문으로 input에다가 이벤트 걸기
// 
for (let i = 1; i < tr.length; i++) {
    tr[i].addEventListener('click', function () {
        let chk = this.getElementsByTagName('input')[0];
        if (chk) {
            chk.checked = !chk.checked;
        };

    })
    let chk = tr[i].getElementsByTagName('input')[0];
    if (chk) {
        chk.addEventListener('click', function (event) {
            event.stopPropagation();
        });
    };
};

let all = document.querySelector('#allchk');
// 위 체크박스 체크시 모든 체크박스가 체크되는 이벤트
all.addEventListener('click', function () {
    let chk = table.querySelectorAll('input[type="checkbox"]');
    chk.forEach(function (checkbox) {
        checkbox.checked = all.checked;
    });
});


// 테이블에 있는 체크박스가 하나라도 풀릴 시 전체 체크박스가 풀리는 이벤트
document.addEventListener('click', function() {
    let chk = table.querySelectorAll('input[type="checkbox"]');
    let allChecked = true;
    for (let i = 0; i < chk.length; i++) {
        if (!chk[i].checked) {
            allChecked = false;
            break;
        }
    }
    all.checked = allChecked;
});


// 게시물의 개수를 조정하여 표시하는 이벤트
function changePageSize() {
    let selectElement = document.getElementById('cnt');
    let selectedValue = selectElement.value;
    
    let tableRows = document.querySelectorAll('.tableID tbody tr');
    
    tableRows.forEach(function(row, index) {
        if (index < selectedValue) {
            row.style.display = ''; // 선택한 개수까지 보이게 설정
        } else {
            row.style.display = 'none'; // 선택한 개수 이후는 숨기기
        }
    });
}

function delchk() {
    // 체크된 체크박스를 찾고, 해당 행을 삭제
    let checkboxes = document.querySelectorAll('.tableID tbody input[type="checkbox"]:checked');

    checkboxes.forEach(checkbox => {
        // 체크박스의 부모의 부모 요소를 삭제 (tr 요소)
        checkbox.closest('tr').remove();
    });
}