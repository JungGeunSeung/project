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
    
    <title>소원을 들어주는 MES</title>
</head>

<body>
   <!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
        <!-- 메인메뉴 아래 정보가 표시될 영역 -->
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