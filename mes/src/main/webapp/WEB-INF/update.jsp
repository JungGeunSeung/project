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
<title>Update Row</title>
<style>
body {
	text-align: center;
	background-color: skyblue;
}
</style>
</head>
<body>
	
	수정 완료 되었습니다.

	<p>수정완료</p>

	<button onclick="close1()">확인</button>
	

	<script>
		function close1() {
			opener.location.reload();

			window.close();
			
		}
	</script>
</body>
</html>
