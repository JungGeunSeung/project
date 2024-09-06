<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품질관리/생산검사현황> SelectForm코드</title>
<link rel="stylesheet" href="/mes/CSS/button.css">
</head>
<body>
<!-- 게시물의 개수를 표시하는 if문을 만들어 JSP로 따로 빼서 jsp:include 함 -->
	<div class="cntdiv">
                <span>게시물</span>
                 <form method="get" action="" style="display: inline-block">
					<select name="countPerPage" onchange="this.form.submit()">
					
					<c:if test="${ countPerPage == null }">
						<option value="10" selected>10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
					</c:if>
					<c:if test="${ countPerPage == 10 }">
						<option value="10" selected>10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
					</c:if>
					
					<c:if test="${ countPerPage == 20 }">
						<option value="10">10개씩</option>
							<option value="20" selected>20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
					</c:if>
					
					<c:if test="${ countPerPage == 30 }">
						<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30" selected>30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
					</c:if>
					
					<c:if test="${ countPerPage == 40 }">
						<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40" selected>40개씩</option>
							<option value="50">50개씩</option>
					</c:if>
					
					<c:if test="${ countPerPage == 50 }">
						<option value="10">10개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50" selected>50개씩</option>
					</c:if>
					</select>
				</form>
            </div>
</body>
</html>