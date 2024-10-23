<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <title>마이 페이지</title>
    <style>
        article {
            width: 70%;
            margin: 0 auto;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .container {
            width: 70%;
            margin: 20px auto;
            background-color: rgb(231, 246, 229);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .btn-container {
            text-align: center;
            margin: 20px 0px;
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 80%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="checkbox"] {
            margin-right: 10px;
        }


        .note {
            font-size: 12px;
            color: #777;
        }

        .withdrawal {
            text-align: right;
            margin-top: 10px;
        }

        .withdrawal a {
            color: red;
            text-decoration: none;
        }

        .withdrawal a:hover {
            text-decoration: underline;
        }

        table .btn {
            float: right;

        }

        tr th {
            font-weight: bold;
            color: #fff;
            background: #116d21;
            width: 120px;
        }

        tr td {
            text-align: center;
            font-size: 16px;
        }

        .certi {
            margin-left: 10px;
        }

        table {
            width: 700px;
            margin: 0 auto;
        }
        
        .profileImg {
        	width: 100px;
        	height: 100px;
        	border-radius: 50%;
        	border: 1px solid black;
        }
        

        
        .profileDiv {
        	margin: 10px;
        }
        
        .profileDiv span {
        	font-size: 10px;
        }
        
        .profileBtn {
        	margin-top: 20px;
        }
    </style>

</head>

<body>
    <!------------------ 헤더 ------------------>
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!----------------- 메뉴바 ----------------->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
    <article>
        <div class="container">
            <h1>회원정보</h1>
            <table>
                <tr>
                    <th>프로필 사진</th>
                    <td id="profileRow">
                    	<div>
	                    	<div class="profileDiv">
	                    		<img class="profileImg" src="${user.profile_url}"><br>
	                    		<span>프로필 사진의 반영이 늦을수도 있습니다. 다시 로그인해주세요.</span>
	                    	</div>
	                    	<div>
		                        <form class="profileForm" method="post" action="upload.do" enctype="multipart/form-data" accept-charset="utf-8">
								    첨부파일 : <input type="file" name="file1" accept="image/*">
								    <button class="btn"><span>등록</span></button>
								</form>
							</div>
							<div class="profileBtn">
								<button id="profileDeleteBtn" class="btn"><span>삭제하기</span></button>
							</div>
						</div>
                    </td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td id="emailRow">
                        <span>${user.email }</span>
                        <button class="btn" onclick="editEmail()"><span>이메일 변경</span></button>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td id="nameRow">
                        <span>${user.name}</span>
                        <button class="btn" onclick="editName()"><span>이름변경</span></button>
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td id="phoneRow">
                        <span>${user.phone}</span>
                        <button class="btn" onclick="editPhone()"><span>번호 변경</span></button>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 변경</th>
                    <td>
                        <form id="passwordForm">
                            <input type="password" id="nowpassword" name="nowpassword"
                                placeholder="현재 비밀번호"><br>
                            <input type="password" id="changepassword" name="changepassword"
                                placeholder="새 비밀번호"><br>
                            <div id="passwordMessage"
                                style="color: red; font-size: 12px; margin-bottom: 10px;"></div>
                            <input type="password" id="retypepassword" placeholder="비밀번호 다시 입력"><br>
                            <div id="passwordMessage2"
                                style="color: red; font-size: 12px; margin-bottom: 10px;"></div>
                            <button type="submit" class="btn"><span>비밀번호 변경</span></button>
                        </form>
                    </td>
                </tr>
            </table>
            <div class="btn-container">
                <button id="outBtn" class="btn" onclick="home();"><span>나가기</span></button>
            </div>
            <div class="withdrawal">
                탈퇴를 원하시면 <a href="" onclick="window.open('deleteEmp', 'popupWindow', 'width=500,height=300,scrollbars=no,resizable=no'); return false;">회원탈퇴</a>을 눌러주세요.
            </div>
        </div>
    </article>

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    <!-- 로딩 CSS에 해당하는 HTML -->
    <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
    <script src="resources/javascript/mypage.js"></script>
</body>

</html>