<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <title>BOM 정보</title>

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
    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-- 메뉴바 -->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>

    <!-- 테이블 섹션 -->
    <section>
        <table border="1">
            <caption>BOM 정보</caption>
            <thead>
                <tr>
                    <th>제품 이름</th>
                    <th>제품 규격</th>
                    <th>제품 색상</th>
                    <th>제품의 BOM개수</th>
                    <th>자재 총 사용 개수</th>
                    <th>수정</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody id="list">
                <!-- 리스트에 BOM 데이터가 출력됩니다 -->
                <c:forEach var="bom" items="${bomList}">
                    <tr>
                        <td>${bom.productName}</td>
                        <td>${bom.standard}</td>
                        <td>${bom.color}</td>
                        <td>${bom.bomCount}</td>
                        <td>${bom.totalQuantity}</td>
                        <td>
                            <button class="edit-btn" data-id="${bom.bomId}">수정</button>
                        </td>
                        <td>
                            <button class="delete-btn" data-id="${bom.bomId}">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>

    <!-- 첫 번째 모달창 (BOM 정보) -->
    <button id="openModalBomBtn">BOM 수정하기</button>
    <button id="createBtn">BOM 생성</button>
    <button id="deleteSelectedBtn">선택삭제</button>

    <!-- 모달창 -->
    <div id="bomModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>BOM 수정</h2>

            <!-- BOM 수정 폼 -->
            <form id="bomForm">
                <label for="bom_id">제품명:</label> 
                <input type="hidden" id="bom_id" name="bom_id"><br><br>
                <label for="product_name">제품명:</label> 
                <input type="text" id="product_name" name="product_name"><br><br>
                
                <label for="standard">규격:</label> 
                <input type="text" id="standard" name="standard"><br><br>

                <label for="color">색상:</label> 
                <input type="text" id="color" name="color"><br><br>

                <label for="bom_count">BOM 수량:</label> 
                <input type="number" id="bom_count" name="bom_count"><br><br>

                <label for="total_quantity">총 수량:</label> 
                <input type="number" id="total_quantity" name="total_quantity"><br><br>

                <button type="submit">저장</button>
            </form>
        </div>
    </div>

    <!-- 스크립트 섹션 -->
    <script>
        // BOM 모달 창 열기/닫기 처리
        var bomModal = document.getElementById("bomModal");
        var openBomBtn = document.getElementById("openModalBomBtn");
        var bomCloseBtn = bomModal.getElementsByClassName("close")[0];

        openBomBtn.onclick = function() {
            bomModal.style.display = "block";
        }

        bomCloseBtn.onclick = function() {
            bomModal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == bomModal) {
                bomModal.style.display = "none";
            }
        }

        // 수정 버튼 클릭 시 모달 열기
        document.querySelectorAll('.edit-btn').forEach(button => {
            button.addEventListener('click', function() {
                const bomId = this.getAttribute('data-id');
                // 여기에 BOM ID를 이용하여 데이터를 가져와 폼에 채우는 로직을 추가
                // 예: AJAX로 데이터를 가져와 폼 필드를 채움
                bomModal.style.display = 'block';
            });
        });

        // 삭제 버튼 클릭 시 동작 처리
        document.querySelectorAll('.delete-btn').forEach(button => {
            button.addEventListener('click', function() {
                const bomId = this.getAttribute('data-id');
                // 여기에 삭제 로직을 추가
                if (confirm("이 BOM 항목을 삭제하시겠습니까?")) {
                    // AJAX 요청 또는 폼 전송으로 삭제 처리
                }
            });
        });
    </script>
</body>

</html>
