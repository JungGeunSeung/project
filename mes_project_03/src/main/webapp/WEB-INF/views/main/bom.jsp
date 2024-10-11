<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bom정보</title>
</head>
<body>
<table border=1>
 <thead>
        <tr>
            <th>BOM ID</th>
            <th>Product ID</th>
            <th>Material ID</th>
            <th>Quantity</th>
            <th>Version</th>
            <th>Created At</th>
        </tr>
    </thead>

<c:forEach var="dto" items="${list }">
						<tr>
							<td>
								${dto.bom_id }
							</td>
							<td>
								${dto.product_id }
							</td>
							<td>
								${dto.material_id }
							</td>
							<td>
								${dto.quantity }
							</td>
							<td>
								${dto.version }
							</td>
							<td>
								${dto.create_at }
							</td>
					  </tr>
</c:forEach>
</table>
<!--  페이지 보여주는곳 -->
<div>
    <c:if test="${currentPage > 1}">
        <a href="bom?page=${currentPage - 1}">&laquo; Previous</a>
    </c:if>

    <c:forEach var="i" begin="1" end="${totalPages}">
        <c:choose>
            <c:when test="${i == currentPage}">
                <span>${i}</span>
            </c:when>
            <c:otherwise>
                <a href="bom?page=${i}">${i}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="bom?page=${currentPage + 1}">Next &raquo;</a>
    </c:if>
</div>
</body>
</html>