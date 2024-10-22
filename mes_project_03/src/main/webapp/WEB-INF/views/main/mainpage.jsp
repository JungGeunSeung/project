<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <title>Grand All Win</title>
    <style>

    /*------------------------------ 메인 영역 ----------------------------------*/
    .main-content {
        display: grid;
        grid-template-rows: auto;  /* 행 방향으로 쌓이도록 설정 */
        gap: 20px;                 /* 각 div 사이의 간격 */
        justify-content: center;   /* 가운데 정렬 */
        padding: 20px;
        
    }

    .main-content .content_1,
    .main-content .content_2,
    .main-content .content_3 {
        border: 1px solid #ddd;
        padding: 20px;
        background-color: #def3dc;
        box-shadow: 0 5px 10px rgba(70, 135, 109, 0.325);
        max-width: 800px;           /* 최대 너비 */
        width: 100%;                /* 가로폭 100% */
        min-height: 300px;          /* 최소 높이 */
        min-width: 800px;
    }

    /* 브라우저 너비에 따라 article 너비를 조정 */
    .main-content {
        max-width: 900px;
        margin: 0 auto;             /* 브라우저 가운데 정렬 */
    }
    
	table {
	  width: 100%;
	  border-collapse: collapse;
	  overflow: hidden;
	  margin-top: 20px;
	  text-align: center;
	  border-radius: 5px;
	}
	  
	thead {
	  font-weight: bold;
	  color: #fff;
	  background: #116d21;
      
	}
	  
	 td, th {
	 padding: 5px 0px;
	  vertical-align: middle;
	}
	  
	 td {
	  border-bottom: 1px solid rgba(0,0,0,.1);
	}
	
	.title {
		width: 300px;
	}
	
	.chartDiv {
		width: auto;
		height: 200px;
		display: flex;
		justify-content: space-around;
	}
	
	.chart-container {
	    width: 45%;  /* 각 차트의 너비를 45%로 설정 */
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	
	.table-container {
	    margin-top: 20px;
	    overflow-x: auto;
	}
	/* 오늘 날짜의 행에 배경색 적용 */
	.today-row {
            border: 3px solid rgb(144, 239, 121);
            background-color: #f5fff4;
            border-radius: 3px;
        }

    </style>
</head>

<body>
    <header>
        <!----------------- 헤더 ----------------->
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <!----------------- 메뉴바 ----------------->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>

    <article>
        <div class="main-content">
            <div class="content_1">
                <h2 class="mainCommunity"><a href="allposts">커뮤니티</a></h2>
                <span class="mainNewposts">최신글</span>
                <table>
	                <thead>
	                	<tr>
	                		<th>no</th>
	                		<th>게시판</th>
	                		<th class="title">제목</th>
	                		<th>작성자</th>
	                		<th>작성시간</th>
	                	</tr>
                	</thead>
                	<tbody>
	               		<c:forEach var="newpost" items="${newPost}" varStatus="status">
	                		<tr>
	                			<td>${status.index + 1}</td>
	                			<td>${newpost.board_name}</td>
	                			<td><a href="post.read?post_id=${newpost.post_id}">${newpost.title}</a></td>
	                			<td>${newpost.author_name}</td>
	                			<td>${newpost.disPlayTime}</td>
	                		</tr>
	               		</c:forEach>
               		</tbody>
                </table>
            </div>
            <div class="content_2">
                <h2><a href="/gaw/performance">생산실적</a></h2>
                <span>24년 제품군 생산량</span>
                <div class="chartDiv">
			        <!-- 불량률 도넛 차트 -->
			        <div class="chart-container">
			            <canvas id="donutChart"></canvas>
			        </div>
			
			        <!-- 생산량 막대 차트 -->
			        <div class="chart-container">
			            <canvas id="barChart"></canvas>
			        </div>
			    </div>
			    <div class="table-container">
	                <table>
	                	<thead>
	                		<tr>
	                			<th>제품군</th>
	                			<th>실제 생산량</th>
	                			<th>불량수</th>
	                			<th>불량률</th>
	                		</tr>
	                	</thead>
	                	<tbody>
		                	<c:forEach var="performance" items="${ performance }">
		                		<tr>
		                			<td>${performance.product_name }</td>
		                			<td>${performance.total_actual }</td>
		                			<td>${performance.total_defect_quantity }</td>
		                			<td>${performance.defect_rate }%</td>
		                		</tr>
		                	</c:forEach>
	                	</tbody>
	                </table>
                </div>
            </div>
            <div class="content_3">
                <h2>생산계획 및 일정</h2>
                <span>생산 일정</span>
                <table id="dynamicTable">
			        <thead>
			            <tr>
			            	<th>날짜</th>
			            	<th>모션데스크 (모터100)</th>
			            	<th>일반데스크</th>
			            	<th>3단 서랍장</th>
			            	<th>4단 서랍장</th>
			            	<th>5단 서랍장</th>
			            </tr>
			        </thead>
			        <tbody id="tableBody">
			        	<c:forEach var="plan" items="${plan}">
			        		<tr>
			        			<td><fmt:formatDate value="${plan.start_date}" pattern="yyyy-MM-dd" /></td>
			        			<td>${plan.motion }</td>
			        			<td>${plan.nomal }</td>
			        			<td>${plan.drawers3 }</td>
			        			<td>${plan.drawers4 }</td>
			        			<td>${plan.drawers5 }</td>
			        		</tr>
			        	</c:forEach>
			        </tbody>
			    </table>
            </div>
        </div>
        <!-- 로딩 CSS에 해당하는 HTML -->
	<jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
    </article>

    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
    <script>
    // 데이터를 서버에서 가져오기 위해 JSP 변수 사용
    // 데이터를 서버에서 가져오기 위해 JSP 변수 사용
        const productNames = [];
        const defectRates = [];
        const totalActuals = [];

        <c:forEach var="performance" items="${performance}">
            productNames.push('${performance.product_name}');
            defectRates.push(${performance.defect_rate});
            totalActuals.push(${performance.total_actual});
        </c:forEach>

        // 불량률 도넛 차트 설정
        const ctxDonut = document.getElementById('donutChart').getContext('2d');
        new Chart(ctxDonut, {
            type: 'doughnut',
            data: {
                labels: productNames.map(name => name + ' 불량률'),
                datasets: [{
                    label: '불량률',
                    data: defectRates,
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)',
                        'rgba(255, 159, 64, 0.6)',
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { position: 'top' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.label + ': ' + context.raw.toFixed(2) + '%';
                            }
                        }
                    }
                }
            }
        });

        // 생산량 막대 차트 설정
        const ctxBar = document.getElementById('barChart').getContext('2d');
        new Chart(ctxBar, {
            type: 'bar',
            data: {
                labels: productNames,
                datasets: [{
                    label: '생산량',
                    data: totalActuals,
                    backgroundColor: 'rgba(75, 192, 192, 0.6)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            stepSize: 100
                        }
                    }
                },
                plugins: {
                    legend: { position: 'top' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.raw;
                            }
                        }
                    }
                }
            }
        });
        /////////////////////////////////////////////////////////////////////////////////////////
        // 오늘 날짜 가져오기 (yyyy-MM-dd 형식)
        const today = new Date().toISOString().split('T')[0];

        // 모든 tr 요소를 가져오기
        const rows = document.querySelectorAll('#tableBody tr');

        // 각 행을 순회하면서 첫 번째 열의 날짜가 오늘과 같으면 배경색 추가
        rows.forEach(row => {
            const dateCell = row.querySelector('td'); // 첫 번째 td (날짜 셀)
            const rowDate = dateCell.textContent.trim(); // 날짜 텍스트 가져오기

            if (rowDate === today) {
                row.classList.add('today-row'); // 오늘 날짜와 같다면 클래스 추가
            }
        });
    </script>
</body>

</html>
