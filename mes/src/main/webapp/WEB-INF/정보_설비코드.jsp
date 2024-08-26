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
            <h1>설비코드</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>회사에 있는 설비를 코드화 해서 조회하는 페이지입니다.</span> <br>
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
                    <th>설비사진</th>
                    <th>설비명</th>
                    <th>설비설명</th>
                    <th>설비코드</th>
                    <th>구입날짜</th>
                    <th>최근 수리/점검 일자</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>사출장치</td>
                    <td>설명서.pdf</td>
                    <td>AC2055</td>
                    <td>02-01-31</td>
                    <td>22-09-21</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>사출장치</td>
                    <td>설명서.pdf</td>
                    <td>BD2645</td>
                    <td>02-05-04</td>
                    <td>22-09-30</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>사출장치</td>
                    <td>설명서.pdf</td>
                    <td>GD6823</td>
                    <td>02-08-30</td>
                    <td>22-10-05</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>후 처리 장치</td>
                    <td>설명서.pdf</td>
                    <td>FE8562</td>
                    <td>03-05-07</td>
                    <td>22-10-15</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>재단장치</td>
                    <td>설명서.pdf</td>
                    <td>SG5871</td>
                    <td>03-11-04</td>
                    <td>22-11-14</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>공조장치</td>
                    <td>설명서.pdf</td>
                    <td>TD2245</td>
                    <td>04-03-15</td>
                    <td>22-11-30</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>공조장치</td>
                    <td>설명서.pdf</td>
                    <td>SF6587</td>
                    <td>04-06-25</td>
                    <td>22-12-06</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>재단장치</td>
                    <td>설명서.pdf</td>
                    <td>US3412</td>
                    <td>05-07-31</td>
                    <td>22-12-31</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>후 처리 장치</td>
                    <td>설명서.pdf</td>
                    <td>EH6352</td>
                    <td>05-12-31</td>
                    <td>23-01-05</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>후 처리 장치</td>
                    <td>설명서.pdf</td>
                    <td>UG31455</td>
                    <td>06-02-26</td>
                    <td>23-04-13</td>
                  </tr>
                  <tr> 
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>사출장치</td>
                    <td>설명서.pdf</td>
                    <td>UH2365</td>
                    <td>06-09-18</td>
                    <td>23-05-06</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>공조장치</td>
                    <td>설명서.pdf</td>
                    <td>OG0357</td>
                    <td>07-11-18</td>
                    <td>23-06-08</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>후 처리 장치</td>
                    <td>설명서.pdf</td>
                    <td>PS5874</td>
                    <td>08-04-28</td>
                    <td>23-07-15</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>img</td>
                    <td>사출장치</td>
                    <td>설명서.pdf</td>
                    <td>GM6473</td>
                    <td>09-08-29</td>
                    <td>23-08-24</td>
                  </tr>
                </tbody>
              </table>
              
        </div>
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

</body>
<script src="/mes/JavaScript/sort.js"></script>
<script src="/mes/JavaScript/date.js"></script>
<script src="/mes/JavaScript/button.js"></script>
<script src="/mes/JavaScript/table.js"></script>
</html>