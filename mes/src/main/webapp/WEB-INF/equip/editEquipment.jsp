<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/mes/CSS/table.css">
<link rel="stylesheet" href="/mes/CSS/button.css">
<link rel="stylesheet" href="/mes/CSS/calender.css">
<link rel="stylesheet" href="/mes/CSS/common.css">
<link rel="stylesheet" href="/mes/CSS/display.css">
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<link rel="stylesheet" href="/mes/CSS/table.css">
<link rel="stylesheet" href="/mes/CSS/게시판.css">
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<link rel="stylesheet" href="/mes/CSS/equip.css"> <!-- 추가된 CSS 파일 링크 -->
<title>설비관리 > 설비고장/수리이력 >  수정</title>
</head>

<body>
	<h1>설비 수정</h1>
	<form method="post" action="Equip/update" onsubmit="return validateForm()">

		<table class="tableID">
			<thead>
				<tr>
					<th>항목</th>
					<th>내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label for="equiID" >설비번호:</label></td>
					<td><input type="text" id="equiID" name="equiID"
						value="${equipment.equiID}" readonly ></td>
				</tr>
				<tr>
					<td><label for="equiname">설비명:</label></td>
					<td><input type="text" id="equiname" name="equiname"
						value="${equipment.equiname}"></td>
				</tr>
				<tr>
					<td><label for="equitype">설비유형:</label></td>
					<td><select name="equitype" id="equitype">
							<option value="검사"
								${equipment.equitype == '검사' ? 'selected' : ''}>검사</option>
							<option value="포장"
								${equipment.equitype == '포장' ? 'selected' : ''}>포장</option>
							<option value="조립"
								${equipment.equitype == '조립' ? 'selected' : ''}>조립</option>
							<option value="제조"
								${equipment.equitype == '제조' ? 'selected' : ''}>제조</option>
							<option value="절단"
								${equipment.equitype == '절단' ? 'selected' : ''}>절단</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="selldate">구매일자:</label></td>
					<td><input type="date" id="selldate" name="selldate"
						value="${equipment.selldate}"></td>
				</tr>
				<tr>
					<td><label for="equiloc">설비위치:</label></td>
					<td><select name="equiloc" id="equiloc">
							<option value="공장 1"
								${equipment.equiloc == '공장 1' ? 'selected' : ''}>공장 1</option>
							<option value="공장 2"
								${equipment.equiloc == '공장 2' ? 'selected' : ''}>공장 2</option>
							<option value="공장 3"
								${equipment.equiloc == '공장 3' ? 'selected' : ''}>공장 3</option>
							<option value="공장 4"
								${equipment.equiloc == '공장 4' ? 'selected' : ''}>공장 4</option>
							<option value="공장 5"
								${equipment.equiloc == '공장 5' ? 'selected' : ''}>공장 5</option>
							<option value="공장 6"
								${equipment.equiloc == '공장 6' ? 'selected' : ''}>공장 6</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="status">상태:</label></td>
					<td><select name="status" id="status">
							<option value="운영중"
								${equipment.status == '운영중' ? 'selected' : ''}>운영중</option>
							<option value="점검중"
								${equipment.status == '점검중' ? 'selected' : ''}>점검중</option>
					</select></td>
				</tr>
				<tr>
					<td><label for="maincontent">고장/수리내용:</label></td>
					<td><input type="text" id="maincontent" name="maincontent"
						value="${equipment.maincontent}"></td>
				</tr>
				<tr>
					<td><label for="manager">관리자:</label></td>
					<td><input type="text" id="manager" name="manager"
						value="${equipment.manager}"></td>
				</tr>
				<tr>
					<td><label for="maindate">고장/수리일자:</label></td>
					<td><input type="date" id="maindate" name="maindate"
						value="${equipment.maindate}"></td>
				</tr>
			</tbody>
		</table>
		<button type="submit" class="btn">수정</button>
	</form>
</body>
<script>
	// 입력 데이터 검사 로직
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

		if (!equiID || !equiname || !equitype || !equiloc || !selldate
				|| !status || !maincontent || !manager || !maindate) {
			alert("데이터를 모두 입력해주세요.");
			return false;
		}
		return true;
	}
</script>
</html>
