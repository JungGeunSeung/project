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


		<!-- 		<div> -->
		<!-- 			<h2>월별 총 생산량</h2> -->

		<%-- 			<canvas id="monthlyProductionChart" width="400" height="400"></canvas> --%>
		<!-- 		</div> -->

		<!-- 		<div> -->
		<!-- 			<h2>품목별 생산량</h2> -->
		<%-- 			<canvas id="productProductionChart" width="400" height="400"></canvas> --%>
		<!-- 		</div> -->



		<!-- 해당 페이지의 설명 -->
		<!--             <div class="subhead"> -->
		<!--                 <span>생산실적을 조회하는 페이지입니다.</span> <br> -->
		<!--             </div> -->
		<!--         </div> -->
		<!--         <h2>생산실적 요약</h2> -->
		<!--         <div class="canvasdiv"> -->
		<%--             <canvas id="productionChart" width="400" height="400"></canvas> --%>
		<%--             <canvas id="achievementChart" width="400" height="400"></canvas> --%>
		<!--         </div> -->
		<!--         실적 테이블 -->
		<!--         <div> -->
		<!--             <section id="summary"> -->
		<!--                 생산실적 요약 정보 -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>총 생산량</h3> -->
		<!--                     <p id="total">합계 : *****</p> -->
		<!--                     <table id="totaltable"> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th>1월</th> -->
		<!--                                 <th>2월</th> -->
		<!--                                 <th>3월</th> -->
		<!--                                 <th>4월</th> -->
		<!--                                 <th>5월</th> -->
		<!--                                 <th>6월</th> -->
		<!--                                 <th>7월</th> -->
		<!--                                 <th>8월</th> -->
		<!--                                 <th>9월</th> -->
		<!--                                 <th>10월</th> -->
		<!--                                 <th>11월</th> -->
		<!--                                 <th>12월</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>5180</td> -->
		<!--                                 <td>3250</td> -->
		<!--                                 <td>4680</td> -->
		<!--                                 <td>5190</td> -->
		<!--                                 <td>3750</td> -->
		<!--                                 <td>4430</td> -->
		<!--                                 <td>4970</td> -->
		<!--                                 <td>2310</td> -->
		<!--                                 <td>2430</td> -->
		<!--                                 <td>3890</td> -->
		<!--                                 <td>4860</td> -->
		<!--                                 <td>3750</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>목표 달성률</h3> -->
		<!--                     <p id="monavg"></p> -->
		<!--                     <table id="montable"> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th>1월</th> -->
		<!--                                 <th>2월</th> -->
		<!--                                 <th>3월</th> -->
		<!--                                 <th>4월</th> -->
		<!--                                 <th>5월</th> -->
		<!--                                 <th>6월</th> -->
		<!--                                 <th>7월</th> -->
		<!--                                 <th>8월</th> -->
		<!--                                 <th>9월</th> -->
		<!--                                 <th>10월</th> -->
		<!--                                 <th>11월</th> -->
		<!--                                 <th>12월</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>123%</td> -->
		<!--                                 <td>97%</td> -->
		<!--                                 <td>95%</td> -->
		<!--                                 <td>97%</td> -->
		<!--                                 <td>93%</td> -->
		<!--                                 <td>93%</td> -->
		<!--                                 <td>110%</td> -->
		<!--                                 <td>96%</td> -->
		<!--                                 <td>91%</td> -->
		<!--                                 <td>97%</td> -->
		<!--                                 <td>101%</td> -->
		<!--                                 <td>98%</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>이번 주 생산량</h3> -->
		<!--                     <p id="weekavg"></p> -->
		<!--                     <table id="weektable"> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th></th> -->
		<!--                                 <th>월</th> -->
		<!--                                 <th>화</th> -->
		<!--                                 <th>수</th> -->
		<!--                                 <th>목</th> -->
		<!--                                 <th>금</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>목표생산량</td> -->
		<!--                                 <td>250</td> -->
		<!--                                 <td>260</td> -->
		<!--                                 <td>270</td> -->
		<!--                                 <td>260</td> -->
		<!--                                 <td>280</td> -->
		<!--                             </tr> -->
		<!--                             <tr> -->
		<!--                                 <td>현재생산량</td> -->
		<!--                                 <td>240</td> -->
		<!--                                 <td>258</td> -->
		<!--                                 <td>263</td> -->
		<!--                                 <td>248</td> -->
		<!--                                 <td>270</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable "> -->
		<!--                     <h3>주요 제품별 생산량</h3> -->
		<!--                     <table> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th></th> -->
		<!--                                 <th>E/F 소켓</th> -->
		<!--                                 <th>E/F 앤드캡</th> -->
		<!--                                 <th>E/F 레듀샤</th> -->
		<!--                                 <th>E/F 서비스티</th> -->
		<!--                                 <th>E/F 45도 엘보</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>목표생산량</td> -->
		<!--                                 <td>235</td> -->
		<!--                                 <td>234</td> -->
		<!--                                 <td>394</td> -->
		<!--                                 <td>872</td> -->
		<!--                                 <td>345</td> -->
		<!--                             </tr> -->
		<!--                             <tr> -->
		<!--                                 <td>현재생산량</td> -->
		<!--                                 <td>235</td> -->
		<!--                                 <td>234</td> -->
		<!--                                 <td>394</td> -->
		<!--                                 <td>872</td> -->
		<!--                                 <td>345</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>전년 대비 성장률</h3> -->
		<!--                     <p id="mongrowavg">월별 평균 성장률 : **%</p> -->
		<!--                     <table id="mongrowtable"> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th>1월</th> -->
		<!--                                 <th>2월</th> -->
		<!--                                 <th>3월</th> -->
		<!--                                 <th>4월</th> -->
		<!--                                 <th>5월</th> -->
		<!--                                 <th>6월</th> -->
		<!--                                 <th>7월</th> -->
		<!--                                 <th>8월</th> -->
		<!--                                 <th>9월</th> -->
		<!--                                 <th>10월</th> -->
		<!--                                 <th>11월</th> -->
		<!--                                 <th>12월</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>15%</td> -->
		<!--                                 <td>6%</td> -->
		<!--                                 <td>5%</td> -->
		<!--                                 <td>6%</td> -->
		<!--                                 <td>4%</td> -->
		<!--                                 <td>4%</td> -->
		<!--                                 <td>12%</td> -->
		<!--                                 <td>5%</td> -->
		<!--                                 <td>3%</td> -->
		<!--                                 <td>4%</td> -->
		<!--                                 <td>10%</td> -->
		<!--                                 <td>9%</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>가동률</h3> -->
		<!--                     <table> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th></th> -->
		<!--                                 <th>월</th> -->
		<!--                                 <th>화</th> -->
		<!--                                 <th>수</th> -->
		<!--                                 <th>목</th> -->
		<!--                                 <th>금</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>가동률</td> -->
		<!--                                 <td>95%</td> -->
		<!--                                 <td>100%</td> -->
		<!--                                 <td>100%</td> -->
		<!--                                 <td>90%</td> -->
		<!--                                 <td>90%</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID shorttable"> -->
		<!--                     <h3>품질 지표</h3> -->
		<!--                     <table> -->
		<!--                         <thead> -->
		<!--                             <tr> -->
		<!--                                 <th></th> -->
		<!--                                 <th>월</th> -->
		<!--                                 <th>화</th> -->
		<!--                                 <th>수</th> -->
		<!--                                 <th>목</th> -->
		<!--                                 <th>금</th> -->
		<!--                             </tr> -->
		<!--                         </thead> -->
		<!--                         <tbody> -->
		<!--                             <tr> -->
		<!--                                 <td>불량률</td> -->
		<!--                                 <td>1%</td> -->
		<!--                                 <td>0%</td> -->
		<!--                                 <td>1%</td> -->
		<!--                                 <td>2%</td> -->
		<!--                                 <td>0%</td> -->
		<!--                             </tr> -->
		<!--                         </tbody> -->
		<!--                     </table> -->
		<!--                 </div> -->
		<!--                 <div class="summary-item tableID"> -->
		<!--                     <h3>특이사항</h3> -->
		<!--                     <p>새로운 생산 라인 도입으로 인해 생산 효율 향상</p> -->
		<!--                 </div> -->
		<!--             </section> -->




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
									<td><a href="?action=edit&resultID=${result.resultID}">수정</a></td>
									<td><a href="?action=delete&resultID=${result.resultID}">삭제</a></td>
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



