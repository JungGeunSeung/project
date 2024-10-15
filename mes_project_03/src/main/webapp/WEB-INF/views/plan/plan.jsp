<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css"> 
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <title>생산계획</title>

    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
        }

        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>

    <button id="createBtn">생산계획 생성</button>
    <button id="deleteSelectedBtn">선택삭제</button> <!-- 선택삭제 버튼 추가 -->

    <table border="1">
        <caption>생산계획목록</caption>
        <thead>
            <tr>
                <th>선택</th>
                <th>계획 ID</th>
                <th>제품 ID</th>
                <th>생산 시작일</th>
                <th>생산 종료일</th>
                <th>수량</th>
                <th>작성자</th>
                <th>상태</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>

    <div id="pagination"></div>

    <!-- 모달 창 -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>생산계획 수정/생성</h2>
            <form id="planForm">
                <label for="plan_id">계획 ID:</label>
                <input type="text" id="plan_id" name="plan_id" readonly><br><br>
                <label for="product_id">제품 ID:</label>
                <input type="text" id="product_id" name="product_id"><br><br>
                <label for="start_date">생산 시작일:</label>
                <input type="date" id="start_date" name="start_date"><br><br>
                <label for="end_date">생산 종료일:</label>
                <input type="date" id="end_date" name="end_date"><br><br>
                <label for="quantity">수량:</label>
                <input type="number" id="quantity" name="quantity"><br><br>
                <label for="created_by">작성자:</label>
                <input type="text" id="created_by" name="created_by"><br><br>
                <label for="status">상태:</label>
                <input type="text" id="status" name="status"><br><br>
                <button type="submit">저장</button>
            </form>
        </div>
    </div>

    <script>
        let currentPage = 1;
        const itemsPerPage = 10;
        let planList = [];

        const modal = document.getElementById("myModal");
        const closeModalBtn = document.querySelector(".close");

        // 모달 창 열기
        function openModal(plan) {
            modal.style.display = "block";

            if (plan) {
                document.getElementById("plan_id").value = plan.plan_id;
                document.getElementById("product_id").value = plan.product_id;
                document.getElementById("start_date").value = plan.start_date.split('T')[0];
                document.getElementById("end_date").value = plan.end_date.split('T')[0];
                document.getElementById("quantity").value = plan.quantity;
                document.getElementById("created_by").value = plan.created_by;
                document.getElementById("status").value = plan.status;
            } else {
                document.getElementById("planForm").reset();
                document.getElementById("plan_id").removeAttribute("readonly");
            }
        }

        // 모달 창 닫기
        closeModalBtn.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // 생성 버튼 클릭 시 모달 창 열기
        document.getElementById("createBtn").addEventListener("click", function () {
            openModal(null);
        });

        // AJAX 요청 함수
        function ajax(url, cb, method) {
            const xhr = new XMLHttpRequest();
            xhr.open(method, url);
            xhr.send();

            xhr.onload = function () {
                if (typeof cb === "function") {
                    cb(xhr.responseText);
                }
            };
        }

        // 리스트 그리기
        function drawList() {
            const start = (currentPage - 1) * itemsPerPage;
            const end = start + itemsPerPage;
            const paginatedItems = planList.slice(start, end);
            let html = "";

            for (let i = 0; i < paginatedItems.length; i++) {
                const plan = paginatedItems[i];
                html += `
                    <tr>
                        <td><input type="checkbox" name="check" value="\${plan.plan_id}"></td>
                        <td>\${plan.plan_id}</td>
                        <td>\${plan.product_id}</td>
                        <td>\${new Date(plan.start_date).toISOString().split('T')[0]}</td>
                        <td>\${new Date(plan.end_date).toISOString().split('T')[0]}</td>
                        <td>\${plan.quantity}</td>
                        <td>\${plan.created_by}</td>
                        <td>\${plan.status}</td>
                        <td><button class="editBtn" data-plan='\${JSON.stringify(plan)}'>수정</button></td>
                        <td><button class="deleteBtn" data-plan_id="\${plan.plan_id}">삭제</button></td>
                    </tr>`;
            }
            document.querySelector("#list").innerHTML = html;

            // 수정 버튼 클릭 이벤트 추가
            const editButtons = document.querySelectorAll(".editBtn");
            editButtons.forEach(button => {
                button.addEventListener("click", function () {
                    const plan = JSON.parse(this.getAttribute('data-plan'));
                    openModal(plan);
                });
            });

            // 삭제 버튼 클릭 이벤트 추가
            const deleteButtons = document.querySelectorAll(".deleteBtn");
            deleteButtons.forEach(button => {
                button.addEventListener("click", function () {
                    const plan_id = this.getAttribute("data-plan_id");
                    deletePlan(plan_id);
                });
            });
        }

        // 삭제 함수
        function deletePlan(plan_id) {
            const xhr = new XMLHttpRequest();
            xhr.open("DELETE", `deletePlan/${plan_id}`);
            xhr.send();

            xhr.onload = function () {
                if (xhr.status === 200) {
                    getList();  // 리스트 다시 불러오기
                }
            };
        }

        // 선택 삭제 함수
        document.getElementById("deleteSelectedBtn").addEventListener("click", function () {
            const checkedBoxes = document.querySelectorAll("input[name='check']:checked");
            const idsToDelete = Array.from(checkedBoxes).map(cb => cb.value);

            if (idsToDelete.length > 0) {
                const xhr = new XMLHttpRequest();
                xhr.open("DELETE", `deletePlans`);
                xhr.setRequestHeader("Content-Type", "application/json");
                xhr.send(JSON.stringify({ plan_ids: idsToDelete }));

                xhr.onload = function () {
                    if (xhr.status === 200) {
                        getList();  // 리스트 다시 불러오기
                    }
                };
            } else {
                alert("삭제할 항목을 선택하세요.");
            }
        });

        // 페이지 로드 시 getList 함수 호출
        window.addEventListener("load", getList);

        // 리스트 가져오기 함수
        function getList() {
            ajax("selectPlan", function (response) {
                planList = JSON.parse(response);
                drawList();
                drawPagination();
            }, "get");
        }

        // 페이징 버튼 그리기
        function drawPagination() {
            const totalPages = Math.ceil(planList.length / itemsPerPage);
            let paginationHtml = "";

            for (let i = 1; i <= totalPages; i++) {
                paginationHtml += `<button class="page-btn" data-page="\${i}">\${i}</button>`;
            }
            document.querySelector("#pagination").innerHTML = paginationHtml;

            const pageButtons = document.querySelectorAll(".page-btn");
            pageButtons.forEach(button => {
                button.addEventListener("click", function () {
                    currentPage = parseInt(this.dataset.page);
                    drawList();
                });
            });
        }

        // 폼 제출 (수정 또는 생성)
        document.getElementById("planForm").addEventListener("submit", function (event) {
            event.preventDefault();

            const planData = {
                plan_id: document.getElementById("plan_id").value,
                product_id: document.getElementById("product_id").value,
                start_date: document.getElementById("start_date").value,
                end_date: document.getElementById("end_date").value,
                quantity: document.getElementById("quantity").value,
                created_by: document.getElementById("created_by").value,
                status: document.getElementById("status").value
            };

            const method = planData.plan_id ? "PUT" : "POST";

            const xhr = new XMLHttpRequest();
            xhr.open(method, method === "POST" ? "createPlan" : `updatePlan/${planData.plan_id}`);
            xhr.setRequestHeader("Content-Type", "application/json");
            xhr.send(JSON.stringify(planData));

            xhr.onload = function () {
                if (xhr.status === 200) {
                    modal.style.display = "none";
                    getList();
                }
            };
        });
    </script>

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>

</body>

</html>
