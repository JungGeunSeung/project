<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
        
		<title>품질관리/불량기록> UpDate코드</title>
        <link rel="stylesheet" href="button.css">
    </head>

<body>
    <a href="list">목록으로가기</a><br>
    <a href="">삭제</a><br>
    <a href="">수정하기</a><br>
    <div>불량기록 ID : ${ dto.report_id }</div>
    <div>품질검사 ID : ${ dto.ins_id }</div>
    <div>제품 ID : ${ dto.production_id }</div>
    <div>계획 ID : ${ dto.planid }</div>
    <div>불량개수 : ${ dto.defect_count }</div>

</body>

</html>