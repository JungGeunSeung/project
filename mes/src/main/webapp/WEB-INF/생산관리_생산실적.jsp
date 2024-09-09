<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/performance.js"></script>

<title>생산관리 > 생산실적</title>
<style>
</style>
</head>

<body>
	<!-- 사이드바 -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
	<!-- 메인메뉴 아레 정보가 표시될 영역 -->
	<div class="searchID">
		<!-- 해당 페이지의 제목 -->
		<h1>생산실적</h1>



		<div style="display: flex;">
			<div>
				<canvas id="productionChart" width="400" height="400"></canvas>
			</div>
			<div>
				<canvas id="achievementChart" width="400" height="400"></canvas>
			</div>
		</div>
<%-- 		<c:if test="${empty productionResultService.getProductionById()}"> --%>
<!-- 			<p>No production data available.</p> -->
<%-- 		</c:if> --%>

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
		
		
		 // Production ID 데이터와 생산량 데이터를 배열로 구성
        var productionIds = [];
        var productionQuantities = [];

        // JSP에서 Java 데이터를 JavaScript로 전달
        <c:forEach var="result" items="${productionResultService.getProductionById()}">
            productionIds.push("${result.productionID}");
            productionQuantities.push(${result.producedQuantity});
        </c:forEach>

        // 막대 차트 그리기
        var ctx = document.getElementById('productionIdChart').getContext('2d');
        var productionIdChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: productionIds,  // Production ID
                datasets: [{
                    label: 'Production Quantity',
                    data: productionQuantities,  // 각 Production ID의 생산량
                    backgroundColor: 'rgba(54, 162, 235, 0.5)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: false,  // 반응형 차트 비활성화
                maintainAspectRatio: false,  // 기본 비율 유지 비활성화
                scales: {
                    y: {
                        beginAtZero: true  // y축을 0부터 시작하도록 설정
                    }
                },
                plugins: {
                    legend: {
                        position: 'top'
                    },
                    title: {
                        display: true,
                        text: 'Production Quantity by Production ID'
                    }
                }
            }
        });




        // 월별 생산량 데이터
        var monthlyLabels = [];
        var monthlyData = [];

        <c:forEach var="result" items="${productionResultService.getMonthlyProduction()}">
            monthlyLabels.push("${result.month}월");
            monthlyData.push(${result.producedQuantity});
        </c:forEach>

        // 품목별 생산량 데이터
        var productLabels = [];
        var productData = [];

        <c:forEach var="result" items="${productionService.getProductionByProduct()}">
            productLabels.push("${result.productType}");
            productData.push(${result.producedQuantity});
        </c:forEach>

     // 차트 생성 시 로그 추가
        console.log('Creating monthly production chart with data: ', monthlyData);

        // 차트를 생성하는 코드
        var ctx = document.getElementById('monthlyProductionChart').getContext('2d');
        var monthlyChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: monthlyLabels,
                datasets: [{
                    label: '월별 총 생산량',
                    data: monthlyData,
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // 품목별 생산량 차트
        var ctx2 = document.getElementById('productProductionChart').getContext('2d');
        var productChart = new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: productLabels,
                datasets: [{
                    label: '품목별 생산량',
                    data: productData,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true
            }
        });
        
        console.log(monthlyLabels); 
		console.log(monthlyData);
		
		monthlyLabels.push("${result.month}월");  // 문자열은 반드시 따옴표로 감싸야 합니다
		monthlyData.push(${result.producedQuantity});  // 숫자는 그냥 전달

        
        
    </script>


		<div class="summary-item tableID shorttable">
			<section id="details">
				<h3>상세 제품별 생산실적</h3>
				<div class="tableID">
					<a href="?action=edit">생산실적 추가</a>
					<table>
						<thead>
							<tr>
								<th><input type="checkbox" id="allchk"></th>
								<th>ResultID</th>
								<th>Production ID</th>
								<th>Task ID</th>
								<th>계획 ID</th>
								<th>생산 Date</th>
								<th>제품 Quantity</th>
								<th>불량 Quantity</th>
								<th>상태</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="result" items="${results}">
								<tr>
									<td><input type="checkbox" id="tablechk"></td>
									<td>${result.resultID}</td>
									<td>${result.productionID}</td>
									<td>${result.taskID}</td>
									<td>${result.planID}</td>
									<td><fmt:parseDate value="${result.productionDate}"
											var="dateValue" pattern="yyyy-MM-dd HH:mm:ss" /> <fmt:formatDate
											value="${dateValue}" pattern="yyyy-MM-dd" /></td>
									<td>${result.producedQuantity}</td>
									<td>${result.defectiveQuantity}</td>
									<td>${result.status}</td>
									<td><a class="inbtn" href="?action=edit&resultID=${result.resultID}">수정</a></td>
									<td><a class="inbtn" href="?action=delete&resultID=${result.resultID}">삭제</a></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				<section id="charts">
					<!-- 그래프 및 차트 -->
				</section>
		</div>
</body>
<script src="/mes/JavaScript/sort.js"></script>

<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/perchart.js"></script>


</html>



