<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/mes/CSS/button.css">
    <link rel="stylesheet" href="/mes/CSS/calender.css">
    <link rel="stylesheet" href="/mes/CSS/common.css">
    <link rel="stylesheet" href="/mes/CSS/display.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <link rel="stylesheet" href="/mes/CSS/sidebar.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/topbar.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
<!--     <link rel="stylesheet" href="/mes/CSS/mobile.css"> -->
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
    <link rel="stylesheet" href="button.css">
</head>
<body>
<a href="list">목록으로가기</a><br>
<a href="">삭제</a><br>
<a href="">수정하기</a><br>
    <div>시험기준 ID :${ dto.quality_id }</div>
    <div>품질기준 : ${ dto.title }</div>
    <div>관리자 : ${ dto.mgr }</div>
    <div>인증기관 : ${ dto.insti }</div>
    <div>인증날짜 : ${ dto.revision }</div>

		
</body>
</html>
