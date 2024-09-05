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
	<jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
	<!-- 	상단바 -->
	<jsp:include page="/WEB-INF/assetsform/topbar.jsp" />

	
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1><a href="/mes/standard/list">Standard</a></h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질관리 품질기준을 조회하는 페이지 입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
		<jsp:include page="품질기준_Standard_SelectForm.jsp">
			<jsp:param name="select" value="select"/>
		</jsp:include>
        
		<div>
			<form method="get" action="/mes/standard/list/search">
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
					<th>시험기준 ID</th>
					<th>품질기준</th>
					<th>관리자</th>
					<th>인증기관</th>
					<th>인증날짜</th>
                    	
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="standard" items="${ standard }">
                    	<tr>
                    		<td><input type="checkbox" id="allchk"></td>
                    		
                    		<c:url var="read" value="/standard/read">
                    			<c:param name="quality_id" value="${ standard.quality_id }"/>
                    			<c:param name="title" value="${ standard.title }"/>
                    		</c:url>
                    		
                    		<td>${  standard.quality_id }</td>
						<td>id="underline">${ standard.title }
						</td>
						<td>${ standard.quality_id }</td>
						<td>${ standard.title }</td>
						<td>${ standard.mgr }</td>
						<td>${ standard.insti }</td>
						<td>${ standard.revision }</td>
						<c:url var="modify" value="/standard/modify">
							<c:param name="quality_id" value="${ standard.quality_id }" />
							<c:param name="production_id" value="${ standard.title }" />
							<c:param name="planid" value="${ standard.mgr }" />
							<c:param name="ins_date" value="${ standard.insti }" />
							<c:param name="result" value="${ standard.revision }" />
						</c:url>
						<c:url var="delete" value="/standard/delete">
							<c:param name="ins_id" value="${ standard.quality_id }" />
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