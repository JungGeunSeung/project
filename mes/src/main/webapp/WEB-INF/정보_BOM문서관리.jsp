


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/mes/CSS/sidebar.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/topbar.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
    <link rel="stylesheet" href="button.css">
</head>

<body>
    <!-- 사이드바 -->
	<jsp:include page="assetsform/sidebar.jsp">
		<jsp:param name="side" value="sidebar"></jsp:param>
	</jsp:include>
	<!-- 	상단바 -->
	<jsp:include page="assetsform/topbar.jsp">
		<jsp:param name="top" value="topbar"></jsp:param>
	</jsp:include>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1>문서관리(양식서)</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>회사에서 사용하는 문서들을 관리하는 페이지입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
             <div class="cntdiv">
                <jsp:include page="정보_BOM_SelectForm.jsp">
					<jsp:param name="select" value="select"/>
				</jsp:include>
                <!-- 검색조건을 바꿀 select -->
                <div>
                    <button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
                    <span>날짜별 조회</span>
                    <input type="date" id="startdate"> ~ <input type="date" id="enddate">
                    <button class="btn">검색</button>

                </div> 

            </div>
            <div>
			<form method="get" action="list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="title" placeholder="문서명을 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<span class="newbtn"><a href="create" class="newbtn">새로 작성</a></span>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
		</div>
        </div>

        <!-- 해당 목록 -->
        
        <!-- 해당 목록 -->
        <div class="tableID">
                <table>
                    <thead>
                    <tr>
                    	<th>
                    		<input type="checkbox" id="allchk">
                    	</th>
                    	<th>문서번호</th>
                    	<th>작성자</th>
                    	<th>제목</th>
                    	<th>내용</th>
                    	<th>작성일</th>
                    	<th>수정일</th>
                    	<th>문서번호</th>
                    	<th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="doc" items="${ map.list }">
                    	<tr>
                    		<td><input type="checkbox" id="selectchk"></td>
                    		
                    		<c:url var="read" value="read">
                    			<c:param name="bom_id" value="${ doc.document_id }"/>
                    		</c:url>
                    		
                    		<td>${ doc.document_id } </td>
                    		<td>${ doc.userid } </td>
                    		<td><a href="${ read }" id="underline">${ doc.title }</a> </td>
                    		<td>${ doc.content } </td>
                    		<td>${ doc.created_date } </td>
                    		<td>${ doc.updated_date } </td>
                    		<td>${ doc.version } </td>
                    		<td><button class="bom_modal_btn">수정</button></td>
                    	</tr>
                    </c:forEach>
                    </tbody>
                    
                </table>
                </div>
            <hr>
            <div class="bom_modal">
            	<div class="bom_modal_body">
            		<form>
            			문서번호 : ${ doc.document }<input type="hidden" name="document" value="${ doc.document }"><br>
            			작성자 : ${ doc.document }<input type="hidden" name="userid" value="${ doc.userid }"><br>
            			제목 : <input type="text" name="title" value="${ doc.title }"><br>
            			내용 : <input type="text" name="content" value="${ doc.content }"><br>
            			작성일 : <input type="text" name="created_date" value="${ doc.created_date }"><br>
            			수정일 : <input type="text" name="updated_date" value="${ doc.updated_date }"><br>
            			문서버전 : <input type="text" name="version" value="${ doc.version }"><br>
            			
            		</form>
            	</div>
            </div>

</body>
<script>
	const modal = document.querySelector('.bom_modal');
	const btn = document.querySelectorAll('.bom_modal_btn');
	
	for(let i=0; i<btn.size(); i++){
	btm.addEventListener("click", function(){
		modal.style.display = "flex";
	})
	}
</script>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
</html>