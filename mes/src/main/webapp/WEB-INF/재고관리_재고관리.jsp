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
   <!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
        <!-- 메인메뉴 아래 정보가 표시될 영역 -->
        <div class="searchID">
            <!-- 해당 페이지의 제목 -->
            <h1>재고관리 목록</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>상품의 재고를 기준에 따라 조회하고 정렬해서 관리하는 페이지</span> <br>
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
                <!-- 정렬기준을 바꿀 select -->                
                <div>
                    <button onclick="delchk()" class="btn Lbtn">선택된 열 삭제</button>
                    <span>날짜별 조회</span>
                    <input type="date"> ~ <input type="date" value=>

                </div> 

            </div>
        </div>

        <!-- 해당 목록 -->
        <div class="tableID">
            <table>
                <thead>
                    <tr>
                        <th><input type="checkbox" id="allchk"></th>
                        <th>정보 품명</th>
                        <th>Lot번호</th>
                        <th>제품 타입</th>
                        <th>규격(mm)</th>
                        <th>LOT 규격</th>
                        <th>생성날짜</th>
                        <th>생산일자</th>
                        <th>위치</th>
                        <th>수량(EA)</th>
                        <th>출고 예정 날짜</th>
                        <th>검사자</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>P</td>
                        <td>100</td>
                        <td>300</td>
                        <td>300 mm</td>
                        <td>300 mm</td>
                        <td>2024-06-23</td>
                        <td>2024-06-24</td>
                        <td>1창고A구역</td>
                        <td>50</td>
                        <td>2024-07-22</td>
                        <td>김소원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>T</td>
                        <td>100</td>
                        <td>450</td>
                        <td>450 mm</td>
                        <td>450 mm</td>
                        <td>2024-06-23</td>
                        <td>2024-06-23</td>
                        <td>1창고B구역</td>
                        <td>300</td>
                        <td>2024-07-22</td>
                        <td>김소원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>L</td>
                        <td>100</td>
                        <td>50</td>
                        <td>50 mm</td>
                        <td>50 mm</td>
                        <td>2024-06-24</td>
                        <td>2024-06-23</td>
                        <td>1창고B구역</td>
                        <td>450</td>
                        <td>2024-07-23</td>
                        <td>김소원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>R</td>
                        <td>100 to 80</td>
                        <td>200</td>
                        <td>200 mm</td>
                        <td>200 mm</td>
                        <td>2024-06-25</td>
                        <td>2024-07-12</td>
                        <td>1창고B구역</td>
                        <td>350</td>
                        <td>2024-07-26</td>
                        <td>정다올</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>B</td>
                        <td>200</td>
                        <td>150</td>
                        <td>150 mm</td>
                        <td>150 mm</td>
                        <td>2024-06-25</td>
                        <td>2024-07-14</td>
                        <td>1창고C구역</td>
                        <td>400</td>
                        <td>2024-07-26</td>
                        <td>권대호</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>N</td>
                        <td>900</td>
                        <td>340</td>
                        <td>340 mm</td>
                        <td>340 mm</td>
                        <td>2024-06-26</td>
                        <td>2024-07-15</td>
                        <td>1창고C구역</td>
                        <td>500</td>
                        <td>2024-07-29</td>
                        <td>권대호</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>F</td>
                        <td>800</td>
                        <td>550</td>
                        <td>550 mm</td>
                        <td>550 mm</td>
                        <td>2024-06-26</td>
                        <td>2024-07-20</td>
                        <td>1창고D구역</td>
                        <td>550</td>
                        <td>2024-07-29</td>
                        <td>정다올</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>J</td>
                        <td>700</td>
                        <td>670</td>
                        <td>670 mm</td>
                        <td>670 mm</td>
                        <td>2024-06-27</td>
                        <td>2024-07-25</td>
                        <td>1창고E구역</td>
                        <td>800</td>
                        <td>2024-07-30</td>
                        <td>정근승</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>K</td>
                        <td>500</td>
                        <td>70</td>
                        <td>70 mm</td>
                        <td>70 mm</td>
                        <td>2024-06-27</td>
                        <td>2024-07-26</td>
                        <td>1창고E구역</td>
                        <td>400</td>
                        <td>2024-07-30</td>
                        <td>정근승</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>Y</td>
                        <td>70</td>
                        <td>910</td>
                        <td>910 mm</td>
                        <td>910 mm</td>
                        <td>2024-06-28</td>
                        <td>2024-07-27</td>
                        <td>1창고F구역</td>
                        <td>600</td>
                        <td>2024-07-31</td>
                        <td>정다올</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>I</td>
                        <td>90</td>
                        <td>80</td>
                        <td>80 mm</td>
                        <td>80 mm</td>
                        <td>2024-06-29</td>
                        <td>2024-07-30</td>
                        <td>1창고E구역</td>
                        <td>650</td>
                        <td>2024-07-31</td>
                        <td>정다올</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>O</td>
                        <td>100</td>
                        <td>250</td>
                        <td>250 mm</td>
                        <td>250 mm</td>
                        <td>2024-06-30</td>
                        <td>2024-07-31</td>
                        <td>1창고B구역</td>
                        <td>750</td>
                        <td>2024-08-01</td>
                        <td>권대호</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>W</td>
                        <td>300</td>
                        <td>400</td>
                        <td>400 mm</td>
                        <td>400 mm</td>
                        <td>2024-06-30</td>
                        <td>2024-08-01</td>
                        <td>1창고C구역</td>
                        <td>600</td>
                        <td>2024-08-01</td>
                        <td>김소원</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>H</td>
                        <td>400</td>
                        <td>250</td>
                        <td>250 mm</td>
                        <td>250 mm</td>
                        <td>2024-06-30</td>
                        <td>2024-08-02</td>
                        <td>1창고C구역</td>
                        <td>800</td>
                        <td>2024-07-31</td>
                        <td>정다올</td>
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
</html>