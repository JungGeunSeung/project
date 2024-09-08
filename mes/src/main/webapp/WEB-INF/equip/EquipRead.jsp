<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>설비 상세보기</title>
<link rel="stylesheet" href="/mes/CSS/table.css">
</head>
<body>
    <h1>설비 상세보기</h1>
    <table class="styled-table">
        <thead>
            <tr>
                <th>항목</th>
                <th>내용</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>설비명</td>
                <td>${equipment.equiname}</td>
            </tr>
            <tr>
            	<td>설비번호</td>
            	<td>${equipment.equiID}</td>
            </tr>
            <tr>
                <td>설비유형</td>
                <td>${equipment.equitype}</td>
            </tr>
            <tr>
                <td>구매일자</td>
                <td>${equipment.selldate}</td>
            </tr>
            <tr>
                <td>설비위치</td>
                <td>${equipment.equiloc}</td>
            </tr>
            <tr>
                <td>상태</td>
                <td>${equipment.status}</td>
            </tr>
            <tr>
                <td>고장/수리내용</td>
                <td>${maintenance.maincontent}</td>
            </tr>
            <tr>
                <td>관리자</td>
                <td>${maintenance.manager}</td>
            </tr>
            <tr>
                <td>고장/수리일자</td>
                <td>${maintenance.maindate}</td>
            </tr>
        </tbody>
    </table>
</body>
</html>
