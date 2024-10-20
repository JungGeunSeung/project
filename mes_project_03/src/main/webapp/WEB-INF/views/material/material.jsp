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
    <title>제품 관리</title>
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
        <h1>제품 관리</h1>
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

            <!-- 추가 버튼 -->
            <button class="btn" onclick="openInsertModal()">
                추가
            </button>
        </div>

        <!-- 재고 리스트 테이블 -->
        <table id="productTable">
            <tr>
                <th>재고 ID</th>
                <th>제품 ID</th>
                <th>제품 수량</th>
                <th>제품 위치</th>
                <th colspan="2">수정 및 삭제</th>
            </tr>
            <c:forEach var="material" items="${materialList}">
                <tr>
                    <td>${material.material_id}</td>
                    <td>${material.material_name}</td>
                    <td>${material.quantity}</td>
                    <td>${material.unit}</td>
                    <td>
                        <!-- 수정 버튼 -->
                        <button class="btn" onclick="openUpdateModal('${material.material_id}', '${material.material_name}', '${material.quantity}', '${material.unit}')">
                            수정
                        </button>
                    </td>
                    <td>
                        <form action="/gaw/inventorydelete" method="post">
                            <input type="hidden" value="${material.material_id}" name="material_id">
                            <input type="submit" value="삭제" class="btn">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <!-- 페이징 -->
        <div class="pagination">
            <!-- 페이지네이션 구현 -->
        </div>
    </article>

    <!-- 추가 모달 -->
    <div id="insertModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeInsertModal()">&times;</span>
            <h2>재고 추가</h2>
            <form action="/gaw/material/insert" method="post">
                <label for="material_name">제품 이름:</label>
                <input type="text" id="material_name" name="material_name" required><br>
                <label for="quantity">수량:</label>
                <input type="number" id="quantity" name="quantity" required><br>
                <label for="unit">단위:</label>
                <input type="text" id="unit" name="unit" required><br>
                <input type="submit" value="추가" class="btn">
            </form>
        </div>
    </div>

    <!-- 수정 모달 -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>재고 수정</h2>
            <form action="/gaw/material/update" method="post">
                <input type="hidden" id="update_material_id" name="material_id">
                <label for="update_material_name">제품 이름:</label>
                <input type="text" id="update_material_name" name="material_name" required><br>
                <label for="update_quantity">수량:</label>
                <input type="number" id="update_quantity" name="quantity" required><br>
                <label for="update_unit">단위:</label>
                <input type="text" id="update_unit" name="unit" required><br>
                <input type="submit" value="수정" class="btn">
            </form>
        </div>
    </div>

    <script>
        // 추가 모달 열기
        function openInsertModal() {
            document.getElementById('insertModal').style.display = 'block';
        }

        // 추가 모달 닫기
        function closeInsertModal() {
            document.getElementById('insertModal').style.display = 'none';
        }

        // 수정 모달 열기
        function openUpdateModal(id, name, quantity, unit) {
            document.getElementById('update_material_id').value = id;
            document.getElementById('update_material_name').value = name;
            document.getElementById('update_quantity').value = quantity;
            document.getElementById('update_unit').value = unit;
            document.getElementById('updateModal').style.display = 'block';
        }

        // 수정 모달 닫기
        function closeUpdateModal() {
            document.getElementById('updateModal').style.display = 'none';
        }

        // 모달 외부 클릭 시 모달 닫기
        window.onclick = function(event) {
            if (event.target == document.getElementById('insertModal')) {
                closeInsertModal();
            } else if (event.target == document.getElementById('updateModal')) {
                closeUpdateModal();
            }
        }
    </script>

    <style>
        /* 모달 스타일 */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgb(0, 0, 0);
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
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
</body>
</html>