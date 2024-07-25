document.addEventListener('DOMContentLoaded', () => {
    const table = document.querySelector('.tableID > table');
    const headers = table.querySelectorAll('th');
    let currentSortColumn = -1; //현재정렬중인 열의 인덱스를 저장
    let isAscending = true; // 변수 방향 저장 초기값은 true이기때문에 오름차순

    headers.forEach((header, index) => { //th에 이벤트 적용
        header.addEventListener('click', () => {
            if (index === 0) return; // 첫 번째 열(선택 열)은 정렬하지 않음
            sortTableByColumn(table, index); //함수실행
        });
    });

    // 테이블을 정렬하는 함수
    function sortTableByColumn(table, columnIndex) {
        const tbody = table.querySelector('tbody');
        const rowsArray = Array.from(tbody.querySelectorAll('tr')); //tr요소를 배열로 변환하여 저장
        const dataType = headers[columnIndex].dataset.type; //th의 data-type 속성을 저장

        // 기본 정렬 방향을 오름차순으로 설정
        if (currentSortColumn === columnIndex) {
            isAscending = !isAscending;
        } else {
            isAscending = true;
        }
        currentSortColumn = columnIndex;

        rowsArray.sort((rowA, rowB) => {
            const cellA = rowA.children[columnIndex].innerText.trim();
            const cellB = rowB.children[columnIndex].innerText.trim();

            if (dataType === 'number') {
                return isAscending ? cellA - cellB : cellB - cellA;
            } else {
                return isAscending ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
            }
        });

        // 정렬된 행을 다시 테이블에 추가
        rowsArray.forEach(row => tbody.appendChild(row));
    }
});
