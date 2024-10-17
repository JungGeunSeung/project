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
<title>재고 관리</title>
</head>

<body>
 <h2>Inventory List</h2>
    <table border="1">
        <tr>
            <th>Inventory ID</th>
            <th>Product ID</th>
            <th>Quantity</th>
            <th>Location</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="inventory" items="${inventoryList}">
            <tr>
                <td>${inventory.inventory_id}</td>
                <td>${inventory.product_id}</td>
                <td>${inventory.quantity}</td>
                <td>${inventory.location}</td>
                <td>
                    <a href="/inventory/view?inventoryId=${inventory.inventory_id}">View</a> |
                    <a href="/inventory/delete?inventoryId=${inventory.inventory_id}">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    <a href="/inventory/insert">Add New Inventory</a>

</body>

</html>
