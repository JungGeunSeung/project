<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.MaterialDTO"%>
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
	MaterialDTO dto = (MaterialDTO) request.getAttribute("dto");
	%>

	<form method="post" id="send_form">
		<input type="hidden" name="inum" value="<%=dto.getnum()%>"> <br>
		<label for="column2">제품번호 : </label> <input type="text"
			id="productnum" name="productnum" value="<%=dto.getprodNum()%>"><br>
		<br> <label for="column1">LOT 번호 : </label> <input type="text"
			id="lotnum" name="lotnum" value="<%=dto.getLOTNum()%>"><br>
		<br> <label for="column2">제품명 : </label> <input type="text"
			id="productname" name="productname" value="<%=dto.getprodName()%>"><br>
		<br> <label for="status">입/출고 :</label> 
		<select id="inout" name="inout">
			<option value="IN" <%="IN".equals(dto.getInout()) ? "selected" : ""%>>
				IN
			</option>
			<option value="OUT" <%="OUT".equals(dto.getInout()) ? "selected" : ""%>>
				OUT
			</option>
		</select>
		<br> <br> 
		<label for="column2">갯수 : </label> <input
			type="text" id="count" name="count" value="<%=dto.getCnt()%>"><br>
		<br> <label for="date">Date:</label> <input type="date"
			id="inspectdate" name="inspectdate" value="<%=dto.getDate()%>"><br>
		<br> <label for="column2">검수자 : </label> <input type="text"
			id="inspector" name="inspector" value="<%=dto.getChecker()%>"><br>
		<br> <input type="submit" value="수정" id="send"> <br>
	</form>
</body>
</html>
