<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Input Form</title>
    <style>
        /* 기본 스타일 설정 */
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        .form-group button {
            padding: 10px 20px;
        }
    </style>
</head>

<body>
    <h1>회원정보 수정</h1>
    <!-- 각 입력 필드와 레이블을 포함하는 form-group -->
    <div class="form-group">
        <input type="text" id="management_name" placeholder="이름">
    </div>
    <div class="form-group">
        <input type="text" id="management_id" placeholder="아이디">
    </div>
    <div class="form-group">
        <input type="text" id="management_pw" placeholder="패스워드">
    </div>
    <div class="form-group">
        <input type="text" id="management_age" placeholder="나이">
    </div>
    <div class="form-group">
        <input type="text" id="management_address" placeholder="주소">
    </div>
    <div class="form-group">
        <input type="text" id="management_tel" placeholder="전화번호">
    </div>
    <div class="form-group">
        <input type="text" id="management_email" placeholder="이메일">
    </div>
    <div class="form-group">
        <!-- 저장 버튼 -->
        <button id="save-btn">저장</button>
    </div>


</body>

</html>
