// 버튼 클릭시 전달인자에 해당하는 열이 있는 테이블의 열만 보여주는 함수
function filter(status) {
    let tableRows = document.querySelectorAll('.tableID tbody tr');
    
    tableRows.forEach(function(row) {
        let cell = row.cells[6]; // "생산상태" 열의 위치에 따라 인덱스 조정
        if (cell.textContent.trim() === status) {
            row.style.display = ''; // 보이기
        } else {
            row.style.display = 'none'; // 숨기기
        }
    });
}

// 모든 행을 보이게 하는 함수
function all() {
let tableRows = document.querySelectorAll('.tableID tbody tr');

tableRows.forEach(function(row) {
    row.style.display = ''; // 모든 행을 보이게 설정
});
}
