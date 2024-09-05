<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    <!-- 카테고리바와 사이드바 동시 jsp -->
    <jsp:include page="/WEB-INF/topSide/topSide.jsp" />
    <!-- 메인메뉴 아래 정보가 표시될 영역 -->
    <div class="searchID">
        <!-- 해당 페이지의 제목 -->
        <h1>생산검사현황</h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>품질관리 불량기록을 조회하는 페이지 입니다.</span> <br>
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
            <from method="post" action="modify">
                불량기록 ID : <input type="hidden" name="report_id" value="${dto.report_id}">${dto.report_id}<br>
                품질검사 ID : <input type="hidden" name="ins_id" value="${dto.ins_id}">${dto.ins_id}<br>
                제품 ID : <input type="hidden" name="production_id"
                    value="${dto.production_id}">${dto.production_id}<br>
                계획 ID : <input type="hidden" name="planid" value="${dto.planid}">${dto.planid}<br>
                불량수량 : <input type="number" name="defect_count" value="${dto.defect_count}"><br>
                <input type="submit" value="수정하기">
            </from>
        </div>
    </div>
    <a href="${modify}" name="modify">수정하기</a>
    <a href="register"> 목록으로</a>

</body>

</html>