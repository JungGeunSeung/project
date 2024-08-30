<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="list">목록으로가기</a><br>
<a href="">삭제</a><br>
<a href="">수정하기</a><br>
	<div>${ dto.ins_id }</div>
    <div>${ dto.production_id }</div>
    <div>${ dto.planid }</div>
    <div>${ dto.ins_date }</div>
    <div>${ dto.result }</div>
    <div>${ dto.defect_count }</div>
    <div>${ dto.defect_cause }</div>
    <div>${ dto.resultID }</div>
    <div>${ dto.taskid }</div>
</body>
</html>