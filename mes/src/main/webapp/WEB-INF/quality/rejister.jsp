<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href = "register"> 목록으로</a>
<form method="post" action="register">
	품질검사 ID : <input type="text" name="title" value="${ dto.ins_id }"><br>
	날짜 : <input type="date" name="dueDate" value="${ dto.ins_date }"><br>
	제품 ID : <input type="text" name="title" value="${ dto.production_id }"><br>
	계획 ID : <input type="text" name="title" value="${ dto.planid }"><br>
	검사날짜 : <input type="date" name="dueDate" value="${ dto.ins_date }"><br>
	검사결과 : <input type="text" name="title" value="${ dto.result }"><br>
	불량개수 : <input type="number" name="number" value="${ dto.defect_count }"><br>
	불량유형 : <input type="text" name="title" value="${ dto.resultID }"><br>
	결과 ID : <input type="text" name="title" value="${ dto.taskid }"><br>
	완료여부 - 
	완료 : <input type="radio" name="finished" value="Y" checked="checked">
	미완료 : <input type="radio" name="finished" value="N"><br>
	 <input type="submit" value="등록">
</body>
</html>