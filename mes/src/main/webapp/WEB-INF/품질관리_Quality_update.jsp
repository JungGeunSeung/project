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
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
    <link rel="stylesheet" href="button.css">
</head>
<body>
<a href="list">목록으로가기</a><br>
<a href="">삭제</a><br>
<a href="">수정하기</a><br>
    <div>품질검사 ID : ${ dto.ins_id }</div>
    <div>제품 ID : ${ dto.production_id }</div>
    <div>계획 ID : ${ dto.planid }</div>
    <div>검사날짜 : ${ dto.ins_date }</div>
    <div>검사결과 : ${ dto.result }</div>
    <div>불량개수 : ${ dto.defect_count }</div>
    <div>불량유형 : ${ dto.defect_cause }</div>
    <div>결과 ID : ${ dto.resultID }</div>
    <div>실적 ID : ${ dto.taskid }</div>
		
</body>
</html>
