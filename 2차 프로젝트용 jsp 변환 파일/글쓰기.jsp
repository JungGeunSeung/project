<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <style>
        table {
            margin: auto;
            border-bottom: 1px solid gray;
        }

        input[type="text"] {
            border: 1.5px rgb(68, 136, 244) solid;
            width: 400px;
            height: 30px;
            border-radius: 5px;
            padding-left: 10px;
        }

        textarea {
            border: 1.5px rgb(68, 136, 244) solid;
            width: 400px;
            height: 200px;
            border-radius: 5px;
            padding-left: 10px;
            padding-top: 10px;
            resize: none;
        }

        .header {
            height: 30px;
        }

        input[type="submit"] {
            width: 70px;
            height: 40px;
            font-size: 15px;
            border: 0;
            outline: 1.5px rgb(68, 136, 244) solid;
            border-radius: 5px;
            padding-left: 10px;
            background-color: rgb(164, 199, 255);
        }

        input[type="submit"]:active {
            width: 70px;
            height: 40px;
            font-size: 15px;
            border: 0;
            border-radius: 5px;
            outline: 1.5px rgb(27, 76, 155) solid;
            padding-left: 10px;
            background-color: rgb(68, 136, 244);
        }
    </style>
</head>

<body>
    <form id="post-form">
        <table>
            <tr>
                <td>
                    <h2>글쓰기</h2>
                </td>
            </tr>
            <tr>
                <td class="header">제목</td>
            </tr>
            <tr>
                <td><input type="text" id="ptitle" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
                <td class="header">작성자</td>
            </tr>
            <tr>
                <td><input type="text" id="paut" placeholder="작성자를 입력하세요"></td>
            </tr>
            <tr>
                <td class="header">내용</td>
            </tr>
            <tr>
                <td><textarea id="pcontent" placeholder="내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
                <td><input type="submit" id="save-btn1" value="등록"></td>
            </tr>
        </table>
    </form>

    <script>
        // 새 게시글을 로컬스토리지에 추가하는 함수
        function addPost(event) {
            event.preventDefault();

            let title = document.getElementById('ptitle').value;
            let author = document.getElementById('paut').value;
            let content = document.getElementById('pcontent').value;

            if (!title || !author || !content) {
                alert('모든 필드를 입력해주세요.');
                return;
            }

            let posts = JSON.parse(localStorage.getItem('posts')) || [];
            let newPost = {
                title: title,
                author: author,
                content: content,
                date: new Date().toLocaleDateString()
            };

            posts.unshift(newPost); // 가장 최근 게시글을 상단에 추가
            localStorage.setItem('posts', JSON.stringify(posts));

            alert('게시글이 작성되었습니다.');
            window.location.href = 'main.html';
        }

        // 폼 제출 시 addPost 함수 호출
        document.getElementById('post-form').addEventListener('submit', addPost);


        document.getElementById('save-btn1').addEventListener('click', function () {
            opener.parent.location.reload();
            window.close();
            // alert("등록이 완료되었습니다.");
        })
    </script>
</body>

</html>