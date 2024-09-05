<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
    <title>소원을 들어주는 MES</title>
    <style>
    </style>
</head>

<body>
   <!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
        <!-- 메인메뉴 아래 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>생산실적</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>생산실적을 조회하는 페이지입니다.</span> <br>
            </div>
        </div>
        <h2>생산실적 요약</h2>
        <div class="canvasdiv">
            <canvas id="productionChart" width="400" height="400"></canvas>
            <canvas id="achievementChart" width="400" height="400"></canvas>
        </div>
        <!-- 실적 테이블 -->
        <div>
            <section id="summary">
                <!-- 생산실적 요약 정보 -->
                <div class="summary-item tableID shorttable">
                    <h3>총 생산량</h3>
                    <p id="total">합계 : *****</p>
                    <table id="totaltable">
                        <thead>
                            <tr>
                                <th>1월</th>
                                <th>2월</th>
                                <th>3월</th>
                                <th>4월</th>
                                <th>5월</th>
                                <th>6월</th>
                                <th>7월</th>
                                <th>8월</th>
                                <th>9월</th>
                                <th>10월</th>
                                <th>11월</th>
                                <th>12월</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>5180</td>
                                <td>3250</td>
                                <td>4680</td>
                                <td>5190</td>
                                <td>3750</td>
                                <td>4430</td>
                                <td>4970</td>
                                <td>2310</td>
                                <td>2430</td>
                                <td>3890</td>
                                <td>4860</td>
                                <td>3750</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable">
                    <h3>목표 달성률</h3>
                    <p id="monavg"></p>
                    <table id="montable">
                        <thead>
                            <tr>
                                <th>1월</th>
                                <th>2월</th>
                                <th>3월</th>
                                <th>4월</th>
                                <th>5월</th>
                                <th>6월</th>
                                <th>7월</th>
                                <th>8월</th>
                                <th>9월</th>
                                <th>10월</th>
                                <th>11월</th>
                                <th>12월</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>123%</td>
                                <td>97%</td>
                                <td>95%</td>
                                <td>97%</td>
                                <td>93%</td>
                                <td>93%</td>
                                <td>110%</td>
                                <td>96%</td>
                                <td>91%</td>
                                <td>97%</td>
                                <td>101%</td>
                                <td>98%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable">
                    <h3>이번 주 생산량</h3>
                    <p id="weekavg"></p>
                    <table id="weektable">
                        <thead>
                            <tr>
                                <th></th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>목표생산량</td>
                                <td>250</td>
                                <td>260</td>
                                <td>270</td>
                                <td>260</td>
                                <td>280</td>
                            </tr>
                            <tr>
                                <td>현재생산량</td>
                                <td>240</td>
                                <td>258</td>
                                <td>263</td>
                                <td>248</td>
                                <td>270</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable ">
                    <h3>주요 제품별 생산량</h3>
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th>E/F 소켓</th>
                                <th>E/F 앤드캡</th>
                                <th>E/F 레듀샤</th>
                                <th>E/F 서비스티</th>
                                <th>E/F 45도 엘보</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>목표생산량</td>
                                <td>235</td>
                                <td>234</td>
                                <td>394</td>
                                <td>872</td>
                                <td>345</td>
                            </tr>
                            <tr>
                                <td>현재생산량</td>
                                <td>235</td>
                                <td>234</td>
                                <td>394</td>
                                <td>872</td>
                                <td>345</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable">
                    <h3>전년 대비 성장률</h3>
                    <p id="mongrowavg">월별 평균 성장률 : **%</p>
                    <table id="mongrowtable">
                        <thead>
                            <tr>
                                <th>1월</th>
                                <th>2월</th>
                                <th>3월</th>
                                <th>4월</th>
                                <th>5월</th>
                                <th>6월</th>
                                <th>7월</th>
                                <th>8월</th>
                                <th>9월</th>
                                <th>10월</th>
                                <th>11월</th>
                                <th>12월</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>15%</td>
                                <td>6%</td>
                                <td>5%</td>
                                <td>6%</td>
                                <td>4%</td>
                                <td>4%</td>
                                <td>12%</td>
                                <td>5%</td>
                                <td>3%</td>
                                <td>4%</td>
                                <td>10%</td>
                                <td>9%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable">
                    <h3>가동률</h3>
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>가동률</td>
                                <td>95%</td>
                                <td>100%</td>
                                <td>100%</td>
                                <td>90%</td>
                                <td>90%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID shorttable">
                    <h3>품질 지표</h3>
                    <table>
                        <thead>
                            <tr>
                                <th></th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>불량률</td>
                                <td>1%</td>
                                <td>0%</td>
                                <td>1%</td>
                                <td>2%</td>
                                <td>0%</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="summary-item tableID">
                    <h3>특이사항</h3>
                    <p>새로운 생산 라인 도입으로 인해 생산 효율 향상</p>
                </div>
            </section>
            <div class="summary-item tableID shorttable">
                <section id="details">
                    <h3>상세 제품별 생산실적</h3>
                    <table style="width: 100%; text-align: center;">
                        <thead>
                            <tr>
                                <th>날짜</th>
                                <th>제품명</th>
                                <th>생산량</th>
                                <th>목표 생산량</th>
                                <th>달성률</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- 데이터 행 -->
                            <tr>
                                <td>2024-07-01</td>
                                <td>E/F 45도 엘보</td>
                                <td>198</td>
                                <td>200</td>
                                <td>99%</td>
                            </tr>
                            <tr>
                                <td>2024-07-03</td>
                                <td>E/F 90도 엘보</td>
                                <td>388</td>
                                <td>400</td>
                                <td>97%</td>
                            </tr>
                            <tr>
                                <td>2024-07-07</td>
                                <td>E/F 소켓</td>
                                <td>392</td>
                                <td>400</td>
                                <td>98%</td>
                            </tr>
                            <tr>
                                <td>2024-07-10</td>
                                <td>E/F 앤드캡</td>
                                <td>380</td>
                                <td>390</td>
                                <td>97%</td>
                            </tr>
                            <tr>
                                <td>2024-07-14</td>
                                <td>E/F 레듀사</td>
                                <td>398</td>
                                <td>400</td>
                                <td>99%</td>
                            </tr>
                            <tr>
                                <td>2024-07-18</td>
                                <td>E/F 티</td>
                                <td>299</td>
                                <td>300</td>
                                <td>100%</td>
                            </tr>
                            <tr>
                                <td>2024-07-22</td>
                                <td>E/F 서비스티</td>
                                <td>294</td>
                                <td>300</td>
                                <td>98%</td>
                            </tr>
                            <tr>
                                <td>2024-07-25</td>
                                <td>E/F 새들</td>
                                <td>193</td>
                                <td>200</td>
                                <td>97%</td>
                            </tr>
                            <tr>
                                <td>2024-08-01</td>
                                <td>E/F 45도 엘보</td>
                                <td>198</td>
                                <td>200</td>
                                <td>99%</td>
                            </tr>
                            <tr>
                                <td>2024-08-05</td>
                                <td>E/F 90도 엘보</td>
                                <td>388</td>
                                <td>400</td>
                                <td>97%</td>
                            </tr>
                            <tr>
                                <td>2024-08-09</td>
                                <td>E/F 소켓</td>
                                <td>392</td>
                                <td>400</td>
                                <td>98%</td>
                            </tr>
                            <tr>
                                <td>2024-08-12</td>
                                <td>E/F 앤드캡</td>
                                <td>380</td>
                                <td>390</td>
                                <td>97%</td>
                            </tr>
                            <tr>
                                <td>2024-08-15</td>
                                <td>E/F 레듀사</td>
                                <td>398</td>
                                <td>400</td>
                                <td>99%</td>
                            </tr>
                            <tr>
                                <td>2024-08-19</td>
                                <td>E/F 티</td>
                                <td>299</td>
                                <td>300</td>
                                <td>100%</td>
                            </tr>
                            <tr>
                                <td>2024-08-23</td>
                                <td>E/F 서비스티</td>
                                <td>294</td>
                                <td>300</td>
                                <td>98%</td>
                            </tr>
                            <tr>
                                <td>2024-08-28</td>
                                <td>E/F 새들</td>
                                <td>193</td>
                                <td>200</td>
                                <td>97%</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
            </div>
            <section id="charts">
                <!-- 그래프 및 차트 -->
            </section>
        </div>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/performance.js"></script>
<script src="/mes/JavaScript/perchart.js"></script>

</html>