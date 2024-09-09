<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Row</title>
<style>
body {
	text-align: center;
	background-color: skyblue;
}
</style>
</head>
<body>

	<h2>Edit Row Data</h2>

	<%
	UserDTO dto = (UserDTO) request.getAttribute("dto");
	%>

	<form method="post" id="send_form">
		<input type="text"	id="userid" name="userid" value="<%=dto.getUserid()%>" hidden><br>
		<br> <label for="column1">이름 : </label> <input type="text"
			id="name" name="name" value="<%=dto.getName()%>"><br>
		<br> <label for="column2">이메일 : </label> <input type="text"
			id="email" name="email" value="<%=dto.getEmail()%>"><br>
		<br> <label for="column2">전화번호 : </label> <input type="text"
			id="phone" name="phone" value="<%=dto.getPhone()%>"><br>
		<br> <label for="column2">생년월일 : </label> <input type="date"
			id="birth" name="birth" value="<%=dto.getBirth()%>"><br>
		<br> <label for="column2">입사일 : </label> <input type="date" 
			id="hire" name="hire" value="<%=dto.getHire()%>"><br> 
		<br> <label for="date">등급:</label> <input type="text" 
			id="grade" name="grade" value="<%=dto.getGrade()%>"><br> 
		<br> <label for="date">상태:</label> <input type="text" 
			id="status" name="status" value="<%=dto.getStatus()%>"><br>
		<br> <label for="date">사원번호:</label> <input type="text" 
			id="empno" name="empno" value="<%=dto.getEmpno()%>"><br>
		<br> <label for="date">부서번호:</label> <input type="text" 
			id="deptno" name="deptno" value="<%=dto.getDeptno()%>"><br>
		<br>
		<input type="submit" value="수정" id="send"> <br>
	</form>
</body>
</html>
