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
    <title>소원을 들어주는 MES</title>
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
            <h1>생산계획 목록</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>작업지시서 목록</span> <br>
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
                        <th>번호</th>
                        <th>작업명</th>
                        <th>시작일</th>
                        <th>완료일</th>
                        <th>상태</th>
                        <th>담당자</th>
                        <th>승인자</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>1</td>
                        <td>PVC 파이프 제작</td>
                        <td>2024-07-01</td>
                        <td>2024-07-05</td>
                        <td>완료</td>
                        <td>박경민</td>
                        <td>정근승</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>2</td>
                        <td>T형 조인트 제작</td>
                        <td>2024-07-06</td>
                        <td>2024-07-10</td>
                        <td>진행중</td>
                        <td>김승환</td>
                        <td>권대호</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>3</td>
                        <td>90도 엘보 제작</td>
                        <td>2024-07-11</td>
                        <td>2024-07-15</td>
                        <td>대기</td>
                        <td>최영준</td>
                        <td>김소원</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>4</td>
                        <td>소켓 제작</td>
                        <td>2024-07-16</td>
                        <td>2024-07-20</td>
                        <td>진행중</td>
                        <td>서수찬</td>
                        <td>정다올</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>5</td>
                        <td>레듀샤 제작</td>
                        <td>2024-07-21</td>
                        <td>2024-07-25</td>
                        <td>완료</td>
                        <td>조민정</td>
                        <td>정근승</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>6</td>
                        <td>이경T 제작</td>
                        <td>2024-07-26</td>
                        <td>2024-07-30</td>
                        <td>대기</td>
                        <td>김수현</td>
                        <td>권대호</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>7</td>
                        <td>파이프 엔드 제작</td>
                        <td>2024-08-01</td>
                        <td>2024-08-05</td>
                        <td>진행중</td>
                        <td>강희연</td>
                        <td>김소원</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>8</td>
                        <td>발수소켓(암) 제작</td>
                        <td>2024-08-06</td>
                        <td>2024-08-10</td>
                        <td>완료</td>
                        <td>김진홍</td>
                        <td>정다올</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>9</td>
                        <td>발수소켓(수) 제작</td>
                        <td>2024-08-11</td>
                        <td>2024-08-15</td>
                        <td>대기</td>
                        <td>김소원</td>
                        <td>정근승</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>10</td>
                        <td>테핑티 제작</td>
                        <td>2024-08-16</td>
                        <td>2024-08-20</td>
                        <td>진행중</td>
                        <td>권대호</td>
                        <td>권대호</td>
                        <td></td>
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
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
<script src="/mes/JavaScript/table.js"></script>

</html>