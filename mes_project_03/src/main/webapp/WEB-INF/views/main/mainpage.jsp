<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="resources/CSS/category.css">
<link rel="stylesheet" href="resources/CSS/header.css">
<link rel="stylesheet" href="resources/CSS/footer.css">
<title>Grand All Win</title>
<style>

/*------------------------------ 메인 영역 ----------------------------------*/
.main-content {
	display: grid;
	grid-template-columns: 1fr 1fr;
	/* 2열로 나눔 */
	gap: 20px;
	/* 각 div 사이의 간격 */
	justify-content: center;
	/* 가운데 정렬 */
	padding: 20px;
}

.main-content div {
	border: 1px solid #ddd;
	/* 구분선을 추가 */
	padding: 20px;
	background-color: #f4f4f4;
	/* 배경색 */
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	/* 약간의 그림자 추가 */
	max-width: 500px;
	/* 각 div의 최대 너비를 제한 */
	min-height: 500px;
}

/* 브라우저 너비에 따라 article 너비를 조정 */
.main-content {
	max-width: 1100px;
	/* 전체 article의 최대 너비 제한 */
	margin: 0 auto;
	/* 브라우저 가운데 정렬 */
}
</style>
</head>

<body>
	<header>
		<!----------------- 헤더 ----------------->
		<jsp:include page="/WEB-INF/views/main/header.jsp" />
	</header>

	<!----------------- 메뉴바 ----------------->
	<nav>
		<jsp:include page="/WEB-INF/views/main/category.jsp" />
	</nav>

	<article>
		<div class="main-content">
			<div>
				<h2>실시간 생산현황</h2>
				<span>현재 가동중인 라인</span><br> <span>작업지시 현황</span><br> <span>생산량
					데이터</span><br>
			</div>
			<div>
				<h2>공정 모니터링</h2>
				<span>품질 관리 데이터</span><br> <span>설비 상태</span><br> <span>설비
					성능 지표(OEE)</span><br>
			</div>
			<div>
				<h2>생산계획 및 일정</h2>
				<span>생산 일정</span><br> <span>작업지시관리</span><br>
			</div>
			<div>
				<h2>공지사항</h2>
				<table border="1">
					<tr>
						<th>empno</th>
						<th>ename</th>
						<th>job</th>
						<th>mgr</th>
						<th>hiredate</th>
						<th>sal</th>
						<th>comm</th>
						<th>deptno</th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${ list }">
						<tr>
							<td>${ list.empno }</td>
							<c:url var="name" value="/member/write/update">
								<c:param name="empno" value="${ list.empno }" />
								<c:param name="ename" value="${ list.ename }" />
								<c:param name="job" value="${ list.job }" />
								<c:param name="hireDate" value="${ list.hireDate }" />
							</c:url>
							<td><a href="${name}">${ list.ename }</a></td>
							<td>${ list.job }</td>
							<td>${ list.mgr }</td>
							<td>${ list.hireDate }</td>
							<td>${ list.sal }</td>
							<td>${ list.comm }</td>
							<td>${ list.deptno }</td>
							<td>
								<form method="get" action="/proj8/member/delete">
									<input type="hidden" name="empno" value="${ list.empno }">
									<input type="submit" value="삭제하기">
								</form>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</article>

	<footer>
		<jsp:include page="/WEB-INF/views/main/footer.jsp" />

	</footer>
</body>

</html>