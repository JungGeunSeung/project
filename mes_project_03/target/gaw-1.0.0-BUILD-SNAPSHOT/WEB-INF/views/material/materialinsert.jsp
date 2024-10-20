<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>자재관리</title>
</head>
<body>
    <h1>자재 관리</h1>
    <table border="1">
        <tr>
            <th>자재 ID</th>
            <th>자재명</th>
            <th>자재 규격</th>
            <th>자재 수량</th>
            <th>자재 단위</th>
            
        </tr>
        <c:forEach var="item" items="${materialList}">
            <tr>
                <td>${item.material_id}</td>
                <td>${item.material_name}</td>
                <td>${item.standard}</td>
                <td>${item.quantity}</td>
                <td>${item.unit}</td>
                <td>
                    <a href="/material/${item.material_id}">View</a>
                    <a href="/material/edit/${item.material_id}">Edit</a>
                    <form action="/material/delete/${item.material_id}" method="post" style="display:inline;">
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
  
</body>
</html>
