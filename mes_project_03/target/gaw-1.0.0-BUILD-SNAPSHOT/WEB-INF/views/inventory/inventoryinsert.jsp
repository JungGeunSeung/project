<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리</title>
</head>
<body>
	<h1>제품 관리</h1>
    <table border="1">
        <tr>
            <th>재고 ID</th>
            <th>제품 ID</th>
            <th>제품 수량</th>
            <th>제품 위치</th>
            <
        </tr>
        <c:forEach var="item" items="${inventoryList}">
            <tr>
                <td>${item.inventoryId}</td>
                <td>${item.productId}</td>
                <td>${item.quantity}</td>
                <td>${item.location}</td>
                <td>
                    <a href="/inventory/${item.inventoryId}">View</a>
                    <a href="/inventory/edit/${item.inventoryId}">Edit</a>
                    <form action="/inventory/delete/${item.inventoryId}" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
   
</body>
</html>
