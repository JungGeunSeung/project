<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.or.gaw.dto.PaginationDTO,kr.or.gaw.dto.EmpDTO, javax.servlet.http.HttpSession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <title>비가동 이력</title>
    <style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.downtimeType, .downtimeDate, .downtimePerfermer {
	display: inline-block;
	background-color: white;
	border: 1px solid green;
	border-radius: 5px;
	margin: 10px;
	text-align: center;
	color: green;
	padding: 5px;
}

.downtimeType select, 
.downtimeSearch select,
.pagingDiv select,
.downtimePerfermer select {
	width: 100px;
	height: 20px;
	border: 1px solid green;
	color: green;
	border-radius: 5px;
	appearance: none;
	-webkit-appearance: none;
	-moz-appearance: none;
	text-align: center;
	margin: 5px;
}

.downtimeType select option:hover {
	background-color: green;
	color: white;
}

.downtimeSearch input {
	font-size: 16px;
	width: 200px;
	height: 20px;
	border: 1px solid green;
	border-radius: 5px;
	color: green;
}
.selectDiv {
	
	width: 100%;
}

.pagingDiv {
	float: right;
	margin: 20px 5px;
}

.search-type {
	width: 100%;
	margin: 20px 5px;
	padding: 10px 5px;
}

.btn {
	margin: 5px;
}

/* Pagination 스타일 */
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination .page-numbers {
    display: inline-block;
    padding: 10px 15px;
    margin: 0 5px;
    background-color: #e5ffd8;
    border: 1px solid #3bdf25da;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease, color 0.3s ease;
    text-decoration: none;
}

.pagination .page-numbers:hover,
.pagination .page-numbers.active {
    background-color: #3bdf25da;
    color: white;
}

.pagination .prev2, .pagination .next2 {
    font-size: 18px;
    margin: 0 10px;
    background-color: inherit;
    border: none;
    cursor: pointer;
    text-decoration: none;
}

#countPerPageForm {
    margin-top: 20px;
}

#insertEquipBtn {
	float: right;
}

#insertdowntimeBtn {
	float: right;
}

/* 모달 창 배경 */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    align-items: center;
    justify-content: center;
}

/* 모달 내용 */
.modal-content {
    background-color: white;
    padding: 30px;
    border-radius: 8px;
    width: auto;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
    text-align: center;
}

#editModal .modal-content {
    width: 800px;
}

.modal-actions {
    display: flex;
    justify-content: space-between;
}

.modal textarea {
	resize: none;
	width: 660px;
	height: 180px;
	margin: 0;
	padding: 0px 3px;
	border: none;
	font-size: 14px;
	overflow: auto;
	box-sizing: border-box;
	
}

.modal textarea:focus {
	outline: none;
}

.modal input:focus {
	outline: none;
}

.modal table tr {
	border: 1px solid gray;
}

.modal table th {
	background-color: #116d21;
	border: 1px solid gray;
	color: white;
}

/* 닫기 버튼 */
.close {
    float: right;
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
}

/* 입력 필드 */
.modal-content input[type="text"] {
	border: none;
    width: 100%;
    margin: 0;
    box-sizing: border-box;
}

/* 모달 내 버튼 그룹 */
.modal-actions {
    display: flex;
    justify-content: space-between;
    margin-top: 20px;
}

/* 폼 내부 라벨 스타일 */
label {
    display: block;
    text-align: left;
    margin-top: 10px;
    font-weight: bold;
}

#equipList, #equipList2  {
    position: absolute;
    width: 300px;
    max-height: 150px;
    overflow-y: auto;
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 0;
    margin: 5px 0 0 0;
    list-style: none;
    display: none; /* 기본적으로 숨김 */
    z-index: 1000;
}

#equipList li, #equipList2 li  {
    padding: 8px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
}

#equipList li:hover, #equipList2 li:hover  {
    background-color: #f0f0f0;
}

.model td {
    position: relative;
}

    </style>
