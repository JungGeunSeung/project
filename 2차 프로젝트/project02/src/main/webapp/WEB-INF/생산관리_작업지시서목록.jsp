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
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"> 
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>생산관리 > 작업지시서목록</title>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">
		<!-- 해당 페이지의 제목 -->
		<h1>생산계획 목록</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>작업지시서 목록</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<div class="cntdiv">
			

		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<!-- New Task 버튼 -->
		<button type="button" class="newbtn" onclick="openModal()">작업지시서
			작성</button>
		<!--             <h1>Task List</h1> -->
		<table border="1" class="table">
			<tr>
				<th>Task ID</th>
				<th>Plan ID</th>
				<th>Production ID</th>
				<th>Required</th>
				<th>Used</th>
				<th>Status</th>
				<th>Content</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="task" items="${tasks}">
				<tr>
					<td>${task.taskID}</td>
					<td>${task.planID}</td>
					<td>${task.productionID}</td>
					<td>${task.required}</td>
					<td>${task.used}</td>
					<td>${task.taskStatus}</td>
					<td>${task.taskContent}</td>
					<td>
						<!-- Edit 버튼을 클릭하면 모달 창을 엽니다 -->
						<button type="button" class="inbtn" onclick="editTask('${task.taskID}')">수정</button> | 
<%-- 						<button type="button" class="inbtn" onclick="location.href=''task?action=delete&taskID=${task.taskID}'" >삭제</button>  --%>
						<a href="task?action=delete&taskID=${task.taskID}" class="inbtn">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>



		<!-- 모달 창 -->
		<div class="modal" id="taskModal">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- 모달 헤더 -->
					<div class="modal-header">
						<h4 class="modal-title">정보입력</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- 모달 본문 -->
					<div class="modal-body">
						<form id="taskForm">
							<input type="hidden" name="taskID" id="taskID"> <input
								type="hidden" name="action" id="action" value="create">
							Plan ID: <input type="text" name="planID" id="planID"
								class="form-control"><br> Production ID: <input
								type="text" name="productionID" id="productionID"
								class="form-control"><br> Required: <input
								type="number" name="required" id="required" class="form-control"><br>
							Used: <input type="number" name="used" id="used"
								class="form-control"><br> Status: <input
								type="text" name="taskStatus" id="taskStatus"
								class="form-control"><br> Content: <input
								type="text" name="taskContent" id="taskContent"
								class="form-control"><br>
						</form>
					</div>

					<!-- 모달 푸터 -->
					<div class="modal-footer">
						<button type="button" class="inbtn" onclick="saveTask()">저장</button>
						<button type="button" class="inbtn" data-dismiss="modal">닫기</button>
					</div>

				</div>
			</div>
		</div>

		<!-- 스크립트 -->
		<script>
			// Task 정보를 서버에서 가져와서 모달 창에 표시
			function editTask(taskID) {
				$.ajax({
					url : "task?action=getTask",
					type : "GET",
					data : {
						taskID : taskID
					},
					success : function(data) {
						// 서버로부터 데이터를 받아서 모달에 채워 넣음
						$('#taskID').val(data.taskID);
						$('#planID').val(data.planID);
						$('#productionID').val(data.productionID);
						$('#required').val(data.required);
						$('#used').val(data.used);
						$('#taskStatus').val(data.taskStatus);
						$('#taskContent').val(data.taskContent);
						$('#action').val('update');

						// 모달을 염
						$('#taskModal').modal('show');
					}
				});
			}

			// Create New Task 모달 열기
			function openModal() {
				// 모달 폼을 초기화
				$('#taskForm')[0].reset();
				$('#action').val('create');
				$('#taskModal').modal('show');
			}

			// Task 저장 (Create/Update)
			function saveTask() {
				$.ajax({
					url : "task",
					type : "POST",
					data : $('#taskForm').serialize(),
					success : function(response) {
						// 저장 후 페이지 새로고침
						window.location.reload();
					}
				});
			}
		</script>
</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/table.js"></script>

</html>