<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
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
	<link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
	<link rel="stylesheet" href="/mes/CSS/topbar.css">
	<link rel="stylesheet" href="/mes/CSS/sidebar.css">
	<title>정보/BOM > 문서관리</title>
	<script>
		function delchk() {
			if (!confirm("정말로 삭제하시겠습니까?")) {
				event.preventDefault();
			} else {
				
				let selectchk = document.querySelectorAll('.selectchk');
				let docIDs = [];
	
				// 체크된 체크박스에 대한 docID 수집
				for (let checkbox of selectchk) {
					if (checkbox.checked) {
						let row = checkbox.closest('tr');  // 체크박스가 포함된 <tr> 찾기
						let docID = row.querySelector('#docID');  // 해당 <tr> 내의 #docID 요소 찾기
						if (docID) {
							docIDs.push(docID.textContent);  // docID 값을 배열에 추가
						}
					}
				}
	
				// docID 값들을 쉼표로 구분된 문자열로 서블릿에 전송
				if (docIDs.length > 0) {
					let xhr = new XMLHttpRequest();
					xhr.open("POST", "delete/select", true);  // 서블릿 URL로 POST 요청
					xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	
					// 데이터를 쉼표로 구분된 문자열 형식으로 전송
					xhr.send("docIDs=" + encodeURIComponent(docIDs.join(',')));
	
					xhr.onreadystatechange = function () {
						if (xhr.readyState === 4 && xhr.status === 200) {
							// 서버 응답을 처리하는 부분 (성공시)
							console.log("서버로부터 응답:", xhr.responseText);
						}
					};
				} else {
					alert("선택된 항목이 없습니다.");
				}
	
				window.location.href = "/mes/doc/list";
			alert("삭제 되었습니다.");
			}
		}
					
	

	</script>
</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->
	<div class="searchID">

		<!-- 해당 페이지의 제목 -->
		<h1>문서관리</h1>
		<!-- 해당 페이지의 설명 -->
		<div class="subhead">
			<span>회사에서 사용하는 문서들을 관리하는 페이지입니다.</span> <br>
		</div>
		<!-- 게시물의 개수를 표시할 select -->
		<div class="cntdiv">
			<jsp:include page="/WEB-INF/information/BOM/정보_BOM_SelectForm.jsp">
				<jsp:param name="select" value="select" />
			</jsp:include>
			<!-- 검색조건을 바꿀 select -->
			<div>
				<span>날짜별 조회</span>
				<input type="date" id="startdate"> ~ <input type="date" id="enddate">
				<button class="btn">검색</button>

			</div>

		</div>
		<div>
			<form method="get" action="list/search">
				<span>문서명으로 검색</span>
				<input type="text" name="title" placeholder="문서명을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
		</div>
		<div class="flex-container">
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
			<span><button class="newbtn createBtn">새로 작성</button></span>
		</div>
	</div>

	<!-- 해당 목록 -->
	<div class="tableID">
		<table>
			<thead>
				<tr>
					<th>
						<input type="checkbox" id="allchk">
					</th>
					<th>NO</th>
					<th>작성자</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성일</th>
					<th>수정일</th>
					<th>Ver</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="doc" items="${map.list}">
					<tr>
						<td><input type="checkbox" class="selectchk"></td>

						<c:url var="read" value="read">
							<c:param name="document_id" value="${doc.document_id}" />
						</c:url>

						<td id="docID">${doc.document_id}</td>
						<td>${doc.userid}</td>
						<td><a href="${read}" id="underline">${doc.title}</a></td>
						<td>
							<c:choose>
								<c:when test="${fn:length(doc.content) > 25}">
									${fn:substring(doc.content, 0, 25)}...<input type="hidden"
										class="content" name="content" value="${ doc.content }">
								</c:when>
								<c:otherwise>
									${doc.content} <input type="hidden" class="content"
										name="content" value="${ doc.content }">
								</c:otherwise>
							</c:choose>
						</td>
						<td>${doc.created_date}</td>
						<td>${doc.updated_date}</td>
						<td>${doc.version}</td>
						<td><button class="bom_modal_btn">수정</button></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<hr>
	<!-- 	페이징 -->
	<div class="pagenum">
		<% Map map=(Map)request.getAttribute("map"); int totalCount=(int)map.get("totalCount");
			String str_countPerPage=(String)request.getAttribute("countPerPage"); int
			countPerPage=Integer.parseInt(str_countPerPage); String
			str_pageNo=(String)request.getAttribute("page"); int
			pageNo=Integer.parseInt(str_pageNo); int lastPage=(int)Math.ceil( (double)totalCount /
			(double)countPerPage ); int countPerSection=3; int
			position=(int)Math.ceil((double)pageNo / (double)countPerSection); int sec_first=( (
			position - 1 ) * countPerSection ) + 1; int sec_last=position * countPerSection;
			if(sec_last> lastPage) {
			sec_last = lastPage;
			}
			%>
			<c:set var="lastPage" value="<%= lastPage %>" scope="page" />
			<c:set var="countPerSection" value="<%= countPerSection %>" scope="page" />
			<a href="list?page=${ page - 1 }&countPerPage=${countPerPage}">이전</a>
			<c:forEach var="i" begin="1" end="${ lastPage }">
				<c:if test="${ i eq page }">
					<a
						href="list?page=${i}&countPerPage=${countPerPage}"><strong>[${i}]</strong></a>
				</c:if>
				<c:if test="${ !(i eq page) }">
					<a href="list?page=${i}&countPerPage=${countPerPage}">[${i}]</a>
				</c:if>
			</c:forEach>
			<a href="list?page=${ page + 1 }&countPerPage=${countPerPage}">다음</a>
	</div>
	<!-- 	모달창 -->
	<div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="modify">
				<table id="modalTable">
					<tr>
						<td>NO</td>
						<td><span id="document_id"></span></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" rows="4" cols="50"></textarea>
					</tr>
					<tr>
						<td>Ver</td>
						<td><input type="number" name="version" id="version"></td>
					</tr>
				</table>
				<input type="hidden" name="document_id" id="input_document_id">
				<input type="hidden" name="userid" id="input_userid">
				<input type="hidden" name="created_date" id="input_created_date">
				<input type="hidden" name="updated_date" id="input_updated_date">
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
	<!-- 	두번째 모달창 -->
	<div class="bom_modal_create">
		<div class="bom_modal_body_create">
			<form id="createmodalForm" method="post" action="create">
				<table id="createModalTable">
					<tr>
						<td style="width: 60px">NO</td>
						<td>문서번호는 자동으로 생성 됩니다.</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="userid" id="create_userid"></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" id="title"></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" id="content" rows="4" cols="50"></textarea>
					</tr>
					<tr>
						<td>작성일</td>
						<td><input type="date" name="created_date" id="created_date"></td>
					</tr>
					<tr>
						<td>수정일</td>
						<td id="updated_date"><input type="hidden" name="updated_date" id="input_updated_date"></td>
					</tr>
					<tr>
						<td>Ver</td>
						<td><input type="number" name="version" id="version"></td>
					</tr>
				</table>
			</form>
			<div class="createModal" onclick="createSubmit()">생성하기</div>
			<div class="createCloseModal">닫기</div>
		</div>
	</div>
</body>

<script src="/mes/JavaScript/정보_BOM문서관리_modal.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>

</html>