</head>

<body>
<%
    // 모델에서 PaginationDTO 객체 가져오기
    PaginationDTO pagination = (PaginationDTO) request.getAttribute("pagination");

    // PaginationDTO의 값을 getter 메서드로 가져옵니다.
    int currentPage = pagination.getCurrentPage();
    int startPage = pagination.getStartPage();
    int endPage = pagination.getEndPage();
    int totalPages = pagination.getTotalPages();
    int countPerPage = pagination.getCountPerPage();
    boolean hasPrev = pagination.isHasPrev();
    boolean hasNext = pagination.isHasNext();
    int prevPage = pagination.getPrevPage();
    int nextPage = pagination.getNextPage();
%>
    <!-- 헤더 -->
    <header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!-- 메뉴바 -->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
	<!-- 메인 영역 -->
    <article>
    <h2 class="pageTitle">비가동이력</h2>
    <span class="pageDescription">설비의 유지와 보수, 고장으로 인한 생산라인의 비가동을 관리하는 페이지 입니다.</span>
    
    <div class="search-type">
    	<div class="downtimeSearch">
			<form id="searchForm" action="downtime" method="get">
				<input id="selectdowntime" type="hidden" name="downtime_id" value="">
				
				<select name="searchType" id="searchType">
					<option value="downtime_id" ${param.searchType == '"downtime_id"' ? 'selected' : ''}>비가동코드</option>
					<option value="equip_id" ${param.searchType == 'equip_id' ? 'selected' : ''}>설비코드</option>
					<option value="equip_name" ${param.searchType == 'equip_name' ? 'selected' : ''}>설비이름</option>
					<option value="user_name" ${param.searchType == 'user_name' ? 'selected' : ''}>작성자</option>
				</select>
				
				<input id="searchInputText" type="text" name="searchKeyword" placeholder="검색어를 입력하세요."/>
				<button type="submit" class="btn">
					<span>조회</span>
				</button>
	
				<!-- 페이지 이동 시에도 검색 정보가 유지되도록 hidden 필드 추가 -->
				<input type="hidden" name="countPerPage"
					value="${pagination.countPerPage}" /> <input type="hidden"
					name="page" value="${pagination.currentPage}" />
			</form>
		</div>
		<div class="contentBtn">
			<button id="insertdowntimeBtn" class="btn"><span>비가동이력 작성</span></button>
		</div>
		<div class="pagingDiv">
			<form id="countPerPageForm"
				action="downtime?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}"
				method="get">
				<select name="countPerPage" id="countPerPage"
					onchange="this.form.submit()">
					<option value="5"
						${pagination.countPerPage == 5 ? 'selected' : ''}>5개씩</option>
					<option value="10"
						${pagination.countPerPage == 10 ? 'selected' : ''}>10개씩</option>
					<option value="15"
						${pagination.countPerPage == 15 ? 'selected' : ''}>15개씩</option>
					<option value="20"
						${pagination.countPerPage == 20 ? 'selected' : ''}>20개씩</option>
					<option value="30"
						${pagination.countPerPage == 30 ? 'selected' : ''}>30개씩</option>
					<option value="40"
						${pagination.countPerPage == 40 ? 'selected' : ''}>40개씩</option>
					<option value="50"
						${pagination.countPerPage == 50 ? 'selected' : ''}>50개씩</option>
				</select>
				<input type="hidden" name="page" value="${pagination.currentPage}" /> 
				<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
				<input type="hidden" name="searchType" value="${searchType}" />
			</form>
		</div>

	</div>
	
    <table>
    	<thead>
    		<tr>
    			<th>비가동 코드</th>
    			<th>설비코드</th>
    			<th>설비이름</th>
    			<th>비가동 시작시간</th>
    			<th>재 가동시간</th>
    			<th>비가동 원인</th>
    			<th>점검자</th>
    			<th>점검내용</th>
    			<th>수정 및 삭제</th>
    		</tr>
    	</thead>
    	<tbody>
    		<c:forEach var="list" items="${list}">
	    		<tr>
	    			<td>${list.downtime_id}</td>
	    			<td>${list.equip_id}</td>
	    			<td>${list.equip_name}</td>
	    			<td><fmt:formatDate value="${list.start_time}" pattern="yyyy-MM-dd HH:mm"/></td>
	    			<td><fmt:formatDate value="${list.end_time}" pattern="yyyy-MM-dd HH:mm"/></td>
	    			<td>${list.reason}</td>
	    			<td>
		    			${list.emp_name}
		    			<input type="hidden" id="performer_position" value="${list.emp_position }">
		    			<input type="hidden" id="performer_user_id" value="${list.user_id }">
	    			</td>
	    			<td>${list.comments}</td>
	    			<td>
	    				<button class="btn modifydowntimeBtn"><span>수정</span></button>
	    				<button class="btn deletedowntimeBtn"><span>삭제</span></button>
	    			</td>
	    		</tr>
    		</c:forEach>
    	</tbody>
    </table>
    <%-- Pagination --%>
	<div class="pagination">
		<%-- 이전 페이지 링크 --%>
		<% if (hasPrev) {%>
		<a href="?page=<%=prevPage%>&countPerPage=<%=countPerPage%>&searchKeyword=${searchKeyword}&searchType=${searchType}" class="prev2 page-numbers">«</a><%}%>
		<%-- 페이지 번호 링크들 --%>
		<%for (int i = startPage; i <= endPage; i++) {%>
		<a href="?page=<%=i%>&countPerPage=<%=countPerPage%>"
			class="page-numbers <%=(i == currentPage) ? "active" : ""%>"> <%=i%>
		</a><%}%>
		<%-- 다음 페이지 링크 --%>
		<%if (hasNext) {%>
		<a href="?page=<%=nextPage%>&countPerPage=<%=countPerPage%>"
			class="next2 page-numbers">»</a><%}%>
	</div>
    <% 
			String username ="";
			String userposition ="";
			String userid ="";
			try {
		        EmpDTO loggedInUser = (EmpDTO) session.getAttribute("loggedInUser");

		        // 로그인 정보가 없는 경우 (Null 체크)
		        if (loggedInUser == null) {
		            response.sendRedirect("/gaw/login"); // 로그인 페이지로 리다이렉트
		            return; // 리다이렉트 후 아래 코드를 실행하지 않도록 종료
		        }

		        username = loggedInUser.getName();
		        userposition = loggedInUser.getPosition();
				userid = loggedInUser.getUser_id();
		    } catch (Exception e) {
		        // 예외 발생 시 로그인 페이지로 리다이렉트
		        response.sendRedirect("/gaw/login");
		        return;
		    } %>
	</article>
	<!-- 추가 모달창 -->
    <div id="insertmodal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>비가동이력 작성</h2>
	        <span>*작성자는 로그인한 아이디로 자동 저장됩니다. 작성자 및 직위를 바꾸셔도 반영되지 않습니다.*</span>
	        <form id="downtimeForm">
				<table>
			        <tr>
			            <th>작성자</th>
			            <th>성명</th>
			            <td><input type="text" name="emp_name" value="<%= username %>" placeholder="작성자는 로그인한 아이디로 채워집니다.">
			            	<input type="hidden" name="user_id" value="<%= userid %>">
			            </td>
			            <th>직위</th>
			            <td><input type="text" name="position" value="<%= userposition %>" placeholder="직위는 로그인한 아이디로 채워집니다."></td>
			        </tr>
			        <tr>
			        	<th rowspan="3">설비 및 날짜</th>
			            <th>설비(코드,이름,유형으로 검색)</th>
			            <td colspan="3"><input type="text" id="equipInput" placeholder="검색후 검색된 설비를 클릭하세요."><input type="hidden" name="equip_id" id="equipIdHidden">
			            	<ul id="equipList">
			            		<c:forEach var="code" items="${equipList}">
			            		<li data-equip-id="${code.equip_id}">[${code.equip_id }]${code.equip_name }(${code.type})</li>
			            		</c:forEach>
			            	</ul>
			            </td>
			        </tr>
			        <tr>
			            <th>비가동 시작시간</th>
			            <td colspan="3">
				            <input type="date" name="start_date"  style="width:auto;"><strong> :</strong>
				            <input type="text" name="startHour" min="0" max="23" style="width:60px; text-align:right; border: 1px solid gray;"  placeholder="123"><strong>시 :</strong>
				            <input type="text" name="startMin" min="0" max="59" style="width:60px; text-align:right; border: 1px solid gray;" placeholder="123"><strong>분</strong>
			            </td>
			        </tr>
			        <tr>
			            <th>재가동 시간</th>
			            <td colspan="3">
			            	<input type="date" name="end_date" style="width:auto;"><strong> :</strong>
				            <input type="text" name="endHour" min="0" max="23" style="width:60px; text-align:right; border: 1px solid gray;" placeholder="123"><strong>시 :</strong>
				            <input type="text" name="endMin" min="0" max="59" style="width:60px; text-align:right; border: 1px solid gray;" placeholder="123"><strong>분</strong>
			            </td>
			        </tr>
			        <tr>
			            <th>비가동 원인</th>
			            <td colspan="4"><textarea name="reason"></textarea></td>
			        </tr>
			        <tr>
			            <th>점검(조치)내용</th>
			            <td colspan="4"><textarea name="comments"></textarea></td>
			        </tr>
			    </table>
				
	            <div class="modal-actions">
	                <button type="submit" class="btn" id="submitDowntime"><span>작성</span></button>
	                <button type="button" class="btn cancel"><span>취소</span></button>
	            </div>
	        </form>
	    </div>
	</div>
	<!-- 	수정 모달 창 -->
	<div id="editModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>비가동 수정</h2>
	        <span>작성자 및 직위는 변경이 불가합니다.</span>
	        <form id="editdowntimeForm">
	            <input type="hidden" name="downtime_id" value="">
	
	            <table>
	                <tr>
	                    <th>작성자</th>
	                    <th>성명</th>
	                    <td>
	                        <input type="text" name="emp_name" value="<%= username %>" placeholder="작성자는 로그인한 아이디로 채워집니다.">
	                        <input type="hidden" name="user_id" value="<%= userid %>">
	                    </td>
	                    <th>직위</th>
	                    <td><input type="text" name="position" value="<%= userposition %>" placeholder="직위는 로그인한 아이디로 채워집니다."></td>
	                </tr>
	                <tr>
	                    <th rowspan="3">설비 및 날짜</th>
	                    <th>설비(코드,이름,유형으로 검색)</th>
	                    <td colspan="3">
	                        <input type="text" id="equipInput2" placeholder="검색 후 선택하세요.">
	                        <input type="hidden" name="equip_id" id="equipIdHidden2">
	                        <ul id="equipList2">
	                            <c:forEach var="code" items="${equipList}">
	                                <li data-equip-id="${code.equip_id}">[${code.equip_id}] ${code.equip_name} (${code.type})</li>
	                            </c:forEach>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <th>비가동 시작시간</th>
	                    <td colspan="3">
	                        <input type="date" name="start_date">
	                        <input type="number" name="startHour" min="0" max="23" placeholder="시"><strong>시 :</strong>
	                        <input type="number" name="startMin" min="0" max="59" placeholder="분"><strong>분</strong>
	                    </td>
	                </tr>
	                <tr>
	                    <th>재가동 시간</th>
	                    <td colspan="3">
	                        <input type="date" name="end_date">
	                        <input type="number" name="endHour" min="0" max="23" placeholder="시"><strong>시 :</strong>
	                        <input type="number" name="endMin" min="0" max="59" placeholder="분"><strong>분</strong>
	                    </td>
	                </tr>
	                <tr>
	                    <th>비가동 원인</th>
	                    <td colspan="4">
	                        <textarea name="reason"></textarea>
	                    </td>
	                </tr>
	                <tr>
	                    <th>점검(조치)내용</th>
	                    <td colspan="4">
	                        <textarea name="comments"></textarea>
	                    </td>
	                </tr>
	            </table>
	
	            <div class="modal-actions">
	                <button type="submit" class="btn" id="submitEditdowntime">수정</button>
	                <button type="button" class="btn cancel">취소</button>
	            </div>
	        </form>
	    </div>
	</div>
    <!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    <script>

    ////////////////////////////////////////////////////////////////////////////////////////////////
    const insertEquipBtn = document.getElementById('insertdowntimeBtn'); // 비가동 추가 버튼
    const insertmodal = document.getElementById('insertmodal'); // 비가동 추가 모달창
    const modals = document.querySelectorAll('.modal'); // 모달창 []
    const closeBtns = document.querySelectorAll('.close'); // 모달창에 닫기 버튼 []
    const cancelBtns = document.querySelectorAll('.cancel'); // 모달창에 취소 버튼 []
    
 	// 비가동이력 작성 모달 열기
    insertdowntimeBtn.addEventListener('click', () => {
    	insertmodal.style.display = 'flex'; // flex로 설정하여 중앙 정렬
    });

	// 반복문을 통해 닫기 버튼에 이벤트 리스너 추가
	closeBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const modal = button.closest('.modal'); // 클릭된 버튼의 부모 모달 가져오기
	        modal.style.display = 'none';
	    });
	});

	// 반복문을 통해 취소 버튼에 이벤트 리스너 추가
	cancelBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const modal = button.closest('.modal'); // 클릭된 버튼의 부모 모달 가져오기
	        modal.style.display = 'none';
	    });
	});

	// 반복문을 통해 모달 외부 클릭 시 닫기 이벤트 추가
	modals.forEach((modal) => {
	    window.addEventListener('click', (event) => {
	        if (event.target === modal) {
	            modal.style.display = 'none';
	        }
	    });
	});
    
	// 비가동이력 작성시 ajax로 전송
	document.getElementById('submitDowntime').addEventListener('click', function () {
		event.preventDefault();
        const form = document.getElementById('downtimeForm');
        const formData = new FormData(form);

        fetch('insertdowntime.do', {
            method: 'POST',
            body: formData,
        })
        .then(response => {
		    console.log(response); // 응답 객체 확인
		    return response.json();
		})
        .then(data => {
            if (data.success) {
                alert('비가동이력이 성공적으로 작성되었습니다.');
                location.href = 'downtime'; // 페이지 리다이렉트
            } else {
                alert('비가동이력 작성에 실패했습니다. 다시 시도하세요.' + data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('오류가 발생했습니다. 관리자에게 문의하세요.' + data.message);
        });
    });
    /////////////////////////////////////////////////////////////////////////////////
    // 비가동 이력 작성 모달에 설비 아이디 실시간 검색 필터링 기능
    const input = document.getElementById('equipInput');
    const equipList = document.getElementById('equipList');
    const items = equipList.querySelectorAll('#equipList li');
    const hiddenInput = document.getElementById('equipIdHidden'); // 숨겨진 input 필드

    // 인풋 이벤트 리스너
    input.addEventListener('input', () => {
        const query = input.value.toLowerCase();
        let hasVisibleItems = false;

        // 각 li 항목 필터링
        items.forEach(item => {
            const text = item.textContent.toLowerCase();
            if (text.includes(query)) {
                item.style.display = 'block';
                hasVisibleItems = true;
            } else {
                item.style.display = 'none';
            }
        });

        // 필터 결과에 따라 목록 표시/숨김
        equipList.style.display = hasVisibleItems ? 'block' : 'none';
    });

    // li 항목 클릭 시 인풋에 값 설정
    items.forEach(item => {
        item.addEventListener('click', () => {
        	const equipId = item.dataset.equipId; // data-equip-id 속성에서 ID 추출
            const equipName = item.textContent; // li의 텍스트 가져오기

            input.value = equipName; // 선택한 항목을 input에 설정
            hiddenInput.value = equipId; // hidden input에 ID 설정
            equipList.style.display = 'none'; // 목록 숨기기
        });
    });

    // 인풋 외부를 클릭하면 목록 숨기기
    document.addEventListener('click', (event) => {
        if (!equipList.contains(event.target) && event.target !== input) {
            equipList.style.display = 'none';
        }
    });
    /////////////////////////////////////////////////////////////////////////////////
    // 비가동 이력 수정 모달에 설비 아이디 실시간 검색 필터링 기능
    const input2 = document.getElementById('equipInput2');
    const equipList2 = document.getElementById('equipList2');
    const items2 = equipList2.querySelectorAll('#equipList2 li');
    const hiddenInput2 = document.getElementById('equipIdHidden2'); // 숨겨진 input 필드

    // 인풋 이벤트 리스너
    input2.addEventListener('input', () => {
        const query = input2.value.toLowerCase();
        let hasVisibleItems = false;

        // 각 li 항목 필터링
        items2.forEach(item => {
            const text = item.textContent.toLowerCase();
            if (text.includes(query)) {
                item.style.display = 'block';
                hasVisibleItems = true;
            } else {
                item.style.display = 'none';
            }
        });

        // 필터 결과에 따라 목록 표시/숨김
        equipList2.style.display = hasVisibleItems ? 'block' : 'none';
    });

    // li 항목 클릭 시 인풋에 값 설정
    items2.forEach(item => {
        item.addEventListener('click', () => {
        	const equipId = item.dataset.equipId; // data-equip-id 속성에서 ID 추출
            const equipName = item.textContent; // li의 텍스트 가져오기

            input2.value = equipName; // 선택한 항목을 input에 설정
            hiddenInput2.value = equipId; // hidden input에 ID 설정
            equipList2.style.display = 'none'; // 목록 숨기기
        });
    });

    // 인풋 외부를 클릭하면 목록 숨기기
    document.addEventListener('click', (event) => {
        if (!equipList2.contains(event.target) && event.target !== input2) {
            equipList2.style.display = 'none';
        }
    });
    //////////////////////////////////////////////////////////////////////////////////////////////////////
    const editModal = document.getElementById('editModal');
	const modifyBtns = document.querySelectorAll('.modifydowntimeBtn');
	
	// 수정 버튼 클릭 시 모달 열기 및 데이터 채우기
	modifyBtns.forEach((button) => {
	    button.addEventListener('click', (event) => {
	        const row = event.target.closest('tr');
	        const downtimeId = row.cells[0].textContent;
	        const equipId = row.cells[1].textContent;
	        const equipName = row.cells[2].textContent;

	        // 시작 및 종료 시간 가져오기
	        const startTime = row.cells[3].textContent; // yyyy-MM-dd HH:mm
	        const endTime = row.cells[4].textContent;   // yyyy-MM-dd HH:mm

	        const reason = row.cells[5].textContent;
	        const empName = row.cells[6].textContent.trim();
	        const performerPosition = row.querySelector('#performer_position').value;
	        const performerUserId = row.querySelector('#performer_user_id').value;
	        const comments = row.cells[7].textContent;

	        // 날짜와 시간 분리 (비가동 시작 시간)
	        const [startDate, startTimePart] = startTime.split(' ');
	        const [startHour, startMin] = startTimePart.split(':');

	        // 날짜와 시간 분리 (재가동 시간)
	        const [endDate, endTimePart] = endTime.split(' ');
	        const [endHour, endMin] = endTimePart.split(':');

	        // 필드에 데이터 채우기
	        editModal.querySelector('input[name="downtime_id"]').value = downtimeId;
	        editModal.querySelector('input[name="emp_name"]').value = empName;
	        editModal.querySelector('input[name="position"]').value = performerPosition;
	        editModal.querySelector('input[name="user_id"]').value = performerUserId;
	        editModal.querySelector('input[name="equip_id"]').value = equipId;
	        editModal.querySelector('textarea[name="reason"]').value = reason;
	        editModal.querySelector('textarea[name="comments"]').value = comments;

	        // 시작 시간 필드 채우기
	        editModal.querySelector('input[name="start_date"]').value = startDate;
	        editModal.querySelector('input[name="startHour"]').value = startHour;
	        editModal.querySelector('input[name="startMin"]').value = startMin;

	        // 재가동 시간 필드 채우기
	        editModal.querySelector('input[name="end_date"]').value = endDate;
	        editModal.querySelector('input[name="endHour"]').value = endHour;
	        editModal.querySelector('input[name="endMin"]').value = endMin;
	        
	        // ID에 해당하는 <li>의 텍스트를 <input>에 설정
	        const items2 = document.querySelectorAll('#equipList2 li');
	        items2.forEach((item) => {
	            if (item.dataset.equipId === equipId) {  // ID가 일치하는지 비교
	                document.getElementById('equipInput2').value = item.textContent;  // 일치하는 텍스트 설정
	                document.getElementById('equipIdHidden2').value = equipId;  // 숨겨진 input에 ID 설정
	            }
	        });

	        // 모달 창 열기
	        editModal.style.display = 'flex';
	    });
	});
	
	// 수정 폼 제출 시 AJAX로 데이터 전송
	document.getElementById('editdowntimeForm').addEventListener('submit', function (event) {
	    event.preventDefault(); // 기본 제출 방지
	
	    const form = event.target;
	    const formData = new FormData(form);
	
	    fetch('updatedowntime.do', {
	        method: 'POST',
	        body: formData,
	    })
	        .then(response => response.json())
	        .then(data => {
	            if (data.success) {
	                alert('비가동이력이 성공적으로 수정되었습니다.');
	                location.href = 'downtime'; // 페이지 리다이렉트
	            } else {
	                alert('비가동이력 수정에 실패했습니다: ' + data.message);
	            }
	        })
	        .catch(error => {
	            console.error('Error:', error);
	            alert('오류가 발생했습니다. 관리자에게 문의하세요.');
	        });
	});
 	////////////////////////////////////////////////////////////////////////////////////////
 	// 각 삭제 버튼에 이벤트 리스너 추가
 	const deletedowntimeBtn = document.querySelectorAll('.deletedowntimeBtn'); // 설비 삭제 버튼
	deletedowntimeBtn.forEach((button) => {
	    button.addEventListener('click', (event) => {
	    	event.preventDefault();
	        const row = event.target.closest('tr'); // 클릭된 버튼의 부모 행 가져오기
	        const downtime_id = row.cells[0].textContent; // main_id 가져오기
			console.log(downtime_id)
	        // 삭제 확인 창 표시
	        const confirmed = confirm(`비가동 ID: \${downtime_id}를 정말로 삭제하시겠습니까?`);

	        if (confirmed) {
	            // 삭제 요청 전송
	            fetch(`deletedowntime.do?downtime_id=\${downtime_id}`, {
	                method: 'POST', // 삭제 요청 전송 (POST로 설정)
	                headers: {
	                    'Content-Type': 'application/x-www-form-urlencoded',
	                },
	            })
	            .then((response) => {
	                if (response.ok) {
	                    alert('삭제가 완료되었습니다.');
	                    // 삭제된 행을 테이블에서 제거
	                    row.remove();
	                } else {
	                    alert('삭제에 실패했습니다.');
	                }
	            })
	            .catch((error) => {
	                console.error('삭제 중 오류가 발생했습니다:', error);
	                alert('삭제 중 오류가 발생했습니다.');
	            });
	        }
	    });
	});
    </script>
</body>
</html>