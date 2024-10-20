<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <title>원가 관리</title>
    <style>
        /* 전체 컨테이너 */
        article {
            width: 80%;
            margin: 0 auto;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        /* 테이블 스타일링 */
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }

        table th, table td {
            padding: 10px;
            border: 1px solid #ddd;
        }

        table th {
            background-color: #28a745;
            color: white;
        }

        table td {
            height: 40px;
        }

        /* 버튼 스타일링 */
        .btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 15px;
            cursor: pointer;
            border-radius: 5px;
        }

        .btn:hover {
            background-color: #218838;
        }

        /* 페이지당 항목 수와 추가 버튼을 동일한 라인에 배치 */
        .top-section {
            display: flex;
            flex-direction: column;
            align-items: flex-end; /* 오른쪽 정렬 */
            margin-bottom: 20px;
        }

        /* 페이지당 항목 선택 */
        .top-section form {
            margin-bottom: 10px; /* 추가 버튼과 간격을 주기 위한 마진 */
        }

        .pagination ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: center;
        }

        .pagination ul li {
            display: inline-block;
            margin: 0 5px;
        }

        .pagination ul li a {
            text-decoration: none;
            padding: 5px 10px;
            border: 1px solid #ddd;
            color: #333;
        }

        .pagination ul li.active a {
            background-color: #28a745;
            color: white;
            border: 1px solid #28a745;
        }

        .pagination ul li a:hover {
            background-color: #28a745;
            color: white;
            border: 1px solid #28a745;
        }

        /* 모달 창 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
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
    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-- 메뉴바 -->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>

    <article>
    <h1>원가 관리</h1>
    <div class="top-section">
        <form method="get" action="/gaw/material">
            <label for="countperpage">페이지당 항목 수:</label>
            <select name="countperpage" id="countperpage" onchange="this.form.submit()">
                <option value="10" ${countperpage == 10 ? 'selected' : ''}>10</option>
                <option value="20" ${countperpage == 20 ? 'selected' : ''}>20</option>
                <option value="50" ${countperpage == 50 ? 'selected' : ''}>50</option>
                <option value="100" ${countperpage == 100 ? 'selected' : ''}>100</option>
            </select>
            <input type="hidden" name="page" value="${currentPage}">
        </form>

        <!-- 추가 버튼 클릭 시 추가 모달 열기 -->
        <button class="btn" onclick="openAddModal()">추가</button>
    </div>

    <table id="productTable">
        <tr>
            <th>원가 ID</th>
            <th>제품 ID</th>
            <th>재료비</th>
            <th>인건비</th>
            <th>간접비</th>
            <th>총합 금액</th>
            <th>작성일</th>
            <th colspan="2">수정 및 완료</th>
        </tr>
        <c:forEach var="material" items="${materialList}">
            <tr>
                <td>${material.cost_id}</td>
                <td>${material.product_id}</td>
                <td>${material.material_cost}</td>
                <td>${material.labor_cost}</td>
                <td>${material.over_cost}</td>
                <td>${material.total}</td>
                <td>${material.create_at}</td>
                <td>
                    <!-- 수정 버튼 클릭 시 수정 모달 창 열기 -->
                    <button class="btn" onclick="openEditModal('${material.cost_id}', '${material.product_id}', '${material.material_cost}', '${material.labor_cost}', '${material.over_cost}', '${material.total}')">수정</button>
                </td>
                <td>
                    <form action="/gaw/costdelete" method="post">
                        <input type="hidden" value="${material.cost_id}" name="cost_id">
                        <input type="submit" value="완료" class="btn">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="pagination">
        <ul>
            <c:if test="${currentPage > 1}">
                <li><a href="?page=${currentPage - 1}&countperpage=${countperpage}">이전</a></li>
            </c:if>

            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="${i == currentPage ? 'active' : ''}"><a href="?page=${i}&countperpage=${countperpage}">${i}</a></li>
            </c:forEach>

            <c:if test="${currentPage < totalPage}">
                <li><a href="?page=${currentPage + 1}&countperpage=${countperpage}">다음</a></li>
            </c:if>
        </ul>
    </div>
    </article>

    <!-- 수정 모달 구조 -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>원가 수정</h2>
            <form id="editForm" method="post" action="/gaw/cost/update">
                <input type="hidden" id="editCostId" name="cost_id">
                <label for="product_id">제품 ID:</label>
                <input type="text" id="editProductId" name="product_id"><br>
                <label for="material_cost">재료비:</label>
                <input type="text" id="editMaterialCost" name="material_cost"><br>
                <label for="labor_cost">인건비:</label>
                <input type="text" id="editLaborCost" name="labor_cost"><br>
                <label for="over_cost">간접비:</label>
                <input type="text" id="editOverCost" name="over_cost"><br>
                <label for="total">총합 금액:</label>
                <input type="text" id="editTotal" name="total"><br>
                <button type="submit" class="btn">수정 완료</button>
            </form>
        </div>
    </div>

    <!-- 추가 모달 구조 -->
    <div id="addModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>원가 추가</h2>
            <form id="addForm" method="post" action="/gaw/cost/add">
                            <label for="product_id">원가 ID:</label>
                <input type="text" id="addProductId" name="cost_id"><br>
                <label for="product_id">제품 ID:</label>
                <input type="text" id="addProductId" name="product_id"><br>
                <label for="material_cost">재료비:</label>
                <input type="text" id="addMaterialCost" name="material_cost"><br>
                <label for="labor_cost">인건비:</label>
                <input type="text" id="addLaborCost" name="labor_cost"><br>
                <label for="over_cost">간접비:</label>
                <input type="text" id="addOverCost" name="over_cost"><br>
                <label for="total">총합 금액:</label>
                <input type="text" id="addTotal" name="total"><br>
                <button type="submit" class="btn">추가 완료</button>
            </form>
        </div>
    </div>

    <!-- 모달 제어 자바스크립트 -->
    <script>
        var editModal = document.getElementById("editModal");
        var addModal = document.getElementById("addModal");
        var span = document.getElementsByClassName("close");

        function openEditModal(costId, productId, materialCost, laborCost, overCost, total) {
            document.getElementById("editCostId").value = costId;
            document.getElementById("editProductId").value = productId;
            document.getElementById("editMaterialCost").value = materialCost;
            document.getElementById("editLaborCost").value = laborCost;
            document.getElementById("editOverCost").value = overCost;
            document.getElementById("editTotal").value = total;
            editModal.style.display = "block";
        }

        function openAddModal() {
            addModal.style.display = "block";
        }

        // Close modal when clicking on <span> (x)
        for (var i = 0; i < span.length; i++) {
            span[i].onclick = function() {
                editModal.style.display = "none";
                addModal.style.display = "none";
            }
        }

        // Close modal when clicking outside of the modal
        window.onclick = function(event) {
            if (event.target == editModal) {
                editModal.style.display = "none";
            } else if (event.target == addModal) {
                addModal.style.display = "none";
            }
        }
    </script>
</body>

</html>
