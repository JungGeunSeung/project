<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="EquipRead">
		<input type="hidden" name="equiID" value="${equipment.equiID}">
		<input type="hidden" name="action" value="update"> <label
			for="equiname">설비명:</label> <input type="text" id="equiname"
			name="equiname" value="${equipment.equiname}"> <label
			for="equitype">설비유형:</label> <input type="text" id="equitype"
			name="equitype" value="${equipment.equitype}"> <label
			for="equiloc">설비위치:</label> <input type="text" id="equiloc"
			name="equiloc" value="${equipment.equiloc}"> <label
			for="status">상태:</label> <input type="text" id="status" name="status"
			value="${equipment.status}"> <label for="maincontent">고장/수리내용:</label>
		<textarea id="maincontent" name="maincontent">${equipment.maincontent}</textarea>
		<label for="manager">관리자:</label> <input type="text" id="manager"
			name="manager" value="${equipment.manager}"> <label
			for="maindate">고장/수리일자:</label> <input type="date" id="maindate"
			name="maindate" value="${equipment.maindate}">
		<button type="submit" class="btn">수정</button>
	</form>

	<form method="post" action="EquipRead">
		<input type="hidden" name="action" value="add"> <label
			for="equiname">설비명:</label> <input type="text" id="equiname"
			name="equiname"> <label for="equitype">설비유형:</label> <input
			type="text" id="equitype" name="equitype"> <label
			for="equiloc">설비위치:</label> <input type="text" id="equiloc"
			name="equiloc"> <label for="status">상태:</label> <input
			type="text" id="status" name="status"> <label
			for="maincontent">고장/수리내용:</label>
		<textarea id="maincontent" name="maincontent"></textarea>
		<label for="manager">관리자:</label> <input type="text" id="manager"
			name="manager"> <label for="maindate">고장/수리일자:</label> <input
			type="date" id="maindate" name="maindate">
		<button type="submit" class="btn">추가</button>
	</form>

</body>
</html>