dtocument.addEventListener('DOMContenLoaded', () => {
    let table = document.querySelector('.tableID > table');
    let th = table.querySelectorAll('th');
    let cnt = -1;
    let bool = true;

    th.forEach((header, index) => {
        header.addEventListener('click', () => {
            sortTableByColumn(table, index);
        });
    });

    function sortTableByColumn(table, idx) {
        let tbody = table.querySelector('tbody');
        let array = Array.from(tbody.querySelectorAll('tr'));
        let dataType = th[idx].dataset.type;

        // 기본 정렬 방향을 오름차순으로 설정
        if (cnt === idx) {
            bool = !bool;
        } else {
            bool = true;
        }
        cnt = idx;

        array.sort((rowA, rowB) => {
            let cellA = rowA.children[idx].innerText.trim();
            let cellB = rowB.children[idx].innerText.trim();

            if (dataType === 'number') {
                return bool ? cellA - cellB : cellB - cellA;
            } else {
                return bool ? cellA.localeCompare(cellB) : cellB.localeCompare(cellA);
            }
        });

        // 정렬된 행을 다시 테이블에 추가
        array.forEach(row => tbody.appendChild(row));
    }
});