<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.sql.Date" %>
<%@ page import="hong.material.dto.MaterialDTO" %>
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
	<link rel="stylesheet" href="/mes/CSS/mobile.css">
	<style>
		table {
			width: 100%;
			border-collapse: collapse;
		}

		th,
		td {
			border: 1px solid #ddd;
			padding: 8px;
			text-align: left;
		}

		th {
			background-color: #f2f2f2;
		}

		.pagination {
			display: flex;
			justify-content: center;
			margin: 20px 0;
		}

		.pagination a {
			margin: 0 5px;
			padding: 8px 16px;
			text-decoration: none;
			border: 1px solid #ddd;
			color: #333;
		}

		.pagination a.active {
			background-color: #4CAF50;
			color: white;
			border: 1px solid #4CAF50;
		}

		.modal {
			display: none;
			position: fixed;
			z-index: 1;
			left: 0;
			top: 0;
			width: 100%;
			height: 100%;
			overflow: auto;
			background-color: rgb(0, 0, 0);
			background-color: rgba(0, 0, 0, 0.4);
			padding-top: 60px;
		}

		.modal-content {
			background-color: #fefefe;
			margin: 5% auto;
			padding: 20px;
			border: 1px solid #888;
			width: 80%;
		}

		.close {
			color: #aaa;
			float: right;
			font-size: 28px;
			font-weight: bold;
		}

		.close:hover,
		.close:focus {
			color: black;
			text-decoration: none;
			cursor: pointer;
		}
	</style>
	<script src="/mes/JavaScript/load_info.js"></script>
	<title>소원을 들어주는 MES</title>
</head>

<body>
	<!-- 104번부터 127번줄 까지는 추가 버튼 눌렀을 때 나오는 모달 창 -->
	<div id="addRowModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<h2>추가할 자재 정보 입력</h2>
			<form id="addRowForm">
				<label for="prodNum">제품번호:</label> <input type="text" id="prodNum"
					name="prodNum" required><br> <label for="LOTNum">LOT
					번호:</label> <input type="text" id="LOTNum" name="LOTNum"
					required><br>

				<label for="prodName">제품명:</label> <input type="text" id="prodName"
					name="prodName" required><br> <label for="inout">입/출고:</label>
				<select id="inout" name="inout" required>
					<option value="IN">IN</option>
					<option value="OUT">OUT</option>
				</select><br> <label for="count">갯수:</label> <input type="number"
					id="count" name="count" required><br> <label
					for="date">날짜:</label> <input type="date" id="date" name="date"
					required><br> <label for="checker">검수자:</label> <input
					type="text" id="checker" name="checker" required><br>

				<button type="button" onclick="submitAddRowForm()">추가</button>
			</form>
		</div>
	</div>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">
		<!-- 해당 페이지의 제목 -->
		<h1>입출고관리</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>자재와 재고를 입/출고 날짜 별로 조회하여 관리하는 페이지입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<label for="rowsPerPage">정렬 갯수 : </label> <select
			id="rowsPerPage"><!-- 테이블에 표시될 행의 갯수 기본값은 10개 -->
			<option value="5">5</option>
			<option value="10" selected>10</option>
			<option value="15">15</option>
			<option value="20">20</option>
		</select>

		<button onclick="addRow()">추가</button>
		<button id="deleteSelected">체크 된 줄 삭제</button>

		<br> <br> <label for="startDate">Start Date:</label> <input type="date"
			id="startDate"> <label for="endDate">End
			Date:</label> <input type="date" id="endDate"> <br>
		<button id="filterByDateAndStatus">검색</button>
		<button id="resetFilters">필터 해제</button>

		<table id="dataTable">
			<thead>
				<tr>
					<th><input type="checkbox" id="selectAll"></th>
					<th>번호</th>
					<th>자재번호</th>
					<th>LOT 번호</th>
					<th>제품명</th>
					<th>입/출고</th>
					<th>갯수</th>
					<th>날짜</th>
					<th>검수자</th>
					<th>수정</th>
				</tr>
			</thead>
			<tbody>
				<% //자재관리.java 컨트롤러에서 보내준 리스트를 getattribute로 받아서 저장
					List<MaterialDTO> list = (List<MaterialDTO>)
						request.getAttribute("list");


						// 테이블에 넣어줄 데이터 삽입
						for (int j = 0; j < list.size(); j++) {//DB에 있는 행의 갯수만큼 반복문
							int num=list.get(j).getnum(); String
							MID=list.get(j).getprodNum(); String
							MLOT=list.get(j).getLOTNum(); String
							pname=list.get(j).getprodName(); String
							inout=list.get(j).getInout(); int
							count=list.get(j).getCnt(); Date
							date=list.get(j).getDate(); String
							inspector=list.get(j).getChecker(); %>
							<tr>
								<td><input type="checkbox" class="rowCheckbox"></td>
								<td>
									<%=num%>
								</td>
								<td>
									<%=MID%>
								</td>
								<td>
									<%=MLOT%>
								</td>
								<td>
									<%=pname%>
								</td>
								<td>
									<%=inout%>
								</td>
								<td>
									<%=count%>
								</td>
								<td>
									<%=date%>
								</td>
								<td>
									<%=inspector%>
								</td>
								<td><button onclick='editRow(<%=num%>)'>수정</button>
								</td>
							</tr>
							<% } %>
			</tbody>
		</table>
		<div class="pagination" id="pagination">
			<!-- 페이지네이션 링크가 여기에 동적으로 추가됩니다 -->
		</div>
	</div>
</body>
<script src="/mes/JavaScript/자재입출고관리(자재괸리).js"></script>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/button.js"></script>

</html>