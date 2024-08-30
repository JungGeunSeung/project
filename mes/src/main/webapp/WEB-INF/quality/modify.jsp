<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="modify">
	품질검사 ID : <input type="hidden" name="ins_id" value="${dto.ins_id}">${dto.ins_id}<br>
	제품 ID : <input type="text" name="production_id" value="${ dto.production_id }"><br>
	계획 ID : <input type="text" name="planid" value="${ dto.planid }"><br>
	검사날짜 : <input type="date" name="ins_date" value="${ dto.ins_date }"><br>
	검사결과 : <input type="text" name="result" value="${ dto.result }"><br>
	불량개수 : <input type="number" name="defect_count" value="${ dto.defect_count }"><br>
	불량유형 : <input type="text" name="defect_causet" value="${ dto.defect_cause }"><br>
	결과 ID : <input type="text" name="resultID" value="${ dto.resultID }"><br>
	실적 ID : <input type="text" name="taskid" value="${ dto.taskid }"><br>
	<input type="submit" value="수정하기"> 

</body>
</html>