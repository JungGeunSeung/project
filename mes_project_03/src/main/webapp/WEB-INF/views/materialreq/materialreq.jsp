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
    <title>구매/발주 관리</title>
<body>
    <h2>요청 리스트</h2>
    <table border="1">
        <thead>
            <tr>
                <th>요청 ID</th>
                <th>자재 ID</th>
                <th>요청자</th>
                <th>요청 날짜</th>
                <th>수량</th>
                <th>상태</th>
                <th>수정</th>
                <th>종료</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="request" items="${requests}">
                <tr>
                    <td>${request.request_id}</td>
                    <td>${request.material_id}</td>
                    <td>${request.request_by}</td>
                    <td>${request.req_date}</td>
                    <td>${request.quantity}</td>
                    <td>${request.status}</td>
                    <td>
                        <a href="/materialReq/update/${request.request_id}">수정</a>
                    </td>
                    <td>
                        <a href="/materialReq/end/${request.request_id}">종료</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <div class="pagination">
        <ul>
            <c:if test="${currentPage > 1}">
                <li><a href="?page=${currentPage - 1}&countPerPage=${countPerPage}">이전</a></li>
            </c:if>

            <c:forEach var="i" begin="${startPage}" end="${endPage}">
                <li class="${i == currentPage ? 'active' : ''}">
                    <a href="?page=${i}&countPerPage=${countPerPage}">${i}</a>
                </li>
            </c:forEach>

            <c:if test="${currentPage < totalPage}">
                <li><a href="?page=${currentPage + 1}&countPerPage=${countPerPage}">다음</a></li>
            </c:if>
        </ul>
    </div>

    <a href="/materialReq">요청 리스트 보기</a>
</body>

</html>
