<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<link rel="stylesheet" href="/mes/CSS/sidebar.css">
<link rel="stylesheet" href="/mes/CSS/table.css">
<link rel="stylesheet" href="/mes/CSS/topbar.css">
<link rel="stylesheet" href="/mes/CSS/게시판.css">
<script src="/mes/JavaScript/load_info.js"></script>
<title>소원을 들어주는 MES</title>
</head>
<body>
	<!-- 사이드바 -->
	<div class="sidebar">
		<a href="main"> <img class="Logo" src="/mes/Image/로고.png" alt="로고"></a>

		<div class="profile" id="bos">
			<img src="/mes/Image/정근승.png" alt="프로필 사진">
			<h2>정근승</h2>
			<p>대표이사</p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='login'">

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="관리자페이지" class="btn"
					onclick="location.href='관리자'">
			</div>
		</div>

		<div class="profile" id="kwon">
			<img src="/mes/Image/권대호.png" alt="프로필 사진">
			<h2>권대호</h2>
			<p>상무</p>
			<input type="button" value="로그아웃" class="btn"
				onclick="location.href='login'">

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="관리자페이지" class="btn"
					onclick="location.href='관리자'">
			</div>
		</div>

		<div class="profile" id="daall">
			<img src="/mes/Image/정다올.png" alt="프로필 사진">
			<h2>정다올</h2>
			<p>생산관리팀 부장</p>

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="로그아웃" class="btn"
					onclick="location.href='login'">
			</div>
		</div>

		<div class="profile" id="sowon">
			<img src="/mes/Image/김소원.png" alt="프로필 사진">
			<h2>김소원</h2>
			<p>생산팀 부장</p>

			<div class="profile_btn">
				<input type="button" value="마이페이지" class="btn"> <input
					type="button" value="로그아웃" class="btn"
					onclick="location.href='login'">
			</div>
		</div>

		<div class="cal_kwon">
			<div id="calendar"></div>
			<script src="/mes/JavaScript/calendar_nomall.js"></script>
		</div>

		<h3>열어본 페이지 목록</h3>
		<ul>
			<li><a href="#가장최근에 열어본 페이지">재고관리</a></li>
			<li><a href="#열어본 페이지">생산관리</a></li>
		</ul>
	</div>

	<!-- 메인 영역 -->
	<div class="content">
		<!-- 메뉴바 -->
		<div class="menu">
			<ul>
				<li class="menu-item"><a href="#">정보/BOM</a>
					<div class="submenu">
						<ul>
							<li><a href="BOM">BOM</a></li>
							<li class="manager"><a href="설비코드">설비코드</a></li>
							<li><a href="조직도">조직도</a></li>
							<li><a href="문서관리">BOM문서관리(양식서)</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="#">재고관리</a>
					<div class="submenu">
						<ul>
							<li><a href="자재관리">자재입출고(자재관리)</a></li>
							<li class="manager"><a href="재고관리">재고관리</a></li>
							<li><a href="저장위치">저장위치(MAP)</a></li>
						</ul>
					</div></li>
				<li class="menu-item manager"><a href="#">품질관리</a>
					<div class="submenu">
						<ul>
							<li><a href="시험항목_품질기준">제품별 시험항목/품질기준</a></li>
							<li><a href="생산검사현황">생산검사현황</a></li>
							<li><a href="검사현황">검사현황</a></li>
						</ul>
					</div></li>
				<li class="menu-item"><a href="#">생산관리</a>
					<div class="submenu">
						<ul>
							<li><a href="생산계획목록">생산계획목록</a></li>
							<li><a href="작업지시서목록">작업지시목록</a></li>
							<li><a href="생산실적">생산실적</a></li>
							<li><a href="생산실적보고서">생산실적보고서</a></li>
						</ul>
					</div></li>
				<li class="menu-item manager"><a href="#">설비관리</a>
					<div class="submenu">
						<ul>
							<li><a href="공정별설비관리">공정별설비관리/수리보고서</a></li>
							<li><a href="설비고장_수리이력">설비고장/수리이력</a></li>
							<li><a href="비가동이력">비가동이력</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
		<hr>
		<!-- 메인 콘텐츠 -->
		<div class="searchID">
			<h1>설비고장/수리이력</h1>
			<div class="subhead">
				<span>설비고장 또는 수리의 이력을 볼 수 있는 페이지입니다.</span> <br>
			</div>
			<form method="post" action="Equip">
				<div class="cntdiv">
					<span>게시물</span> <select name="pageSize" id="cnt"
						onchange="this.form.submit()">
						<option value="10">10개씩</option>
						<option value="20">20개씩</option>
						<option value="30">30개씩</option>
						<option value="40">40개씩</option>
						<option value="50" selected>50개씩</option>
					</select> <input type="hidden" name="pageNumber" value="1"> <input
						type="hidden" name="action" value="changePageSize">
				</div>
			</form>



			<form method="post" action="Equip">
				<span>날짜별 조회</span> <input type="date" name="startDate"
					id="startdate"> ~ <input type="date" name="endDate"
					id="enddate">
				<button type="submit" class="btn">검색</button>
				<input type="hidden" name="action" value="searchByDate">
			</form>

			<form method="post" action="Equip">
				<button type="submit" class="btn Lbtn">선택된 열 삭제</button>
				<input type="hidden" name="action" value="delete">
				<button type="button" class="btn" onclick="openAddWindow()">추가</button>
			</form>
			<!-- 추가 버튼 -->
		</div>


		<!-- 해당 목록 -->
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
						<th>상태</th>
						<th>고장/수리내용</th>
						<th>관리자</th>
						<th>고장/수리일자</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="equipment" items="${equipmentList}"
						varStatus="status">
						<tr>
							<td><input type="checkbox" id="tablechk"
								value="${equipment.equiID}"></td>
							<td>${status.index + 1}</td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiID}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiname}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equitype}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.equiloc}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.status}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.maincontent}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}">${equipment.manager}</a></td>
							<td><a href="EquipRead?equiID=${equipment.equiID}"><fmt:formatDate
										value="${equipment.maindate}" pattern="yyyy-MM-dd" /></a></td>
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
	</div>

	<!-- 삭제 폼 추가 -->

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
