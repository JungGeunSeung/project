<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/CSS/category.css">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<link rel="stylesheet" href="resources/CSS/loading.css">
<link rel="stylesheet" href="resources/CSS/btn.css">
<link rel="stylesheet" href="resources/CSS/table.css">
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<title>관리자 페이지</title>

<style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5); /* 배경 흐리게 */
}

.modal-content {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    width: 60%;
    max-width: 600px;
}

/* 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}

.modal select {
	font-size: 18px;
	padding: 0px;
}

.modal .modalTd {
	padding: 0px;
}
</style>

</head>
<body>
	<!------------------ 헤더 ------------------>
	<header>
		<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
	</header>

	<!----------------- 메뉴바 ----------------->
	<nav>
		<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>
	<article>
		<div class="container">
			<div>
				<h2>관리자 페이지</h2>
				<span>회원들의 정보를 수정할수 있는 곳 입니다.</span>
				<table>
				    <thead>
				        <tr>
				            <th>생년월일</th>
				            <th>이름</th>
				            <th>이메일</th>
				            <th>핸드폰</th>
				            <th>입사일</th>
				            <th>소속 부서</th>
				            <th>직급</th>
				            <th>사수</th>
				            <th>수정</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach var="list" items="${emplist}">
				            <tr id="row-${list.user_id}">
				                <td class="birth-date">${list.birth_date}</td>
				                <td class="name">${list.user_name}</td>
				                <td class="masked-email">${list.masked_email}</td>
				                <td class="masked-phone">${list.masked_phone}</td>
				                <td class="hire-date">${list.hire_date}</td>
				                <td class="dept-name">${list.dept_name}</td>
				                <td class="position">${list.position}</td>
				                <td class="mgr">${list.mgr_name}</td>
				                <td>
				                    <button class="btn edit-btn" id="edit-${list.user_id}" data-user-id="${list.user_id}">수정</button>
				                    <input type="hidden" id="deptId" value="${list.dept_id }">
				                    <input type="hidden" id="mgrId" value="${list.mgr}">
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
			</div>
		</div>
	</article>
	<!-- 직원 목록 테이블 -->

	<!-- 모달 창 -->
	<div id="editModal" class="modal" style="display: none;">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>정보 수정</h2>
			<form id="empUpdateForm" action="empUpdate.do" method="post">
			<input id="user_id" type="hidden" name="user_id">			
	        <table id="modalTable">
	            <tr>
	                <th>생년월일</th>
	                <td id="modalBirthDate"></td>
	            </tr>
	            <tr>
	                <th>이름</th>
	                <td id="modalName"></td>
	            </tr>
	            <tr>
	                <th>이메일</th>
	                <td id="modalEmail"></td>
	            </tr>
	            <tr>
	                <th>핸드폰</th>
	                <td id="modalPhone"></td>
	            </tr>
	            <tr>
	                <th>입사일</th>
	                <td id="modalHireDate"></td>
	            </tr>
	            <tr>
	                <th>소속 부서</th>
	                <td class="modalTd">
	                    <select id="modalDeptName" name="dept_id">
	                        <c:forEach var="dept" items="${deptlist}">
	                            <option value="${dept.dept_id}">${dept.dept_name}</option>
	                        </c:forEach>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th>직급</th>
	                <td class="modalTd">
	                    <select id="modalPosition" name="position">
	                        <option value="인턴">인턴</option>
	                        <option value="사원">사원</option>
	                        <option value="주임">주임</option>
	                        <option value="대리">대리</option>
	                        <option value="과장">과장</option>
	                        <option value="팀장">팀장</option>
	                        <option value="부장">부장</option>
	                        <option value="이사">이사</option>
	                        <option value="대표이사">대표이사</option>
	                    </select>
	                </td>
	            </tr>
	            <tr>
	                <th>사수</th>
	                <td class="modalTd">
	                    <select id="modalMgr" name="mgr">
	                        <c:forEach var="emp" items="${emplist}">
	                            <option value="${emp.user_id}">${emp.user_name} ${emp.position}님</option>
	                        </c:forEach>
	                    </select>
	                </td>
	            </tr>
	        </table>
	
	        <input type="submit" class="btn" id="saveChanges" value="저장">
	        </form>
	    </div>
	</div>

	<!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
	
	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>
	<script>
	// 모달 열기와 닫기 기능
	const modal = document.getElementById('editModal');
	const closeBtn = document.querySelector('.close');

	// 모든 수정 버튼에 클릭 이벤트 등록
	const editButtons = document.querySelectorAll('.edit-btn');
	editButtons.forEach(button => {
	    button.addEventListener('click', function () {
	        const userId = this.getAttribute('data-user-id');
	
	        const row = document.getElementById(`row-\${userId}`);

	        // 행의 데이터를 모달에 정확히 채우기
	        const birthDate = row.querySelector('.birth-date').textContent.trim();
	        const name = row.querySelector('.name').textContent.trim();
	        const email = row.querySelector('.masked-email').textContent.trim();
	        const phone = row.querySelector('.masked-phone').textContent.trim();
	        const hireDate = row.querySelector('.hire-date').textContent.trim();
	        const position = row.querySelector('.position').textContent.trim();
	        const deptId = row.querySelector('#deptId').value;
	        const mgrId = row.querySelector('#mgrId').value;

	        // 모달의 테이블에 데이터 채우기
	        document.getElementById('modalBirthDate').textContent = birthDate;
	        document.getElementById('modalName').textContent = name;
	        document.getElementById('modalEmail').textContent = email;
	        document.getElementById('modalPhone').textContent = phone;
	        document.getElementById('modalHireDate').textContent = hireDate;
	        document.getElementById('user_id').value = userId;

	        // select 요소에 값 설정
	        document.getElementById('modalDeptName').value = deptId;
	        document.getElementById('modalPosition').value = position;
	        document.getElementById('modalMgr').value = mgrId;

	        // 모달 열기
	        modal.style.display = 'block';
	    });
	});

	// 모달 닫기 이벤트
	closeBtn.onclick = function () {
	    modal.style.display = 'none';
	};

	window.onclick = function (event) {
	    if (event.target == modal) {
	        modal.style.display = 'none';
	    }
	};

	// 폼 제출시 이벤트
	document.getElementById('empUpdateForm').addEventListener('submit', function () {
		event.preventDefault();
		if(confirm("해당 회원의 정보를 저장하시겠습니까?")) {
			document.getElementById('empUpdateForm').submit();
		} else {
			alert('변경이 취소 되었습니다.');
			return;
		}
	});
	</script>
</body>
</html>