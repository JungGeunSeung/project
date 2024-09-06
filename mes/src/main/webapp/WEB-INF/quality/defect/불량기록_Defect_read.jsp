<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>품질관리/불량기록> Read코드</title>
</head>

<body>
    <!-- 카테고리바와 사이드바 동시 jsp -->
    <jsp:include page="/WEB-INF/topSide/topSide.jsp" />
    <!-- 메인메뉴 아래 정보가 표시될 영역 -->
    <div class="searchID">
        <!-- 해당 페이지의 제목 -->
        <h1>불량기록</h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>품질관리 불량기록 조회하는 페이지 입니다.</span> <br>
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

    <div>불량기록 ID : ${ dto.report_id }</div>
    <div>품질검사 ID : ${ dto.ins_id }</div>
    <div>제품 ID : ${ dto.production_id }</div>
    <div>계획 ID : ${ dto.planid }</div>
    <div>불량개수 : ${ dto.defect_count }</div>
    <br>
    <c:url var="modify" value="/defect/modify">
        <c:param name="report_id" value="${ dto.report_id }" />
        <c:param name="ins_id" value="${ dto.ins_id }" />
        <c:param name="production_id" value="${ dto.production_id }" />
        <c:param name="planid" value="${ dto.planid }" />
        <c:param name="defect_count" value="${ dto.defect_count }" />
    </c:url>

    <a href="${modify}" name="modify" class="btn">수정하기</a><br>
    <form method="post" action="delete">
        <input type="hidden" name="report_id" value="${dto.report_id }">
        <input type="hidden" name="ins_id" value="${dto.ins_id }">
        <input type="hidden" name="production_id" value="${dto.production_id }">
        <input type="hidden" name="planid" value="${dto.planid }">
        <input type="submit" value="삭제하기" class="btn">
    </form>

    <a href="/mes/quality/list" name="list" class="btn">목록으로가기</a>

</body>

</html>