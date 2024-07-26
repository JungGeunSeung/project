document.addEventListener('DOMContentLoaded', () => {
    const table = document.querySelector('.tableID > table');
    const headers = table.querySelectorAll('th');
    let currentSortColumn = -1;
    let isAscending = true;

    headers.forEach((header, index) => {
        header.addEventListener('click', () => {
            sortTableByColumn(table, index);
        });
    });

    function sortTableByColumn(table, columnIndex) {
        const tbody = table.querySelector('tbody');
        const rowsArray = Array.from(tbody.querySelectorAll('tr'));
        const dataType = headers[columnIndex].dataset.type;

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