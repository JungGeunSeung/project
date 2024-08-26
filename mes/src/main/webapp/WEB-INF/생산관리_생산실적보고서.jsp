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
    <link rel="stylesheet" href="button.css">
</head>

<body>
    <!-- 사이드바 -->
    <div class="sidebar">
        <a href="main">
            <img class="Logo"
                src="/mes/Image/로고.png"
                alt=""></a>

        <div class="profile" id="bos">
            <img src="/mes/Image/정근승.png"
                alt="프로필 사진">
            <h2>정근승</h2>
            <p>대표이사</p>
            <input type="button" value="로그아웃" class="btn" onclick="location.href='login'">

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="관리자페이지" class="btn" onclick="location.href='관리자'">
            </div>
        </div>

        <div class="profile" id="kwon">
            <img src="/mes/Image/권대호.png"
                alt="프로필 사진">
            <h2>권대호</h2>
            <p>상무</p>
            <input type="button" value="로그아웃" class="btn" onclick="location.href='login'">

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="관리자페이지" class="btn" onclick="location.href='관리자'">
            </div>
        </div>

        <div class="profile" id="daall">
            <img src="/mes/Image/정다올.png"
                alt="프로필 사진">
            <h2>정다올</h2>
            <p>생산관리팀 부장</p>

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="로그아웃" class="btn" onclick="location.href='login'">
            </div>
        </div>

        <div class="profile" id="sowon">
            <img src="/mes/Image/김소원.png"
                alt="프로필 사진">
            <h2>김소원</h2>
            <p>생산팀 부장</p>
            
            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="로그아웃" class="btn" onclick="location.href='login'">
            </div>
        </div>

        <div class="cal_kwon">
            <div id="calendar"></div>
            <script src="/mes/JavaScript/calendar_nomall.js"></script>
        </div>

        <h3>열어본 페이지 목록</h3>
        <ul class="history">
            <li>
                <a href="#가장최근에 열어본 페이지">재고관리</a>
            </li>
            <li>
                <a href="#열어본 페이지">생산관리</a>
            </li>
        </ul>

    </div>

    <!--/////////////////////////////////////////////////////////////-->
    <!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
    <div class="content">
        <!--메뉴바-->
        <div class="menu">
            <ul>
                <!--상위 메뉴-->
                <li class="menu-item">
                    <a href="#">정보/BOM</a>
                    <div class="submenu">
                        <ul>
                            <!--하위메뉴-->
                            <li><a href="BOM">BOM</a></li>
                            <li class="manager"><a href="설비코드">설비코드</a></li>
                            <li><a href="조직도">조직도</a></li>
                            <li><a href="문서관리">BOM문서관리(양식서)</a></li>
                        </ul>
                    </div>
                </li>
                <li class="menu-item">
                    <a href="#">재고관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="자재관리">자재입출고(자재관리)</a></li>
                            <li class="manager"><a href="재고관리">재고관리</a></li>
                            <li><a href="저장위치">저장위치(MAP)</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item manager">
                    <a href="#">품질관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="시험항목_품질기준">제품별 시험항목/품질기준</a></li>
                            <li><a href="생산검사현황">생산검사현황</a></li>
                            <li><a href="검사현황">검사현황</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item">
                    <a href="#">생산관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="생산계획목록">생산계획목록</a></li>
                            <li><a href="작업지시서목록">작업지시목록</a></li>
                            <li><a href="생산실적">생산실적</a></li>
                            <li><a href="생산실적보고서">생산실적보고서</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item manager">
                    <a href="#">설비관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="공정별설비관리">공정별설비관리/수리보고서</a></li>
                            <li><a href="설비고장_수리이력">설비고장/수리이력</a></li>
                            <li><a href="비가동이력">비가동이력</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
        <hr>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>생산 실적 보고서</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>생산 실적 보고서를 작성하는 페이지 입니다.</span> <br>
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

        <!-- 해당 목록 -->
        <div>

            <body>
                <h1>생산 실적 보고서</h1>
                <h2>2024년 7월</h2>

                <div class="summary">
                    <h2>요약</h2>
                    <p>이번 달 총 생산량: 10,000개</p>
                    <p>평균 생산량: 2,500개/주</p>
                    <p>최고 생산 주: 2주차 (2,800개)</p>

                    <div class="buttons">
                        <button class="btn" id="btn1">1월</button>
                        <button class="btn" id="btn2">2월</button>
                        <button class="btn" id="btn3">3월</button>
                        <button class="btn" id="btn4">4월</button>
                        <button class="btn" id="btn5">5월</button>
                        <button class="btn" id="btn6">6월</button>
                        <button class="btn" id="btn7">7월</button>
                        <button class="btn" id="btn8">8월</button>
                        <button class="btn" id="btn9">9월</button>
                        <button class="btn" id="btn10">10월</button>
                        <button class="btn" id="btn11">11월</button>
                        <button class="btn" id="btn12">12월</button>
                    </div>
                </div>
                <div>
                    <div class="tableID tableHI monthHI1월">
                        <h2>2024년 1월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 8,000개</p>
                            <p>평균 생산량: 2,000개/주</p>
                            <p>최고 생산 주: 3주차 (2,500개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-01-01 ~ 2024-01-07)</td>
                                    <td>1,800</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-01-08 ~ 2024-01-14)</td>
                                    <td>2,000</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-01-15 ~ 2024-01-21)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-01-22 ~ 2024-01-28)</td>
                                    <td>1,700</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI2월">
                        <h2>2024년 2월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 7,500개</p>
                            <p>평균 생산량: 1,875개/주</p>
                            <p>최고 생산 주: 2주차 (2,300개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-02-01 ~ 2024-02-07)</td>
                                    <td>1,700</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-02-08 ~ 2024-02-14)</td>
                                    <td>2,300</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-02-15 ~ 2024-02-21)</td>
                                    <td>2,000</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-02-22 ~ 2024-02-28)</td>
                                    <td>1,500</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI3월">
                        <h2>2024년 3월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 9,000개</p>
                            <p>평균 생산량: 2,250개/주</p>
                            <p>최고 생산 주: 4주차 (2,600개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-03-01 ~ 2024-03-07)</td>
                                    <td>2,200</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-03-08 ~ 2024-03-14)</td>
                                    <td>2,000</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-03-15 ~ 2024-03-21)</td>
                                    <td>2,200</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-03-22 ~ 2024-03-28)</td>
                                    <td>2,600</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI4월">
                        <h2>2024년 4월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 9,200개</p>
                            <p>평균 생산량: 2,300개/주</p>
                            <p>최고 생산 주: 3주차 (2,500개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-04-01 ~ 2024-04-07)</td>
                                    <td>2,200</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-04-08 ~ 2024-04-14)</td>
                                    <td>2,300</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-04-15 ~ 2024-04-21)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-04-22 ~ 2024-04-28)</td>
                                    <td>2,200</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI5월">
                        <h2>2024년 5월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 9,500개</p>
                            <p>평균 생산량: 2,375개/주</p>
                            <p>최고 생산 주: 2주차 (2,600개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-05-01 ~ 2024-05-07)</td>
                                    <td>2,300</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-05-08 ~ 2024-05-14)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-05-15 ~ 2024-05-21)</td>
                                    <td>2,300</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-05-22 ~ 2024-05-28)</td>
                                    <td>2,300</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI6월">
                        <h2>2024년 6월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 9,800개</p>
                            <p>평균 생산량: 2,450개/주</p>
                            <p>최고 생산 주: 1주차 (2,600개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-06-01 ~ 2024-06-07)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-06-08 ~ 2024-06-14)</td>
                                    <td>2,400</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-06-15 ~ 2024-06-21)</td>
                                    <td>2,400</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-06-22 ~ 2024-06-28)</td>
                                    <td>2,400</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI7월">
                        <h2>2024년 7월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 10,000개</p>
                            <p>평균 생산량: 2,500개/주</p>
                            <p>최고 생산 주: 2주차 (2,800개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-07-01 ~ 2024-07-07)</td>
                                    <td>2,200</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-07-08 ~ 2024-07-14)</td>
                                    <td>2,800</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-07-15 ~ 2024-07-21)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-07-22 ~ 2024-07-28)</td>
                                    <td>2,500</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI8월">
                        <h2>2024년 8월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 10,200개</p>
                            <p>평균 생산량: 2,550개/주</p>
                            <p>최고 생산 주: 1주차 (2,700개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-08-01 ~ 2024-08-07)</td>
                                    <td>2,700</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-08-08 ~ 2024-08-14)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-08-15 ~ 2024-08-21)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-08-22 ~ 2024-08-28)</td>
                                    <td>2,500</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI9월">
                        <h2>2024년 9월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 9,600개</p>
                            <p>평균 생산량: 2,400개/주</p>
                            <p>최고 생산 주: 4주차 (2,500개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-09-01 ~ 2024-09-07)</td>
                                    <td>2,300</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-09-08 ~ 2024-09-14)</td>
                                    <td>2,400</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-09-15 ~ 2024-09-21)</td>
                                    <td>2,400</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-09-22 ~ 2024-09-28)</td>
                                    <td>2,500</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI10월">
                        <h2>2024년 10월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 10,500개</p>
                            <p>평균 생산량: 2,625개/주</p>
                            <p>최고 생산 주: 3주차 (2,700개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-10-01 ~ 2024-10-07)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-10-08 ~ 2024-10-14)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-10-15 ~ 2024-10-21)</td>
                                    <td>2,700</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-10-22 ~ 2024-10-28)</td>
                                    <td>2,700</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI11월">
                        <h2>2024년 11월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 10,300개</p>
                            <p>평균 생산량: 2,575개/주</p>
                            <p>최고 생산 주: 2주차 (2,600개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-11-01 ~ 2024-11-07)</td>
                                    <td>2,500</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-11-08 ~ 2024-11-14)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-11-15 ~ 2024-11-21)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-11-22 ~ 2024-11-28)</td>
                                    <td>2,600</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="tableID tableHI monthHI12월">
                        <h2>2024년 12월</h2>
                        <div class="summary">
                            <h2>요약</h2>
                            <p>이번 달 총 생산량: 10,700개</p>
                            <p>평균 생산량: 2,675개/주</p>
                            <p>최고 생산 주: 1주차 (2,700개)</p>
                        </div>
                        <table>
                            <thead>
                                <tr>
                                    <th>주</th>
                                    <th>생산량</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1주차 (2024-12-01 ~ 2024-12-07)</td>
                                    <td>2,700</td>
                                </tr>
                                <tr>
                                    <td>2주차 (2024-12-08 ~ 2024-12-14)</td>
                                    <td>2,600</td>
                                </tr>
                                <tr>
                                    <td>3주차 (2024-12-15 ~ 2024-12-21)</td>
                                    <td>2,700</td>
                                </tr>
                                <tr>
                                    <td>4주차 (2024-12-22 ~ 2024-12-28)</td>
                                    <td>2,700</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>
        <hr>
        <div class="pagenum">
            <a id="a1" href="">1</a>
            <a href="">2</a>
            <a href="">3</a>
            <a href="">4</a>
            <a href="">5</a>
            <a href="">6</a>
            <a href="">7</a>
        </div>

    </div>

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/proper.js"></script>

</html>