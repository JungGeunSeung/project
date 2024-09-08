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
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/table.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<link rel="stylesheet" href="/mes/CSS/게시판.css">
	<link rel="stylesheet" href="button.css">
	<link rel="stylesheet" href="/mes/CSS/topbar.css">
	<link rel="stylesheet" href="/mes/CSS/sidebar.css">
	
	<title>소원을 들어주는 MES</title>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<!-- 메인 영역 -->
	<div class="searchID">
		<!-- 메인 콘텐츠 -->
		<h1>설비고장/수리이력</h1>
		<div class="subhead">
			<span>설비고장 또는 수리의 이력을 볼 수 있는 페이지입니다.</span> <br>
		</div>
		<div class="cntdiv">
			<form method="post" action="Equip">
				<span>게시물</span> <select name="pageSize" id="cnt" onchange="this.form.submit()">
					<option value="10" selected>10개씩</option>
					<option value="20">20개씩</option>
					<option value="30">30개씩</option>
					<option value="40">40개씩</option>
					<option value="50">50개씩</option>
				</select> <input type="hidden" name="pageNumber" value="1"> <input type="hidden"
					name="action" value="changePageSize">
			</form>

			<form method="post" action="Equip">
				<span>날짜별 조회</span> <input type="date" name="startDate" id="startdate"> ~ <input
					type="date" name="endDate" id="enddate">
				<button type="submit" class="btn">검색</button>
				<input type="hidden" name="action" value="searchByDate">
			</form>

			<div class="flex-container">
				<form method="post" action="Equip">
					<button type="button" class="btn" onclick="openAddWindow()">추가</button>
					<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
				</form>
			</div>
		</div>
	</div>
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th><input type="checkbox" id="allchk"></th>
					<th>번호</th>
					<th>설비번호</th>
					<th>설비명</th>
					<th>설비유형</th>
					<th>설비위치</th>
					<th>구매일자</th>
					<th>상태</th>
					<th>고장/수리내용</th>
					<th>관리자</th>
					<th>고장/수리일자</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="equipment" items="${equipmentList}" varStatus="status">
					<tr>
						<td><input type="checkbox" id="tablechk" value="${equipment.equiID}"></td>
						<td>${status.index + 1}</td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiID}</a></td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiname}</a>
						</td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equitype}</a>
						</td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiloc}</a></td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">
								<fmt:formatDate value="${equipment.selldate}" pattern="yyyy-MM-dd" />
							</a></td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.status}</a></td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.maincontent}</a>
						</td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.manager}</a></td>
						<td><a href="EquipRead?equiID=${equipment.equiID}">
								<fmt:formatDate value="${equipment.maindate}" pattern="yyyy-MM-dd" />
							</a></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<hr>
		<div class="pagenum">
			<c:forEach var="i" begin="1" end="${totalPages}">
				<a href="Equip?pageNumber=${i}&pageSize=${param.pageSize}">${i}</a>
			</c:forEach>
		</div>
	</div>



	<script>
		function delchk() {
			var checkboxes = document
				.querySelectorAll('input[type="checkbox"]:checked');
			if (checkboxes.length > 0) {
				var equiID = checkboxes[0].value; // 첫 번째 체크된 항목의 ID를 가져옴
				document.getElementById('deleteEquiID').value = equiID;
				document.forms[0].submit();
			} else {
				alert('삭제할 항목을 선택하세요.');
			}
		}

		function openAddWindow() {
			window.open('/mes/addEquipment', 'newwindow',
				'width=600,height=400');
		}
	</script>

	<script src="/mes/JavaScript/sort.js"></script>
	<script src="/mes/JavaScript/date.js"></script>
	<script src="/mes/JavaScript/button.js"></script>
</body>

</html>