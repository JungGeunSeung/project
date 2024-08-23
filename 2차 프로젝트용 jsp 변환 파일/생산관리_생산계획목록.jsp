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
            <h1>생산계획 목록</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>생산계획서를 한번에 조회하는 페이지입니다.</span> <br>
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
        <div class="tableID">
            <table>
                <thead>
                <tr>
                    <th><input type="checkbox" id="allchk"></th>
                    <th>순위</th>
                    <th>계획날짜</th>
                    <th>제품명</th>
                    <th>원료</th>
                    <th>현 재고</th>
                    <th>계획 수량</th>
                    <th>단가</th>
                    <th>발주처</th>
                    <th>작업위치</th>
                    <th>작성자</th>
                    <th>승인자</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>1</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Soket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>12호기,13호기,14호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>1</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Soket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>12호기,13호기,14호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>1</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Socket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>12호기, 13호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>3</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Socket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>11호기, 12호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>3</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Socket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>10호기, 13호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>1</td>
                    <td>24.07.31</td>
                    <td>EF 63mm Socket</td>
                    <td>E839123</td>
                    <td>1,603</td>
                    <td>5,000</td>
                    <td>32,000</td>
                    <td>(주)휴먼</td>
                    <td>12호기, 14호기</td>
                    <td>정다올</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>1</td>
                    <td>24.07.31</td>
                    <td>EF 32mm Socket</td>
                    <td>E839124</td>
                    <td>1,200</td>
                    <td>4,000</td>
                    <td>30,000</td>
                    <td>(주)휴먼</td>
                    <td>1호기, 2호기</td>
                    <td>박경민</td>
                    <td><a href="">정다올</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>2</td>
                    <td>24.08.01</td>
                    <td>EF 45° Elbow 50mm</td>
                    <td>E839125</td>
                    <td>900</td>
                    <td>3,000</td>
                    <td>28,000</td>
                    <td>(주)하나</td>
                    <td>3호기, 4호기</td>
                    <td>최영준</td>
                    <td><a href="">김소원</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>2</td>
                    <td>24.08.02</td>
                    <td>EF 90° Elbow 75mm</td>
                    <td>E839126</td>
                    <td>600</td>
                    <td>2,500</td>
                    <td>35,000</td>
                    <td>(주)국제</td>
                    <td>5호기, 6호기</td>
                    <td>서수찬</td>
                    <td><a href="">권대호</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>3</td>
                    <td>24.08.03</td>
                    <td>EF 110mm Pipe</td>
                    <td>E839127</td>
                    <td>1,500</td>
                    <td>6,000</td>
                    <td>40,000</td>
                    <td>(주)대한</td>
                    <td>7호기, 8호기</td>
                    <td>김승환</td>
                    <td><a href="">정근승</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>2</td>
                    <td>24.08.04</td>
                    <td>EF 140mm End Cap</td>
                    <td>E839128</td>
                    <td>700</td>
                    <td>2,000</td>
                    <td>50,000</td>
                    <td>(주)휴먼</td>
                    <td>9호기, 10호기</td>
                    <td>조민정</td>
                    <td><a href="">김소원</a></td>
                </tr>
                <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>4</td>
                    <td>24.08.05</td>
                    <td>EF 160mm Pipe</td>
                    <td>E839129</td>
                    <td>800</td>
                    <td>3,500</td>
                    <td>55,000</td>
                    <td>(주)하나</td>
                    <td>11호기, 12호기</td>
                    <td>김성령</td>
                    <td><a href="">정다올</a></td>
                </tr>
            </tbody>
            </table>
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
    <script src="/project_second/assets/JavaScript/sort.js"></script>
    <script src="/project_second/assets/JavaScript/date.js"></script>
    <script src="/project_second/assets/JavaScript/button.js"></script>
</html>