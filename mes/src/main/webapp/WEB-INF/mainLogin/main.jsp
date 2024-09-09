<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.sql.Date"%>
<%@ page import="hong.material.dto.UserDTO"%>
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<title>소원을 들어주는 MES</title>

</head>

<body>
	<!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아래 정보가 표시될 영역 -->

	<div class="main_page">
		<!-- <h3>현황판</h3> -->
		<div class="main_page_kw">
			<div class="main_page_kw2">
				<!-- 생산계획 -->
				<h3>생산계획/작업지시서</h3>
				<div class="tableID">

<table>
        <tr>
            <th>번호</th>
            <th>제품id</th>
            <th>계획 수량</th>
            <th>계획 시작일</th>
            <th>계획 종료일</th>
            <th>상태</th>
        </tr>

        <c:if test="${not empty map.list}">
            <c:forEach var="plan" items="${map.list}">
                <tr>
                    <td>${plan.rnum}</td>
                    <td>${plan.production_id}</td>
                    <td>${plan.plannedQuan}</td>
                    <td>${plan.startDate}</td>
                    <td>${plan.endDate}</td>
                    <td>${plan.status}</td>
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
				</div>


			</div>
			<div>
				<!-- 게시판 -->
				<h3>
					<a href="/mes/board">공지사항(게시판)</a>
				</h3>
				<button id="button1" class="btn">글쓰기</button>
				<script>
					document.getElementById('button1').addEventListener(
							'click',
							function() {
								window.open('글쓰기', '글쓰기',
										'width=400,height=500');
							});
				</script>
				<table class="table">
					<thead>
						<tr class="header">
							<td class="num">번호</td>
							<td class="title">제목</td>
							<td class="content_kw">내용</td>
							<td class="width_kw main_hidden">작성자</td>
							<td class="width_kw">작성날짜</td>
							<td class="width_kw">관리</td>
						</tr>
					</thead>
					<tbody id="list">
						<!-- 버튼 클릭후 게시글 작성시 추가되는 영역 -->
					</tbody>
				</table>
				<br>

				<div id="pagination"></div>
				<script src="/mes/JavaScript/게시판.js"></script>

			</div>
		</div>

		<div class="main_page_kw">
			<div>
				<!-- 생산실적 현황 -->
				<h3>생산현황</h3>
<%-- 				<canvas id="productionChart" width="400" height="400"></canvas> --%>
				<canvas id="productionChart" width="400" height="400"></canvas>

			</div>

			<div>
				<h3>월별생산현황</h3>
				<canvas id="achievementChart" width="400" height="400"></canvas>
				
			</div>
			<script>
			const productionData = [5180, 3250, 4680, 5190, 3750, 4430, 4970, 2310, 2430, 3890, 4860, 3750];
			const achievementData = [123, 97, 95, 97, 93, 93, 110, 96, 91, 97, 101, 98];
			console.log(productionData);
			console.log(achievementData);
			options: {
				  responsive: false,
				  maintainAspectRatio: false
				}
			for (let i = 0; i < td.length; i++) {
			    let value = parseFloat(td[i].innerText.replace('%',''));
			    if (!isNaN(value)) {  // NaN 값이 아닌 경우에만 계산
			        sum += value;
			        count++;
			    }
			}
			function getlastweekDate() {
			    let today = new Date();
			    today.setDate(today.getDate() - 7);  // 날짜를 일주일 전으로 설정
			    let year = today.getFullYear();
			    let month = String(today.getMonth() + 1).padStart(2, '0');
			    let day = String(today.getDate()).padStart(2, '0');
			    return `${year}-${month}-${day}`;
			}
			</script>




		</div>
	</div>
	</div>

	</div>

</body>
<!-- <script src="/mes/JavaScript/sort.js"></script> -->
<!-- <script src="/mes/JavaScript/date.js"></script> -->
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/perchart.js"></script>


</html>