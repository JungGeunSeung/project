<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <style>
        body,
        html {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: Arial, sans-serif;
        }

        .center {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: rgba(0, 208, 255, 0.1);
        }

        .signupbox {
            width: 400px;
            padding: 20px;
            border: 1px solid black;
            background-color: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
        }

        #name,
        #id,
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            height: 2.5em;
            font-size: 16px;
            background-color: inherit;
            border: 1px solid #ccc;
            margin-bottom: 15px;
            padding-left: 10px;
            border-radius: 5px;
            box-sizing: border-box;
            /* padding과 border가 포함된 전체 크기 설정 */
        }

        .phone-container {
            text-align: left;
            margin-bottom: 15px;
        }

        .phone-input {
            width: 60px;
            /* 각 입력 필드의 너비 */
            display: inline-block;
            height: 2.5em;
            font-size: 16px;
            background-color: inherit;
            border: 1px solid #ccc;
            padding-left: 5px;
            border-radius: 5px;
            margin-right: 5px;
            /* 입력 필드 사이 간격 */
            box-sizing: border-box;
            /* 필드 크기에 padding과 border 포함 */
        }

        .phone-label {
            font-size: 14px;
            color: gray;
            margin-bottom: 5px;
            display: block;
        }

        #submit {
            width: 100%;
            height: 45px;
            font-size: 18px;
            background-color: #00bfff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #pw_error,
        #pw_format_error {
            color: red;
            font-size: 12px;
            margin-bottom: 10px;
            display: none;
        }

        .date-label {
            text-align: left;
            font-size: 12px;
            margin-top: -10px;
            margin-bottom: 15px;
            color: gray;
        }
    </style>


</head>

<body>
    <div class="center">
        <div class="signupbox">
            <h2>회원가입</h2>
            <form action="signup" method="post" onsubmit="return validateForm()">
                <input type="text" id="name" name="name" placeholder="이름"><br>
                <input type="text" id="id" name="id" placeholder="아이디"><br>
                <input type="password" id="pw" name="pw" placeholder="비밀번호"><br>
                <span id="pw_format_error">비밀번호는 최소 8자 이상이며, 숫자, 문자, 특수문자를 포함해야 합니다.</span><br>
                <input type="password" id="confirm_pw" name="confirm_pw" placeholder="비밀번호 확인"><br>
                <span id="pw_error">비밀번호가 일치하지 않습니다.</span><br>
                <input type="email" id="email" name="email" placeholder="이메일"><br>
                <!-- 핸드폰 번호 입력 필드 -->
                <div class="phone-container">
                    <span class="phone-label">핸드폰 번호</span>
                    <input type="text" id="phone1" name="phone1" placeholder="010" maxlength="3" class="phone-input"
                        oninput="autoHyphen()"> -
                    <input type="text" id="phone2" name="phone2" placeholder="1234" maxlength="4"
                        class="phone-input" oninput="autoHyphen()"> -
                    <input type="text" id="phone3" name="phone3" placeholder="5678" maxlength="4"
                        class="phone-input" oninput="autoHyphen()">
                    <!-- 전체 핸드폰 번호를 저장할 히든 필드 -->
                    <input type="hidden" id="full_phone" name="full_phone">
                </div>
                <!-- 생일 입력 필드 -->
                <input type="date" id="birth" name="birth"><br>
                <div class="date-label">생일을 선택하세요 (YYYY-MM-DD 형식)</div>

                <input type="submit" value="회원가입" id="submit" class="btn">
            </form>
        </div>
    </div>
    <script>
        function validateForm() {
            var pw = document.getElementById("pw").value;
            var confirmPw = document.getElementById("confirm_pw").value;
            var errorText = document.getElementById("pw_error");
            var formatErrorText = document.getElementById("pw_format_error");

            // 비밀번호 정규식: 최소 8자, 숫자, 문자, 특수문자 포함
            var pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

            if (!pwRegex.test(pw)) {
                formatErrorText.style.display = "block";
                return false;
            } else {
                formatErrorText.style.display = "none";
            }

            if (pw !== confirmPw) {
                errorText.style.display = "block";
                return false;
            } else {
                errorText.style.display = "none";
                return true;
            }
        }
        function autoHyphen() {
            var phone1 = document.getElementById("phone1").value;
            var phone2 = document.getElementById("phone2").value;
            var phone3 = document.getElementById("phone3").value;

            // 핸드폰 번호를 합쳐서 표시
            document.getElementById("full_phone").value = phone1 + "-" + phone2 + "-" + phone3;
        }
    </script>
</body>

</html>