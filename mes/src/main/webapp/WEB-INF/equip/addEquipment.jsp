<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/mes/CSS/button.css">
	<link rel="stylesheet" href="/mes/CSS/calender.css">
	<link rel="stylesheet" href="/mes/CSS/common.css">
	<link rel="stylesheet" href="/mes/CSS/display.css">
	<link rel="stylesheet" href="/mes/CSS/table.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<title>설비 추가</title>
</head>

<body>
	<div class="form-container">
		<form method="post" action="addEquipment">
			<label for="equiID">설비번호:</label>
			<input type="text" id="equiID" name="equiID"><br>
			<label for="equiname">설비명:</label>
			<input type="text" id="equiname" name="equiname"><br>
			<label for="equitype">설비유형:</label>
			<select name="equitype" id="equitype">
				<option selected>유형</option>
				<option value="검사">검사</option>
				<option value="포장">포장</option>
				<option value="조립">조립</option>
				<option value="제조">제조</option>
				<option value="절단">절단</option>
			</select><br>
			<label for="equiloc">설비위치:</label>
			<select name="equiloc" id="equiloc">
				<option selected>위치</option>
				<option value="공장 1">공장 1</option>
				<option value="공장 2">공장 2</option>
				<option value="공장 3">공장 3</option>
				<option value="공장 4">공장 4</option>
				<option value="공장 5">공장 5</option>
				<option value="공장 6">공장 6</option>
			</select><br>
			<label for="selldate">구매일자:</label>
			<input type="date" id="selldate" name="selldate">
			<br>
			<label for="status">상태:</label>
			<select name="status" id="status">
				<option selected>상태</option>
				<option value="운영중">운영중</option>
				<option value="점검중">점검중</option>
			</select><br>
			<label for="maincontent">고장/수리내용:</label>
			<input type="text" id="maincontent" name="maincontent">
			<br>
			<label for="manager">관리자:</label>
			<input type="text" id="manager" name="manager">
			<br>
			<label for="maindate">고장/수리일자:</label>
			<input type="date" id="maindate" name="maindate">
			<br>
			<button type="submit">추가</button>
		</form>
	</div>
</body>
<script>
	function openAddWindow() {
		window.open('WEB-INF/equip/addEquipment.jsp', 'newwindow',
			'width=600,height=400');
	}
	// 알림 메시지 처리
	<c:if test="${not empty errorMessage}">
		alert("${errorMessage}");
	</c:if>

	function validateForm() {
		var equiID = document.getElementById("equiID").value;
		var equiname = document.getElementById("equiname").value;
		var equitype = document.getElementById("equitype").value;
		var equiloc = document.getElementById("equiloc").value;
		var selldate = document.getElementById("selldate").value;
		var status = document.getElementById("status").value;
		var maincontent = document.getElementById("maincontent").value;
		var manager = document.getElementById("manager").value;
		var maindate = document.getElementById("maindate").value;

		if (!equiID || !equiname || !equitype || !equiloc || !selldate || !status || !maincontent || !manager || !maindate) {
			alert("데이터를 모두 입력해주세요.");
			return false;
		}
		return true;
	}
</script>

</html>