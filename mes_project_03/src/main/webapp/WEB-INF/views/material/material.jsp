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
    <span></span>
     <div class="top-section">
    		<form  method="get" action="/gaw/material">
			<label for="countperpage">페이지당 항목 수:</label> <select
				name="countperpage" id="countperpage" onchange="this.form.submit()">
				<option value="10" ${countperpage==10 ? 'selected' : '' }>10</option>
				<option value="20" ${countperpage==20 ? 'selected' : '' }>20</option>
				<option value="50" ${countperpage==50 ? 'selected' : '' }>50</option>
				<option value="100" ${countperpage==100 ? 'selected' : '' }>100</option>
			</select> <input type="hidden" name="page" value="${currentPage}">
		</form>
    
      <a href="/gaw/material">
            <button class="btn">
                <span>추가</span>
            </button>
        </a>
    </div>
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
                        <form action="/gaw/inventoryupdate" method="post">
                            <input type="hidden" value="${inventory.inventory_id}" name="inventory_id">
                            <input type="submit" value="수정" class="btn">
                        </form>
                    </td>
                    <td>
                        <form action="/gaw/inventorydelete" method="post">
                            <input type="hidden" value="${inventory.inventory_id}" name="inventory_id">
                            <input type="submit" value="삭제" class="btn">
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>

        	<div  class="pagination">
			<ul>
				<!-- 이전 페이지로 이동 -->
				<c:if test="${currentPage > 1}">
					<li><a 
						href="?page=${currentPage - 1}&countperpage=${countperpage}">이전</a></li>
				</c:if>

				<!-- 페이지 번호 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<li class="${i == currentPage ? 'active' : ''}"><a 
						href="?page=${i}&countperpage=${countperpage}">${i}</a></li>
				</c:forEach>

				<!-- 다음 페이지로 이동 -->
				<c:if test="${currentPage < totalPage}">
					<li><a
						href="?page=${currentPage + 1}&countperpage=${countperpage}">다음</a></li>
				</c:if>
			</ul>
		</div>
    </article>
</body>

</html>
