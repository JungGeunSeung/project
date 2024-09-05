<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
            <h1>생산검사현황</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질관리 생산검사현황을 조회하는 페이지 입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
             <div class="cntdiv">
                <span>게시물</span>
                 <select name="cnt" id="cnt" onchange="changePageSize()">
                    <option value="10">10개씩</option>
                    <option value="20">20개씩</option>
                    <option value="30">30개씩</option>
                    <option value="40">40개씩</option>
                    <option value="50" selected>50개씩</option>
                </select>
                <div>
                    <button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
                    <span>날짜별 조회</span>
                    <input type="date" id="startdate"> ~ <input type="date" id="enddate">
                    <button class="btn">검색</button>
                </div> 

            </div>
        </div>

    <div>품질검사 ID : ${ dto.ins_id }</div>
    <div>제품 ID : ${ dto.production_id }</div>
    <div>계획 ID : ${ dto.planid }</div>
    <div>검사날짜 : ${ dto.ins_date }</div>
    <div>검사결과 : ${ dto.result }</div>
    <div>불량수량 : ${ dto.defect_count }</div>
    <div>불량유형 : ${ dto.defect_cause }</div>
    <div>결과 ID : ${ dto.resultID }</div>
    <div>실적 ID : ${ dto.taskid }</div>
    <br>
	 <c:url var="modify" value="/quality/modify">
        <c:param name="ins_id" value="${ dto.ins_id }" />
        <c:param name="production_id" value="${ dto.production_id }" />
        <c:param name="planid" value="${ dto.planid }" />
        <c:param name="ins_date" value="${ dto.ins_date }" />
        <c:param name="result" value="${ dto.result }" />
        <c:param name="defect_count" value="${ dto.defect_count }" />
        <c:param name="defect_cause" value="${ dto.defect_cause }" />
        <c:param name="resultID" value="${ dto.resultID }" />
        <c:param name="taskid" value="${ dto.taskid }" />
    </c:url>
    
    <a href="${modify}" name="modify" class="btn" >수정하기</a><br>  
     <form method="post" action="delete">
            <input type="hidden" name="ins_id" value="${dto.ins_id }">
            <input type="submit" value="삭제하기" class="btn">
    </form>   
   
    <a href="/mes/quality/list" name="list" class="btn" >목록으로가기</a> 

</body>
</html>