<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bom정보</title>
<style>
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
        background-color: #007bff;
        color: white;
        border: 1px solid #007bff;
    }
</style>
</head>
<body>
<form method="get" action="/gaw/bom">
    <label for="countperpage">페이지당 항목 수:</label>
    <select name="countperpage" id="countperpage" onchange="this.form.submit()">
        <option value="10" ${countperpage == 10 ? 'selected' : ''}>10</option>
        <option value="20" ${countperpage == 20 ? 'selected' : ''}>20</option>
        <option value="50" ${countperpage == 50 ? 'selected' : ''}>50</option>
        <option value="100" ${countperpage == 100 ? 'selected' : ''}>100</option>
    </select>

    <input type="hidden" name="page" value="${currentPage}">
</form>


	<a href="/gaw/bominsert"><button>추가</button></a>
<table border=1>
    <thead>
        <tr>
            <th>BOM ID</th>
            <th>Product ID</th>
            <th>Material ID</th>
            <th>Quantity</th>
            <th>Version</th>
            <th>Created At</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="bom" items="${bom}">
        <tr>
            <td>${bom.bom_id}</td>
            <td>${bom.product_id}</td>
            <td>${bom.material_id}</td>
            <td>${bom.quantity}</td>
            <td>${bom.version}</td>
            <td>${bom.create_at}</td>
            <td>
            <form action = "/gaw/bomupdate" method = "post">
            <input type ="hidden" value="${bom.bom_id}" name="bom_id">
            <input type="submit" value="수정" >
            </form>
            </td>
			<td>
            <form action = "bomdelete" method = "post">
            <input type ="hidden" value="${bom.bom_id}" name="bom_id">
            <input type="submit" value="삭제" >
            </form>
            </td>
        </tr>
    </c:forEach>
    <c:if test="${empty bom}">
        <tr>
            <td colspan="6">자료가 없습니다</td>
        </tr>
    </c:if>

    </tbody>
</table>
<!-- 페이지 네비게이션 -->
<div class="pagination">
    <ul>
        <!-- 이전 페이지로 이동 -->
        <c:if test="${currentPage > 1}">
            <li><a href="?page=${currentPage - 1}&countperpage=${countperpage}">이전</a></li>
        </c:if>

        <!-- 페이지 번호 표시 -->
        <c:forEach var="i" begin="${startPage}" end="${endPage}">
            <li class="${i == currentPage ? 'active' : ''}">
                <a href="?page=${i}&countperpage=${countperpage}">${i}</a>
            </li>
        </c:forEach>

        <!-- 다음 페이지로 이동 -->
        <c:if test="${currentPage < totalPage}">
            <li><a href="?page=${currentPage + 1}&countperpage=${countperpage}">다음</a></li>
        </c:if>
    </ul>
</div>


</body>
</html>
