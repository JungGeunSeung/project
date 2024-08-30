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
	<jsp:include page="assetsform/sidebar.jsp">
		<jsp:param name="side" value="sidebar"></jsp:param>
	</jsp:include>
	<!-- 	상단바 -->
	<jsp:include page="assetsform/topbar.jsp">
		<jsp:param name="top" value="topbar"></jsp:param>
	</jsp:include>
        <!-- 메인메뉴 아레 정보가 표시될 영역 -->
        <div class="searchID">

            <!-- 해당 페이지의 제목 -->
            <h1>설비고장/수리이력</h1>
            <!-- 해당 페이지의 설명 -->
            <div class="subhead">
                <span>설비고장 또는 수리의 이력을 볼 수 있는 페이지 입니다.</span> <br>
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
                        <th>설비번호</th>
                        <th>설비코드</th>
                        <th>고장코드</th>
                        <th>설비명</th>
                        <th>고장/수리업체</th>
                        <th>수리자</th>
                        <th>위치</th>
                        <th>관리자</th>
                        <th>고장/수리일자</th>
                        <th>비고</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>1</td>
                        <td>1A-12</td>
                        <td>IDU-001</td>
                        <td>E-01</td>
                        <td>실내기</td>
                        <td>(주)공조</td>
                        <td>정다올</td>
                        <td>A공장</td>
                        <td>김승환</td>
                        <td>24.07.30</td>
                        <td>필터 교체 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>2</td>
                        <td>2B-08</td>
                        <td>ODU-002</td>
                        <td>E-02</td>
                        <td>실외기</td>
                        <td>(주)공조</td>
                        <td>정다올</td>
                        <td>B공장</td>
                        <td>정근승</td>
                        <td>24.08.01</td>
                        <td>냉매 보충 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>3</td>
                        <td>3C-15</td>
                        <td>FCU-003</td>
                        <td>E-03</td>
                        <td>팬코일 유닛</td>
                        <td>(주)공조</td>
                        <td>서수찬</td>
                        <td>C공장</td>
                        <td>김소원</td>
                        <td>24.08.02</td>
                        <td>모터 교체 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>4</td>
                        <td>4D-22</td>
                        <td>INJ-001</td>
                        <td>E-04</td>
                        <td>사출기</td>
                        <td>(주)기계</td>
                        <td>최영준</td>
                        <td>D공장</td>
                        <td>서수찬</td>
                        <td>24.08.03</td>
                        <td>히터 교체 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>5</td>
                        <td>5E-04</td>
                        <td>CHILL-001</td>
                        <td>E-05</td>
                        <td>냉각기</td>
                        <td>(주)기계</td>
                        <td>정다올</td>
                        <td>E공장</td>
                        <td>정근승</td>
                        <td>24.08.04</td>
                        <td>냉각수 보충 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>6</td>
                        <td>6F-18</td>
                        <td>VALVE-002</td>
                        <td>E-06</td>
                        <td>밸브</td>
                        <td>(주)기계</td>
                        <td>김성령</td>
                        <td>F공장</td>
                        <td>정다올</td>
                        <td>24.08.05</td>
                        <td>밸브 점검 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>7</td>
                        <td>7G-09</td>
                        <td>PUMP-003</td>
                        <td>E-07</td>
                        <td>펌프</td>
                        <td>(주)기계</td>
                        <td>정다올</td>
                        <td>G공장</td>
                        <td>정근승</td>
                        <td>24.08.06</td>
                        <td>벨트 교체 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>8</td>
                        <td>8H-12</td>
                        <td>FAN-004</td>
                        <td>E-08</td>
                        <td>산업용 팬</td>
                        <td>(주)기계</td>
                        <td>김성령</td>
                        <td>H공장</td>
                        <td>정다올</td>
                        <td>24.08.07</td>
                        <td>블레이드 교체 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>9</td>
                        <td>9I-14</td>
                        <td>FCU-002</td>
                        <td>E-09</td>
                        <td>팬코일 유닛</td>
                        <td>(주)공조</td>
                        <td>정다올</td>
                        <td>I공장</td>
                        <td>정근승</td>
                        <td>24.08.08</td>
                        <td>모터 점검 완료</td>
                    </tr>
                    <tr>
                        <td><input type="checkbox" id="tablechk"></td>
                        <td>10</td>
                        <td>10J-16</td>
                        <td>AHU-001</td>
                        <td>E-10</td>
                        <td>항온항습기</td>
                        <td>(주)공조</td>
                        <td>정다올</td>
                        <td>J공장</td>
                        <td>정근승</td>
                        <td>24.08.09</td>
                        <td>습도 조절 점검 완료</td>
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

</html>