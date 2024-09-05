<%@page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagination Example with Combined Date and Status Filter</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        .pagination a {
            margin: 0 5px;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            color: #333;
        }

        .pagination a.active {
            background-color: #4CAF50;
            color: white;
            border: 1px solid #4CAF50;
        }
    </style>
</head>

<body>

    <h2>Data Table with Pagination, Select All, Delete, and Combined Date and Status Filter</h2>

    <label for="rowsPerPage">Rows per page:</label>
    <select id="rowsPerPage">
        <option value="5">5</option>
        <option value="10" selected>10</option>
        <option value="15">15</option>
        <option value="20">20</option>
    </select>

    <button id="deleteSelected">Delete Selected</button>


    <br><br>
    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate">
    <label for="endDate">End Date:</label>
    <input type="date" id="endDate">

    <br><br>
    <label for="statusFilter">Filter by Status:</label>
    <select id="statusFilter">
        <option value="all">All</option>
        <option value="검사 완료">검사 완료</option>
        <option value="검사 중">검사 중</option>
        <option value="검사 전">검사 전</option>
    </select>
    <button id="filterByDateAndStatus">Filter by Date and Status</button>
    <button id="resetFilters">Reset Filters</button>

    <table id="dataTable">
        <thead>
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>번호</th>
                <th>제품번호</th>
                <th>Date</th>
                <th>검사 상태</th>
                <th>수정</th>
            </tr>
        </thead>
        <tbody>
            <% // 다양한 날짜 데이터를 생성
            	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); Calendar
                calendar=Calendar.getInstance(); // 상태 리스트 생성
                List<String> statuses = Arrays.asList("검사 완료", "검사 중", "검사 전");

                // 다양한 날짜와 상태 데이터를 생성하여 테이블에 삽입
                List<String> sampleDates = Arrays.asList("2023-08-01", "2023-07-15", "2023-06-10",
                    "2023-08-10", "2023-07-22", "2023-05-30",
                    "2023-06-05", "2023-08-18", "2023-07-05",
                    "2023-06-25", "2023-05-18", "2023-05-10",
                    "2023-06-15", "2023-07-01", "2023-08-05");

                    Random random = new Random();

                    // 데이터 삽입
                    for (int j = 0; j < sampleDates.size(); j++) { String date=sampleDates.get(j); String
                        status=statuses.get(random.nextInt(statuses.size())); // 무작위 상태 할당
                        String column1="Data " + (j + 1); String column2="Info " + (j + 1); %>
                        <tr>
                            <td><input type="checkbox" class="rowCheckbox"></td>
                            <td>column1 <%= j + 1 %>
                            </td>
                            <td>column2 <%= j + 1 %>
                            </td>
                            <td>
                                <%= date %>
                            </td>
                            <td>
                                <%= status %>
                            </td>
                            <td><button onclick="editRow('<%=column1 %>','<%=column2 %>')">수정</button></td>
                        </tr>
                        <% } %>
        </tbody>
    </table>

    <div class="pagination" id="pagination">
        <!-- 페이지네이션 링크가 여기에 동적으로 추가됩니다 -->
    </div>

    <script>
        let rowsPerPage = parseInt(document.getElementById("rowsPerPage").value);
        const table = document.getElementById("dataTable").getElementsByTagName("tbody")[0];
        let rows = table.getElementsByTagName("tr");
        const pagination = document.getElementById("pagination");
        const selectAllCheckbox = document.getElementById("selectAll");
        const deleteSelectedButton = document.getElementById("deleteSelected");
        const filterByDateAndStatusButton = document.getElementById("filterByDateAndStatus");
        const resetFiltersButton = document.getElementById("resetFilters");
        const statusFilter = document.getElementById("statusFilter");
        let filteredRows = Array.from(rows);

        function displayRows(startIndex, endIndex) {
            for (let i = 0; i < filteredRows.length; i++) {
                filteredRows[i].style.display = (i >= startIndex && i < endIndex) ? '' : 'none';
            }
        }

        function setupPagination() {
            const pageCount = Math.ceil(filteredRows.length / rowsPerPage);
            pagination.innerHTML = '';

            for (let i = 1; i <= pageCount; i++) {
                const pageLink = document.createElement("a");
                pageLink.innerHTML = i;
                pageLink.href = "#";
                pageLink.onclick = (function (i) {
                    return function () {
                        const start = (i - 1) * rowsPerPage;
                        const end = start + rowsPerPage;
                        displayRows(start, end);

                        const current = document.querySelector(".pagination a.active");
                        if (current) current.classList.remove("active");
                        this.classList.add("active");
                    }
                })(i);

                pagination.appendChild(pageLink);
            }

            // 기본 첫 페이지 표시
            if (pagination.getElementsByTagName("a").length > 0) {
                pagination.getElementsByTagName("a")[0].classList.add("active");
            }
            displayRows(0, rowsPerPage);
        }

        document.getElementById("rowsPerPage").addEventListener("change", function () {
            rowsPerPage = parseInt(this.value);
            setupPagination();
        });

        selectAllCheckbox.addEventListener("change", function () {
            const rowCheckboxes = document.querySelectorAll(".rowCheckbox");
            const visibleRows = Array.from(filteredRows).filter(row => row.style.display !== 'none');
            for (let checkbox of rowCheckboxes) {
                if (visibleRows.includes(checkbox.closest('tr'))) {
                    checkbox.checked = this.checked;
                }
            }
        });

        document.addEventListener("change", function (event) {
            if (event.target.classList.contains("rowCheckbox")) {
                if (!event.target.checked) {
                    selectAllCheckbox.checked = false;
                } else {
                    const visibleCheckboxes = Array.from(filteredRows).filter(row => row.style.display !== 'none')
                        .map(row => row.querySelector('.rowCheckbox'));
                    const allChecked = visibleCheckboxes.every(checkbox => checkbox.checked);
                    selectAllCheckbox.checked = allChecked;
                }
            }
        });

        deleteSelectedButton.addEventListener("click", function () {
            const rowCheckboxes = document.querySelectorAll(".rowCheckbox:checked");
            rowCheckboxes.forEach(checkbox => {
                const row = checkbox.closest("tr");
                row.parentNode.removeChild(row);
            });
            filteredRows = Array.from(rows);
            setupPagination();
        });

        filterByDateAndStatusButton.addEventListener("click", function () {
            const startDateInput = document.getElementById("startDate").value;
            const endDateInput = document.getElementById("endDate").value;
            const selectedStatus = statusFilter.value;

            filteredRows = Array.from(rows).filter(row => {
                const dateCell = row.getElementsByTagName("td")[3].innerText;
                const statusCell = row.getElementsByTagName("td")[4].innerText;
                const rowDate = new Date(dateCell);

                // 필터링 조건: 상태 필터가 "all"이 아니고, 선택된 상태와 일치해야 함
                const statusMatches = (selectedStatus === "all") || (statusCell === selectedStatus);

                // 필터링 조건: 날짜 범위 내에 있어야 함
                const dateMatches = (!startDateInput || !endDateInput) || (rowDate >= new Date(startDateInput) && rowDate <= new Date(endDateInput));

                return statusMatches && dateMatches;
            });

            // 모든 행을 숨긴 후 필터링된 행만 보이도록 설정
            for (let i = 0; i < rows.length; i++) {
                rows[i].style.display = 'none';
            }

            setupPagination();
        });

        resetFiltersButton.addEventListener("click", function () {
            document.getElementById("startDate").value = '';
            document.getElementById("endDate").value = '';
            statusFilter.value = 'all';

            filteredRows = Array.from(rows);
            for (let i = 0; i < rows.length; i++) {
                rows[i].style.display = '';
            }

            setupPagination();
        });

        function editRow(column1, column2) {
            // URL을 생성하여 새로운 창에서 수정 페이지를 열도록 함
            console.log(column1)
            const url = `edit.jsp?column1=` + column1 + `&column2=` + column2;
            window.open(url, '_blank', 'width=600,height=400');
        }

        setupPagination();
    </script>

</body>

</html>