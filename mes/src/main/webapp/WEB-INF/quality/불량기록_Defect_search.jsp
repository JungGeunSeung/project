<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/mes/CSS/button.css">
    <link rel="stylesheet" href="/mes/CSS/calender.css">
    <link rel="stylesheet" href="/mes/CSS/common.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <link rel="stylesheet" href="/mes/CSS/sidebar.css">
    <link rel="stylesheet" href="/mes/CSS/table.css">
    <link rel="stylesheet" href="/mes/CSS/topbar.css">
    <link rel="stylesheet" href="/mes/CSS/게시판.css">
    <link rel="stylesheet" href="/mes/CSS/mobile.css">
    <script src="/mes/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
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
            <h1><a href="/mes/defect/list">Defect</a></h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질관리 불량기록을 조회하는 페이지 입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="불량기록_Defect_SelectForm.jsp">
			<jsp:param name="select" value="select"/>
		</jsp:include>
        
		<div>
			<form method="get" action="/mes/defect/list/search">
				<span>상품코드로 검색</span>
				<input type="text" name="production_id" placeholder="상품코드를 입력하세요.">
				<input type="submit" value="검색" class="btn">
			</form>
			<a href="/mes/BOM/create" class="newbtn">새로 작성</a>
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
					<th>품질기준 불량기록</th>
                    <th>불량기록 ID</th>
                    <th>품질검사 ID</th>
                    <th>제품 ID</th>
                    <th>계획 ID</th>
                    <th>불량 수량</th>
                    	
                    	
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="defect" items="${ defect }">
                    	<tr>
                    		<td><input type="checkbox" id="allchk"></td>
                    		
                    		<c:url var="read" value="/defect/read">
                    			<c:param name="report_id" value="${ dto.report_id }" />
						        <c:param name="ins_id" value="${ dto.ins_id }" />
						        <c:param name="production_id" value="${ dto.production_id }" />
                    		</c:url>
                    		
                    		<td>${ defect.ins_id }</td>
						<td><a href="${ read }" id="underline">${ defect.production_id }</a>
						</td>
						<td>${ defect.planid }</td>
						<td>${ defect.ins_date }</td>
						<td>${ defect.result }</td>
						<td>${ defect.defect_count }</td>
						<td>${ defect.resultID }</td>
						<c:url var="modify" value="/defect/modify">
							<c:param name="report_id" value="${ dto.report_id }" />
					        <c:param name="ins_id" value="${ dto.ins_id }" />
					        <c:param name="production_id" value="${ dto.production_id }" />
					        <c:param name="planid" value="${ dto.planid }" />
					        <c:param name="defect_count" value="${ dto.defect_count }" />
						</c:url>
						<c:url var="delete" value="/defect/delete">
							<c:param name="report_id" value="${ dto.report_id }" />
						    <c:param name="ins_id" value="${ dto.ins_id }" />
						    <c:param name="production_id" value="${ dto.production_id }" />
						</c:url>
                    	</tr>
                    </c:forEach>
                    </tbody>
                </table>
    </div>
    <hr>

    <script src="/mes/JavaScript/table.js"></script>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</body>
</html>