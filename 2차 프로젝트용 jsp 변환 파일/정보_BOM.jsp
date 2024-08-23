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
    <link rel="stylesheet" href="/project_second/assets/CSS/button.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/calender.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/common.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/display.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/mobile.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/sidebar.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/table.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/topbar.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/게시판.css">
    <link rel="stylesheet" href="/project_second/assets/CSS/mobile.css">
    <script src="/project_second/assets/JavaScript/load_info.js"></script>
    <title>소원을 들어주는 MES</title>
</head>

<body>
    <!-- 사이드바 -->
    <div class="sidebar">
        <a href="main.html">
            <img class="Logo"
                src="/project_second/assets/Image/로고.png"
                alt=""></a>


        <div class="profile" id="bos">
            <img src="/project_second/assets/Image/정근승.png"
                alt="프로필 사진">
            <h2>정근승</h2>
            <p>대표이사</p>
            <input type="button" value="로그아웃" class="btn" onclick="location.href='login.html'">

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="관리자페이지" class="btn" onclick="location.href='관리자.html'">
            </div>
        </div>

        <div class="profile" id="kwon">
            <img src="/project_second/assets/Image/권대호.png"
                alt="프로필 사진">
            <h2>권대호</h2>
            <p>상무</p>
            <input type="button" value="로그아웃" class="btn" onclick="location.href='login.html'">

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="관리자페이지" class="btn" onclick="location.href='관리자.html'">
            </div>
        </div>

        <div class="profile" id="daall">
            <img src="/project_second/assets/Image/정다올.png"
                alt="프로필 사진">
            <h2>정다올</h2>
            <p>생산관리팀 부장</p>

            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="로그아웃" class="btn" onclick="location.href='login.html'">
            </div>
        </div>

        <div class="profile" id="sowon">
            <img src="/project_second/assets/Image/김소원.png"
                alt="프로필 사진">
            <h2>김소원</h2>
            <p>생산팀 부장</p>
            
            <div class="profile_btn">
                <input type="button" value="마이페이지" class="btn">
                <input type="button" value="로그아웃" class="btn" onclick="location.href='login.html'">
            </div>
        </div>




        <div class="cal_kwon">
            <div id="calendar"></div>
            <script src="/project_second/assets/JavaScript/calendar_nomall.js"></script>
        </div>

        <h3>열어본 페이지 목록</h3>
        <ul>
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
                            <li><a href="정보_BOM.html">BOM</a></li>
                            <li class="manager"><a href="정보_설비코드.html">설비코드</a></li>
                            <li><a href="정보_조직도.html">조직도</a></li>
                            <li><a href="정보_BOM문서관리(양식서).html">BOM문서관리(양식서)</a></li>
                        </ul>
                    </div>
                </li>
                <li class="menu-item">
                    <a href="#">재고관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="재고관리_자재입출고관리(자재관리).html">자재입출고(자재관리)</a></li>
                            <li class="manager"><a href="재고관리_재고관리.html">재고관리</a></li>
                            <li><a href="재고관리_저장위치(map).html">저장위치(MAP)</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item manager">
                    <a href="#">품질관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="품질관리_시험항목_품질기준.html">제품별 시험항목/품질기준</a></li>
                            <li><a href="품질관리_생산검사현황.html">생산검사현황</a></li>
                            <li><a href="품질관리_검사현황.html">검사현황</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item">
                    <a href="#">생산관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="생산관리_생산계획목록.html">생산계획목록</a></li>
                            <li><a href="생산관리_작업지시서목록.html">작업지시목록</a></li>
                            <li><a href="생산관리_생산실적.html">생산실적</a></li>
                            <li><a href="생산관리_생산실적보고서.html">생산실적보고서</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item manager">
                    <a href="#">설비관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="설비관리_공정별설비관리.html">공정별설비관리/수리보고서</a></li>
                            <li><a href="설비관리_설비고장_수리이력.html">설비고장/수리이력</a></li>
                            <li><a href="설비관리_비가동이력.html">비가동이력</a></li>
                        </ul>
                    </div>
                </li>
            </ul>

        </div>
        <hr>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1>BOM</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>제품의 BOM을 조회하는 페이지입니다.</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
             <div class="cntdiv">
                <span>게시물</span>
                 <select name="cnt" id="cnt" onchange="cps()">
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
        <div class="tableID">
                <table>
                    <thead>
                    <tr><th><input type="checkbox" id="allchk"></th><th>제품코드</th><th>제품명</th><th>규격(mm)</th><th>단가</th><th>사용원료</th><th>원료규격</th><th>단위(kg)</th><th>사용금형</th><th>사용 전선</th><th>사출시간</th><th>품질기준</th></tr>
                    </thead>
                    <tbody>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL4563</td><td>E/F 45도 엘보</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>12.3</td><td>LSF006</td><td>0.3mm 구리</td><td>920</td><td>KAB품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL4575</td><td>E/F 45도 엘보</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>10.9</td><td>LSF007</td><td>0.3mm 구리</td><td>1100</td><td>KC품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL4590</td><td>E/F 45도 엘보</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF008</td><td>0.3mm 구리</td><td>1200</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL45110</td><td>E/F 45도 엘보</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>6.6</td><td>LSF009</td><td>0.3mm 구리</td><td>1430</td><td>NSF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL45125</td><td>E/F 45도 엘보</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>4.8</td><td>LSF010</td><td>0.3mm 구리</td><td>1500</td><td>KR품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL45140</td><td>E/F 45도 엘보</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>2.9</td><td>LSF011</td><td>0.3mm 구리</td><td>1600</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL45160</td><td>E/F 45도 엘보</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>0.5</td><td>LSF012</td><td>0.3mm 구리</td><td>2100</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL9063</td><td>E/F 90도 엘보</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>12.3</td><td>LSF023</td><td>0.3mm 구리</td><td>920</td><td>FM품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL9075</td><td>E/F 90도 엘보</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>10.9</td><td>LSF024</td><td>0.3mm 구리</td><td>1100</td><td>IAF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL9090</td><td>E/F 90도 엘보</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF025</td><td>0.3mm 구리</td><td>1200</td><td>KAB품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL90110</td><td>E/F 90도 엘보</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>6.6</td><td>LSF026</td><td>0.4mm 구리</td><td>1430</td><td>KR품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL90125</td><td>E/F 90도 엘보</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>4.8</td><td>LSF027</td><td>0.4mm 구리</td><td>1500</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL90140</td><td>E/F 90도 엘보</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>2.9</td><td>LSF028</td><td>0.4mm 구리</td><td>1600</td><td>FM품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EL90160</td><td>E/F 90도 엘보</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>0.5</td><td>LSF029</td><td>0.4mm 구리</td><td>2100</td><td>KSA품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK63</td><td>E/F 소켓</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>12.3</td><td>LSF040</td><td>0.3mm 구리</td><td>920</td><td>TUV품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK75</td><td>E/F 소켓</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>10.9</td><td>LSF041</td><td>0.3mm 구리</td><td>1100</td><td>CE품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK90</td><td>E/F 소켓</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF042</td><td>0.3mm 구리</td><td>1200</td><td>FM품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK110</td><td>E/F 소켓</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>10.0</td><td>LSF043</td><td>0.4mm 구리</td><td>1430</td><td>CE품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK125</td><td>E/F 소켓</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>12.0</td><td>LSF044</td><td>0.4mm 구리</td><td>1500</td><td>TUV품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK140</td><td>E/F 소켓</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>14.0</td><td>LSF045</td><td>0.4mm 구리</td><td>1600</td><td>NSF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>SK160</td><td>E/F 소켓</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>16.0</td><td>LSF046</td><td>0.4mm 구리</td><td>2100</td><td>KC품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC63</td><td>E/F 앤드캡</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>5.0</td><td>LSF057</td><td>0.3mm 구리</td><td>920</td><td>IAF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC75</td><td>E/F 앤드캡</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>7.0</td><td>LSF058</td><td>0.3mm 구리</td><td>1100</td><td>KAB품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC90</td><td>E/F 앤드캡</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF059</td><td>0.3mm 구리</td><td>1200</td><td>KSA품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC110</td><td>E/F 앤드캡</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>10.0</td><td>LSF060</td><td>0.4mm 구리</td><td>1430</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC125</td><td>E/F 앤드캡</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>12.0</td><td>LSF061</td><td>0.4mm 구리</td><td>1500</td><td>FM품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC140</td><td>E/F 앤드캡</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>14.0</td><td>LSF062</td><td>0.4mm 구리</td><td>1600</td><td>KR품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>EC160</td><td>E/F 앤드캡</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>16.0</td><td>LSF063</td><td>0.4mm 구리</td><td>2100</td><td>CE품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC63</td><td>E/F 레듀사</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>5.0</td><td>LSF074</td><td>0.3mm 구리</td><td>920</td><td>NSF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC75</td><td>E/F 레듀사</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>7.0</td><td>LSF075</td><td>0.3mm 구리</td><td>1100</td><td>TUV품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC90</td><td>E/F 레듀사</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF076</td><td>0.3mm 구리</td><td>1200</td><td>KC품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC110</td><td>E/F 레듀사</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>10.0</td><td>LSF077</td><td>0.4mm 구리</td><td>1430</td><td>IAF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC125</td><td>E/F 레듀사</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>12.0</td><td>LSF078</td><td>0.4mm 구리</td><td>1500</td><td>KAB품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC140</td><td>E/F 레듀사</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>14.0</td><td>LSF079</td><td>0.4mm 구리</td><td>1600</td><td>KSA품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>RC160</td><td>E/F 레듀사</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>16.0</td><td>LSF080</td><td>0.4mm 구리</td><td>2100</td><td>ISO품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET63</td><td>E/F 티</td><td>63</td><td>28000</td><td>E298749</td><td>PE100</td><td>5.0</td><td>LSF091</td><td>0.3mm 구리</td><td>920</td><td>FM품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET75</td><td>E/F 티</td><td>75</td><td>30000</td><td>E298749</td><td>PE100</td><td>7.0</td><td>LSF092</td><td>0.3mm 구리</td><td>1100</td><td>KR품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET90</td><td>E/F 티</td><td>90</td><td>32000</td><td>E298749</td><td>PE100</td><td>9.0</td><td>LSF093</td><td>0.3mm 구리</td><td>1200</td><td>CE품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET110</td><td>E/F 티</td><td>110</td><td>45000</td><td>E298749</td><td>PE100</td><td>10.0</td><td>LSF094</td><td>0.4mm 구리</td><td>1430</td><td>NSF품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET125</td><td>E/F 티</td><td>125</td><td>55000</td><td>E298749</td><td>PE100</td><td>12.0</td><td>LSF095</td><td>0.4mm 구리</td><td>1500</td><td>TUV품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET140</td><td>E/F 티</td><td>140</td><td>67000</td><td>E298749</td><td>PE100</td><td>14.0</td><td>LSF096</td><td>0.4mm 구리</td><td>1600</td><td>KC품질기준</td></tr>
                    <tr><td><input type="checkbox" id="tablechk"></td><td>ET160</td><td>E/F 티</td><td>160</td><td>81000</td><td>E298749</td><td>PE100</td><td>16.0</td><td>LSF097</td><td>0.4mm 구리</td><td>2100</td><td>IAF품질기준</td></tr>
                    </tbody>
                </table>
        <div>
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

    </div>

    <script src="/project_second/assets/JavaScript/table.js"></script>
    <script src="/project_second/assets/JavaScript/sort.js"></script>
    <script src="/project_second/assets/JavaScript/date.js"></script>
    <script src="/project_second/assets/JavaScript/button.js"></script>
</body>
</html>