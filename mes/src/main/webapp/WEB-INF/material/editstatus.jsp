<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="hong.material.dto.MaterialStatusDTO" %>
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

	<% MaterialStatusDTO dto=(MaterialStatusDTO) request.getAttribute("dto"); %>

		<form method="post" id="send_form">
			<label for="column2">제품번호 : </label> <input type="text" id="productnum"
				name="prodnum" value="<%=dto.getProdnum()%>"><br>
			<br> <label for="column1">LOT 번호 : </label> <input type="text"
				id="lotnum" name="lotnum" value="<%=dto.getLotnum()%>"><br>
			<br> <label for="column2">제품명 : </label> <input type="text"
				id="prodname" name="prodname" value="<%=dto.getProdname()%>"><br>
			<br> <label for="column2">갯수 : </label> <input type="text" id="quantity"
				name="quantity" value="<%=dto.getTquantity()%>" readonly><br>
			<br> <label for="column2">규격 : </label> <input type="text" id="spec"
				name="spec" value="<%=dto.getSpec()%>"><br>
			<br> <label for="column2">위치 : </label> <input type="text" id="loc"
				name="loc" value="<%=dto.getStorage_loc()%>"><br>
			<br> <label for="date">Date:</label> <input type="date" id="editdate"
				name="editdate" value="<%=dto.getEditdate()%>"><br> <br>
			<input type="submit" value="수정" id="send"> <br>
		</form>
		<script>
			$("#quantity").attr("disabled", false);
		</script>
</body>

</html>