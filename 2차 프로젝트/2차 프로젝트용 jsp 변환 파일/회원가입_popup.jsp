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
    <title>회원 정보 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
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
            margin-top: 10px;
        }

        #members-table {
            width: 100%;
            border-collapse: collapse;
        }

        #members-table th, #members-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        #members-table th {
            background-color: #f4f4f4;
        }

        #members-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .delete-btn, .edit-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            margin: 0 5px;
        }

        .edit-btn {
            background-color: #4CAF50;
        }

        .delete-btn:hover, .edit-btn:hover {
            opacity: 0.8;
        }
    </style>
</head>

<body>
    <h1>회원가입</h1>

    <!-- 회원 정보 입력 폼 -->
    <div class="form-group">
        <label for="name">가입인증번호</label>
        <input type="text" id="name">
    </div>
    <div class="form-group">
        <label for="name">사번</label>
        <input type="text" id="name">
    </div>
    <div class="form-group">
        <label for="address">아이디</label>
        <input type="text" id="address">
    </div>
    <div class="form-group">
        <label for="address">비밀번호</label>
        <input type="text" id="address">
    </div>
    <div class="form-group">
        <label for="address">비밀번호 확인</label>
        <input type="text" id="address">
    </div>
    <div class="form-group">
        <label for="name">이름</label>
        <input type="text" id="name">
    </div>
    <div class="form-group">
        <label for="email">이메일</label>
        <input type="email" id="email">
    </div>
    <div class="form-group">
        <label for="phone">전화번호</label>
        <input type="tel" id="phone">
    </div>
    <div class="form-group">
        <label for="address">주소</label>
        <input type="text" id="address">
    </div>
    <div class="form-group">
        <!-- 저장/수정 버튼 -->
        <button id="save-btn">가입요청</button>
    </div>

   <script>
    document.getElementById('save-btn').addEventListener('click',function(){
        window.close();
        alert("회원가입 요청이 완료되었습니다.");
    })
   </script>

</body>

</html>
