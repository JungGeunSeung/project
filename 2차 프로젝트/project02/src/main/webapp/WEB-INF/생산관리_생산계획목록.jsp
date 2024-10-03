<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>생산관리 > 생산계획목록</title>
</head>

<body>
  <jsp:include page="/WEB-INF/topSide/topSide.jsp" />
  
  
   <!-- 모달 시작 -->
  <!-- 추가 및 수정 모달 -->
  <div class="modal fade" id="planModal" tabindex="-1" role="dialog" aria-labelledby="planModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="planModalLabel">생산 계획</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form id="planForm" action="/production" method="post">
            <input type="hidden" id="actionType" name="action" value="add"> action에 따라 add/update
            <input type="hidden" id="planid" name="planid"> planid는 수정 시 필요

            <div class="form-group">
              <label for="production_id">제품 ID:</label>
              <input type="text" class="form-control" id="production_id" name="production_id" required>
            </div>

            <div class="form-group">
              <label for="plannedQuan">계획 수량:</label>
              <input type="number" class="form-control" id="plannedQuan" name="plannedQuan" required>
            </div>

            <div class="form-group">
              <label for="startDate">계획 시작일:</label>
              <input type="date" class="form-control" id="startDate" name="startDate" required>
            </div>

            <div class="form-group">
              <label for="endDate">계획 종료일:</label>
              <input type="date" class="form-control" id="endDate" name="endDate" required>
            </div>

            <div class="form-group">
              <label for="status">상태:</label>
              <input type="text" class="form-control" id="status" name="status" required>
            </div>

            <div class="form-group">
              <label for="userid">사원 ID:</label>
              <input type="text" class="form-control" id="userid" name="userid" required>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="inbtn" data-dismiss="modal">닫기</button>
          <button type="button" class="inbtn" id="savePlanBtn">저장</button>
        </div>
      </div>
    </div>
  </div>
  <!-- 모달 끝 -->
  
  
  
  
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>생산계획 목록</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">


        <!-- 해당 목록 -->
        <div class="tableID">
                <span>생산계획서를 한번에 조회하는 페이지입니다.</span> <br>
    <button type="button" class="inbtn" id="addPlanBtn">새 계획 추가</button>
    <table>
        <tr>
        <th><input type="checkbox" id="allchk"></th>
            <th>번호</th>
            <th>계획id</th>
            <th>제품id</th>
            <th>계획 수량</th>
            <th>계획 시작일</th>
            <th>계획 종료일</th>
            <th>상태</th>
            <th>사원id</th>
             <th>작업</th>
        </tr>

        <c:if test="${not empty map.list}">
            <c:forEach var="plan" items="${map.list}">
                <tr>
                <td><input type="checkbox" id="tablechk"></td>
                    <td>${plan.rnum}</td>
                    <td>${plan.planid}</td>
                    <td>${plan.production_id}</td>
                    <td>${plan.plannedQuan}</td>
                    <td>${plan.startDate}</td>
                    <td>${plan.endDate}</td>
                    <td>${plan.status}</td>
                    <td>${plan.userid}</td>
                     <td>
                            <!-- 수정 버튼 클릭 시 모달이 열리고 해당 plan의 정보가 자동으로 입력 -->
                    <button type="button" class="btn btn-warning editPlanBtn" data-planid="${plan.planid}">수정</button>
                            <!-- 삭제 버튼 클릭 시 해당 plan을 삭제하는 링크로 이동 -->
							<a href="?action=delete&planid=${plan.planid}" class="btn btn-danger">삭제</a>
                        </td>
                </tr>
            </c:forEach>
            
            </div>
            <!-- 만약 map.list가 비어있다면 "자료가 없습니다."라는 메시지를 표시 -->
            <c:if test="${empty map.list}">
                <tr>
                    <td colspan="9">자료가 없습니다.</td>
                </tr>
            </c:if>
            
        </c:if>

            <c:if test="${empty map.list }">
			    <c:forEach var="plan" items="${map.list}">
				    <tr colspen="5">
					<td>자료가 없습니다.</td>
				    </tr>
			    </c:forEach>
            </c:if>
    </table>

    <%
	Map map = (Map) request.getAttribute("map");
	int totalCount = (int) map.get("totalCount");

	String str_countPerPage = (String) request.getAttribute("countPerPage");
	int countPerPage = Integer.parseInt(str_countPerPage);

	String str_pageNo = (String) request.getAttribute("page");
	int pageNo = Integer.parseInt(str_pageNo);

	int lastPage = (int) Math.ceil((double) totalCount / countPerPage);

	int countPerSection = 3; //한번에 보여줄 페이지 개수
	//페이지 섹션 위치(몇번째 덩어리 인가)
	int position = (int) Math.ceil((double) pageNo / countPerSection);
	int sec_first = ((position - 1) * countPerSection) + 1;
	int sec_last = (position) * countPerSection;

	if (sec_last > lastPage) {
		sec_last = lastPage;
	}
	%>


	<c:set var="lastPage2" value="<%=lastPage%>" scope="page" />

	<c:if test="<%=sec_first == 1%>">이전</c:if>
	<c:if test="<%=sec_first != 1%>">
		<a href="?page=<%=sec_first - 1%>">이전</a>
	</c:if>

	<%-- <c:forEach var="i" begin="1" end="${lastPage2 }"> --%>
	<c:forEach var="i" begin="<%=sec_first%>" end="<%=sec_last%>">
		<c:choose>
			<c:when test="${page !=i }">
	[<a href="?page=${i }">${i }</a>]
	</c:when>
			<c:otherwise>
	[<a href="?page=${i }"><strong>${i }</strong></a>]
	</c:otherwise>
		</c:choose>
	</c:forEach>


	<c:if test="<%=sec_last == lastPage%>">다음</c:if>
	<c:if test="<%=sec_last != lastPage%>">
		<a href="?page=<%=sec_last + 1%>">다음</a>
	</c:if>
	
 	<script> 
     // "새 계획 추가" 버튼 클릭 시 모달 열기
     document.getElementById('addPlanBtn').addEventListener('click', function() {
       document.getElementById('planForm').reset();  // 폼 초기화
       document.getElementById('actionType').value = 'add';  // action을 추가로 설정
       $('#planModal').modal('show');  // 모달 열기
     });

     // "수정" 버튼 클릭 시 모달 열기
     document.querySelectorAll('.editPlanBtn').forEach(button => {
       button.addEventListener('click', function() {
         const planId = this.dataset.planid;
        // Ajax를 사용해 서버로부터 해당 plan 데이터를 받아옴
         $.ajax({
           url: '/production?action=getPlanById', // 수정할 생산 계획 정보를 가져오는 API
           method: 'GET',
           data: { planid: planId },
           success: function(plan) {
             // 받아온 데이터를 폼에 채워넣음
             document.getElementById('planid').value = plan.planid;
             document.getElementById('production_id').value = plan.production_id;
             document.getElementById('plannedQuan').value = plan.plannedQuan;
             document.getElementById('startDate').value = plan.startDate;
             document.getElementById('endDate').value = plan.endDate;
             document.getElementById('status').value = plan.status;
             document.getElementById('userid').value = plan.userid;

             document.getElementById('actionType').value = 'edit';  // action을 수정으로 설정
             $('#planModal').modal('show');  // 모달 열기
           }
         });
      });
     });

     // "저장" 버튼 클릭 시 폼 제출
     document.getElementById('savePlanBtn').addEventListener('click', function() {
       document.getElementById('planForm').submit();  // 폼을 제출하여 추가 또는 수정 동작 수행
     });
     </script>

 
</body>
    <script src="/mes/JavaScript/sort.js"></script>
    <script src="/mes/JavaScript/date.js"></script>
    <script src="/mes/JavaScript/button.js"></script>
</html>