<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" href="/mes/CSS/sidebar.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/topbar.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
    <link rel="stylesheet" href="button.css">
</head>
    

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
	
        <!-- 메인메뉴 아래 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1>품질 관리</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질 관리 항목을 조회하는 페이지입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="정보_BOM_SelectForm.jsp">
			<jsp:param name="select" value="select"/>
		</jsp:include>
        
		<div>
			<form method="get" action="list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<span class="newbtn"><a href="create" class="newbtn">새로 작성</a></span>
			<button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
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
                    	<th>품질 코드</th>
                    	<th>상품 코드</th>
                    	<th>계획 ID</th>
                    	<th>검사 날짜</th>
                    	<th>결과</th>
                    	<th>불량 개수</th>
                    	<th>불량 원인</th>
                    	<th>결과 ID</th>
                    	<th>작업 ID</th>
                    	<th style="width:100px"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="quality" items="${ map.list }">
                    	<tr>
                    		<td><input type="checkbox" id="selectchk"></td>
                    		
                    		<c:url var="read" value="read">
                    			<c:param name="ins_id" value="${ quality.ins_id }"/>
                    			<c:param name="production_id" value="${ quality.production_id }"/>
                    		</c:url>
                    		
                    		<td>${ quality.ins_id } </td>
                    		<td><a href="${ read }" id="underline">${ quality.production_id }</a> </td>
                    		<td>${ quality.planid } </td>
                    		<td>${ quality.ins_date } </td>
                    		<td>${ quality.result } </td>
                    		<td>${ quality.defect_count } </td>
                    		<td>${ quality.defect_cause } </td>
                    		<td>${ quality.resultID } </td>
                    		<td>${ quality.taskid } </td>
                    		<c:url var="modify" value="/quality/modify">
								<c:param name="ins_id" value="${ quality.ins_id }" />
								<c:param name="production_id" value="${ quality.production_id }" />
								<c:param name="planid" value="${ quality.planid }" />
								<c:param name="ins_date" value="${ quality.ins_date }" />
								<c:param name="result" value="${ quality.result }" />
								<c:param name="defect_count" value="${ quality.defect_count }" />
								<c:param name="defect_cause" value="${ quality.defect_cause }" />
								<c:param name="resultid" value="${ quality.resultID }" />
								<c:param name="taskid" value="${ quality.taskid }" />
							</c:url>
							<c:url var="delete" value="/quality/delete">
								<c:param name="ins_id" value="${ quality.ins_id }" />
							</c:url>
                    		<td class="modifyTD"><a href="${ modify }" id="modiA">수정</a>						
							</td>
                    	</tr>
                    </c:forEach>
                    </tbody>
                    
                </table>
                
        <div>
            <hr>
            <div class="pagenum">
                <%
					Map map = (Map)request.getAttribute("map");
				
					int totalCount = (int)map.get("totalCount");
					
					String str_countPerPage = (String)request.getAttribute("countPerPage");
					int countPerPage = Integer.parseInt(str_countPerPage);
					
					String str_pageNo = (String)request.getAttribute("page");
					int pageNo = Integer.parseInt(str_pageNo);
					
					int lastPage = (int)Math.ceil( (double)totalCount / (double)countPerPage );
					
					int countPerSection = 3;
					int position = (int)Math.ceil((double)pageNo / (double)countPerSection);
					int sec_first = ( ( position - 1 ) * countPerSection ) + 1;
					int sec_last = position * countPerSection;
					if(sec_last > lastPage) {
						sec_last = lastPage;
					}
				%>
				<c:set var="lastPage" value="<%= lastPage %>" scope="page"/>
				<c:set var="countPerSection" value="<%= countPerSection %>" scope="page"/>
					<a href="list?page=${ pageNo - 1 }&countPerPage=${countPerPage}">이전</a>
						<c:forEach var="i" begin="1" end="${ lastPage }">
							<c:if test="${ i eq pageNo }">
								<a href="list?page=${i}&countPerPage=${countPerPage}"><strong>[${i}]</strong></a>
							</c:if>
							<c:if test="${ !(i eq pageNo) }">
								<a href="list?page=${i}&countPerPage=${countPerPage}">[${i}]</a>
							</c:if>
						</c:forEach>
					<a href="list?page=${ pageNo + 1 }&countPerPage=${countPerPage}">다음</a>
        </div>

    </div>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
</html>