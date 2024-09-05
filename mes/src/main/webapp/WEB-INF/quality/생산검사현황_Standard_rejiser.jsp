<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                <span>품질관리 시험현황을 조회하는 페이지 입니다.</span> <br>
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
	시험항목 ID : <input type="hidden" name="ins_id" value="${dto.quality_id}"><br>
	품질기준 : <input type="hidden" name="production_id" value="${dto.title}"><br>
	관리자 : <input type="hidden" name="planid" value="${dto.mgr}"><br>
	인증기관 : <input type="date" name="ins_date" value="${dto.insti}"><br>
	인증날짜 : <input type="text" name="result" value="${dto.revision}"><br>

	<input type="submit" value="수정하기">
	</from>
            </div>
        </div>
 <a href="${modify}" name="modify">수정하기</a>
<a href = "register"> 목록으로</a>

</body>
</html>