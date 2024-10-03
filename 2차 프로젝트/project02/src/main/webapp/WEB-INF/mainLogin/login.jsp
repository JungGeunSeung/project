<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/mes/CSS/button.css">
    <title>로그인페이지</title>

    <style>
        .loginbox {
            display: inline-block;
            border: 1px solid black;
            padding: 15px;
            text-align: center;
            margin-top: 50px;
            margin: 50px 20px;
            background-color: rgba(0, 208, 255, 0.1);
        }

        img {
            margin-left: 5px;
        }

        #id,
        #pw {
            width: 200px;
            height: 2em;
            font-size: 16px;
            background-color: inherit;
            border: 0px;
            border-bottom: 1px solid black;
        }

        #id {
            margin-top: 10px;
            margin-left: 9px;
            margin-bottom: 10px;
        }

        #submit {
            width: 100px;
            height: 40px;
        }

        #open_join {
            width: 100px;
            height: 40px;
        }

        #logo {
            width: 300px;
        }

        .center {
            margin: 0px auto;
            border: 1px solid black;
            display: inline-block;
            position: relative;
            left: 50%;
            translate: -50%;
            background-color: rgba(0, 208, 255, 0.1);

            /* display: flex;
justify-content: center; */
        }

        #falseID {
            font-size: 12px;
            color: red;
            display: none;
        }

        .bodylogin {
            background-color: rgba(0, 208, 255, 0.1);
        }
        
        #false {
        	color: red;
        }
    </style>
</head>

<body class="bodylogin">
    <div class="center">
        <div>
            <img id="logo" src="/mes/Image/로고.png" alt="">
        </div>
        <div class="loginbox">
            <form action="login" method="post">
                <label for="id">ID:</label>
                <input type="text" id="id" name="id" placeholder="아이디 또는 사원번호" value=""><br>
                <label for="pw">PW:</label>
                <input type="password" id="pw" name="pw" placeholder="비밀번호" value=""><br><br>
                <input type="submit" value="로그인" id="submit" class="btn">
                <input type="button" value="회원가입" id="open_join" class="btn"
                    onclick="location.href='signup'">
                <!-- <input type="submit2" value="로컬 초기화" id="submit2" class="btn"> -->
            </form>
	        <c:if test="${ error }">
	        	<span id="false">아이디 또는 비밀번호가 잘못 되었습니다.</span>
	        </c:if>
        </div>
    </div>
	${ error }
    <script>
    </script>
</body>

</html>