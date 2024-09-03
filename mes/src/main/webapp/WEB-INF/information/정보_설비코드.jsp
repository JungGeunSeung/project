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
    <jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
    <!-- 	상단바 -->
    <jsp:include page="/WEB-INF/assetsform/topbar.jsp" />
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