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
	<jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
	<!-- 	상단바 -->
	<jsp:include page="/WEB-INF/assetsform/topbar.jsp" />
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>생산검사현황</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>품질관리 시험항목을 조회하는 페이지 입니다.</span> <br>
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

    <div>시험기준 ID : ${ dto.quality_id }</div>
    <div>품질기준 : ${ dto.title }</div>
    <div>관리자 : ${ dto.mgr }</div>
    <div>인증기관 : ${ dto.insti }</div>
    <div>인증날짜 : ${ dto.revision }</div>

    <br>
	 <c:url var="modify" value="/standard/modify">
        <c:param name="ins_id" value="${ dto.quality_id }" />
        <c:param name="production_id" value="${ dto.title }" />
        <c:param name="planid" value="${ dto.mgr }" />
        <c:param name="ins_date" value="${ dto.insti }" />
        <c:param name="result" value="${ dto.revision }" />
    </c:url>
    
    <a href="${modify}" name="modify" class="btn" >수정하기</a><br>  
     <form method="post" action="delete">
            <input type="hidden" name="ins_id" value="${dto.ins_id }">
            <input type="submit" value="삭제하기" class="btn">
    </form>   
   
    <a href="/mes/standard/list" name="list" class="btn" >목록으로가기</a> 

</body>
</html>