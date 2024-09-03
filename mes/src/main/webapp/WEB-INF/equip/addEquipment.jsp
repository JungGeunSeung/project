<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/mes/CSS/button.css">
    <link rel="stylesheet" href="/mes/CSS/calender.css">
    <link rel="stylesheet" href="/mes/CSS/common.css">
    <link rel="stylesheet" href="/mes/CSS/display.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
    <title>설비 추가</title>
</head>
<body>
    <div class="form-container">
        <form action="EquipmentServlet" method="post">
            <input type="hidden" name="action" value="add">
            <label for="equiID">설비번호:</label>
            <input type="text" id="equiID" name="equiID" required>
            <label for="equiname">설비명:</label>
            <input type="text" id="equiname" name="equiname" required>
            <label for="equitype">설비코드:</label>
            <input type="text" id="equitype" name="equitype" required>
            <label for="manager">관리자:</label>
            <input type="text" id="manager" name="manager" required>
            <label for="maindate">고장/수리일자:</label>
            <input type="date" id="maindate" name="maindate" required>
            <label for="maincontent">비고:</label>
            <input type="text" id="maincontent" name="maincontent" required>
            <button type="submit" class="btn">추가</button>
        </form>
    </div>
</body>
</html>
