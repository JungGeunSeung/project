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
    <link rel="stylesheet" href="sidebar.css">
    <link rel="stylesheet" href="topbar.css">
    <link rel="stylesheet" href="calender.css">
    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="display.css">
    <link rel="stylesheet" href="table.css">
    <link rel="stylesheet" href="button.css">
    <title>소원을 들어주는 MES</title>
    <style>

    </style>

</head>

<body>
    <!-- 사이드바 -->
    <div class="sidebar">
        <a href="/project_kwon/test/html/main.html">
            <img class="Logo"
                src="https://cdn.discordapp.com/attachments/1263407024335491114/1265561412386816092/a43c6d2305345130.png?ex=66a1f569&is=66a0a3e9&hm=5b7f362c0fa64ddee21e4a2ae3f155f521b55fcaf876820eb06e9a9fcd6b19ca&"
                alt=""></a>


        <div class="profile">
            <img src="https://cdn.discordapp.com/attachments/1263407024335491114/1264860101810851900/images.jpeg?ex=66a16284&is=66a01104&hm=721e2a3042a0e936a94836366e7280d55f677a886e7b0d4499fccaacfdc1d1a6&"
                alt="프로필 사진">
            <h2>정근승</h2>
            <p>대표이사</p>

            <div>
                <input type="button" value="마이페이지">
                <input type="button" value="관리자페이지">
            </div>
        </div>

        <div class="cal_kwon">
            <div id="calendar"></div>
            <script src="calendar_nomall.js"></script>
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
                            <li><a href="BOM_BOM.html">BOM</a></li>
                            <li><a href="BOM_설비코드.html">설비코드</a></li>
                            <li><a href="#">조직도</a></li>
                            <li><a href="BOM-문서관리.html">BOM문서관리(양식서)</a></li>
                        </ul>
                    </div>
                </li>
                <li class="menu-item">
                    <a href="#">재고관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">자재입출고(자재관리)</a></li>
                            <li><a href="#">재고관리</a></li>
                            <li><a href="#">저장위치(MAP)</a></li>
                        </ul>
                    </div>
                </li>
                
                <li class="menu-item">
                    <a href="#">품질관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">제품별 시험항목/품질기준</a></li>
                            <li><a href="#">생산겸사현황</a></li>
                            <li><a href="#">검사현황</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item">
                    <a href="#">생산관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="">생산계획목록</a></li>
                            <li><a href="">작업지시목록</a></li>
                            <li><a href="">생산실적</a></li>
                        </ul>
                    </div>
                </li>

                <li class="menu-item">
                    <a href="#">설비관리</a>
                    <div class="submenu">
                        <ul>
                            <li><a href="#">공정별설비관리/수리보고서</a></li>
                            <li><a href="#">설비고장/수리이력</a></li>
                            <li><a href="#">비가동이력</a></li>
                        </ul>
                    </div>
                </li>

            </ul>
        </div>
        <hr>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 검색어를 통해 검색할수 있는 input -->
            <input type="text" class="search"><button class="searchbtn">검색</button>
            <!-- 해당 페이지의 제목 -->
            <h1>생산 검사 현황</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>생산계획서를 조회</span> <br>
            </div>
            <!-- 게시물의 개수를 표시할 select -->
             <div class="cntdiv">
                <span>게시물</span>
                <select name="cnt" id="cnt">
                    <option value="1">10개씩</option>
                    <option value="2">20개씩</option>
                    <option value="3">30개씩</option>
                    <option value="4">40개씩</option>
                    <option value="5">50개씩</option>
                </select>
                <!-- 검색조건을 바꿀 select -->
                <div>
                    <div class="divbtn">
                        <button class="btn" onclick="showAllRows()">전체</button>
                        <button class="btn" onclick="filterByStatus('초')">생산 초</button>
                        <button class="btn" onclick="filterByStatus('중')">생산 중</button>
                        <button class="btn" onclick="filterByStatus('종')">생산 종</button>
                        <button class="btn" onclick="filterByStatus('합격')">합격</button>
                        <button class="btn" onclick="filterByStatus('불합격')">불합격</button>
                    </div>
                    <div>
                    <span>날짜별 조회</span>
                    <input type="date" id="startdate"> ~ <input type="date" id="enddate">
                    <button class="btn">검색</button>
                    </div>
                </div> 

            </div>
        </div>

        <!-- 해당 목록 -->
        <div class="tableID">
            <table>
                <thead>
                  <tr>
                    <th>선택</th>
                    <th>품질기준 시험항목</th>
                    <th>번호</th>
                    <th>문서번호</th>
                    <th>문서명</th>
                    <th>작성자</th>
                    <th>생산상태</th>
                    <th>검사날짜</th>
                    <th>관리자</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>32mm소켓</td>
                    <td>1</td>
                    <td>KS0012</td>
                    <td>KS표준인증</td>
                    <td>김소원</td>
                    <td>초</td>
                    <td>2024-07-02</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x63mm 태핑티</td>
                    <td>2</td>
                    <td>KE0022</td>
                    <td>KE인증기관</td>
                    <td>정다올</td>
                    <td>중</td>
                    <td>2024-07-05</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>110mm 앤드캡</td>
                    <td>3</td>
                    <td>KCS0033</td>
                    <td>KCS 인증</td>
                    <td>권대호</td>
                    <td>종</td>
                    <td>2024-07-10</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x90 이경티</td>
                    <td>4</td>
                    <td>GES0048</td>
                    <td>GES 인증</td>
                    <td>정근승</td>
                    <td>초</td>
                    <td>2024-07-12</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x90 이경티</td>
                    <td>5</td>
                    <td>GES0049</td>
                    <td>GES 인증</td>
                    <td>정근승</td>
                    <td>중</td>
                    <td>2024-07-15</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>110mm 앤드캡</td>
                    <td>6</td>
                    <td>KCS0034</td>
                    <td>KCS 인증</td>
                    <td>권대호</td>
                    <td>종</td>
                    <td>2024-07-18</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>32mm소켓</td>
                    <td>7</td>
                    <td>KS0013</td>
                    <td>KS표준인증</td>
                    <td>김소원</td>
                    <td>초</td>
                    <td>2024-07-20</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>110mm 앤드캡</td>
                    <td>8</td>
                    <td>KCS0035</td>
                    <td>KCS 인증</td>
                    <td>권대호</td>
                    <td>중</td>
                    <td>2024-07-22</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x63mm 태핑티</td>
                    <td>9</td>
                    <td>KE0023</td>
                    <td>KE인증기관</td>
                    <td>정다올</td>
                    <td>종</td>
                    <td>2024-07-24</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x63mm 태핑티</td>
                    <td>10</td>
                    <td>KE0024</td>
                    <td>KE인증기관</td>
                    <td>정다올</td>
                    <td>중</td>
                    <td>2024-07-25</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>110mm 앤드캡</td>
                    <td>11</td>
                    <td>KCS0036</td>
                    <td>KCS 인증</td>
                    <td>권대호</td>
                    <td>초</td>
                    <td>2024-07-26</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x90 이경티</td>
                    <td>12</td>
                    <td>GES0050</td>
                    <td>GES 인증</td>
                    <td>정근승</td>
                    <td>종</td>
                    <td>2024-07-27</td>
                    <td>최민수</td>
                  </tr>
                  <tr>
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>32mm소켓</td>
                    <td>13</td>
                    <td>KS0014</td>
                    <td>KS표준인증</td>
                    <td>김소원</td>
                    <td>중</td>
                    <td>2024-07-28</td>
                    <td>최민수</td>
                  </tr>
                  <tr class="tabletest">
                    <td><input type="checkbox" id="tablechk"></td>
                    <td>160x90 이경티</td>
                    <td>14</td>
                    <td>GES0051</td>
                    <td>GES 인증</td>
                    <td>정근승</td>
                    <td>초</td>
                    <td>2024-07-29</td>
                    <td>최민수</td>
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
    <script src="calendar_nomall.js"></script>
    <script src="sort.js"></script>
    <script src="date.js"></script>
    <script src="button.js"></script>
    <script src="sort.js"></script>
    <script src="date.js"></script>
</html>