document.addEventListener('DOMContentLoaded', () => {
    let table = document.querySelector('.tableID > table');
    let headers = table.querySelectorAll('th');
    let currentSortColumn = -1;
    let isAscending = true;

    headers.forEach((header, index) => {
        header.addEventListener('click', () => {
            sortTableByColumn(table, index);
        });
    });

    function sortTableByColumn(table, columnIndex) {
        let tbody = table.querySelector('tbody');
        let rowsArray = Array.from(tbody.querySelectorAll('tr'));
        let dataType = headers[columnIndex].dataset.type;

        // 기본 정렬 방향을 오름차순으로 설정
        if (currentSortColumn === columnIndex) {
            isAscending = !isAscending;
        } else {
            isAscending = true;
        }
        currentSortColumn = columnIndex;

        rowsArray.sort((rowA, rowB) => {
            let cellA = rowA.children[columnIndex].innerText.trim();
            let cellB = rowB.children[columnIndex].innerText.trim();

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