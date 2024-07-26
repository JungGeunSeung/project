let table = document.querySelector('.tableID');
let tr = table.getElementsByTagName('tr');

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

all.addEventListener('click', function () {
    let chk = table.querySelectorAll('input[type="checkbox"]');
    chk.forEach(function (checkbox) {
        checkbox.checked = all.checked;
    });
});


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
function changePageSize() {
    var selectElement = document.getElementById('cnt');
    var selectedValue = selectElement.value;
    
    var tableRows = document.querySelectorAll('.tableID tbody tr');
    
    tableRows.forEach(function(row, index) {
        if (index < selectedValue) {
            row.style.display = ''; // 선택한 개수까지 보이게 설정
        } else {
            row.style.display = 'none'; // 선택한 개수 이후는 숨기기
        }
    });
}