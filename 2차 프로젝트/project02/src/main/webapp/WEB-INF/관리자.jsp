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
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    

    <title>소원을 들어주는 MES</title>

    <style>
        .management_kw {
            margin: 10px;
            padding: 10px;
            /* border: solid gray; */
            margin-right: 50px;

            width: 100%;
            height: 300px;
        }

        .management_profile{
            width: 200px;
            height: 200px;
            border-radius: 70%;
            border: solid gray;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
        }

        .id_poto_kw {
            width: 100%;
            height: 120%;
            object-fit: cover;
        }
    </style>
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

    </div>

    <!--/////////////////////////////////////////////////////////////-->
    <!-- 메인 영역의 큰 div ->이유는 body에 flex를 적용하여 -->
    <div class="content">
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
        <!-- 메인메뉴 아래 정보가 표시될 영역 -->



        <div class="main_page">
            <h2>관리자페이지</h2>
            
            <div style="display: flex;">

                <div class="management_kw">
                    <div class="management_profile">
                        <img class="id_poto_kw"
                            src="/mes/Image/정근승.png"
                            alt="">
                    </div>

                    <div style="display: inline; width: 300px;">
                        <h3>정근승 / 대표이사</h3>
                        <input type="button" value="수정" id="correction_kw">
                    </div>

                    <script>
                        document.getElementById('correction_kw').addEventListener('click', function () {
                            window.open('회원정보수정_popup', 'Input Form', 'width=400,height=600');
                        });
                    </script>

                    <!-- 기존에 만든 각 개인정보를 스크립트에 전달해준다 -->
                </div>

                <div class="management_kw">
                    <div class="management_profile">
                        <img class="id_poto_kw"
                            src="/mes/Image/권대호.png"
                            alt="">
                    </div>

                    <div style="display: inline; width: 300px;">
                        <h3>권대호 / 상무</h3>
                        <input type="button" value="수정" id="correction_kw">
                    </div>

                    <script>
                        document.getElementById('correction_kw').addEventListener('click', function () {
                            window.open('회원정보수정_popup', 'Input Form', 'width=400,height=500');
                        });
                    </script>

                    <!-- 기존에 만든 각 개인정보를 스크립트에 전달해준다 -->
                </div>

                <div class="management_kw">
                    <div class="management_profile">
                        <img class="id_poto_kw"
                            src="/mes/Image/정다올.png"
                            alt="">
                    </div>

                    <div style="display: inline; width: 300px;">
                        <h3>정다올 / 부장</h3>
                        <input type="button" value="수정" id="correction_kw">
                    </div>

                    <script>
                        document.getElementById('correction_kw').addEventListener('click', function () {
                            window.open('회원정보수정_popup', 'Input Form', 'width=400,height=500');
                        });
                    </script>

                    <!-- 기존에 만든 각 개인정보를 스크립트에 전달해준다 -->
                </div>

                <div class="management_kw">
                    <div class="management_profile">
                        <img class="id_poto_kw"
                            src="/mes/Image/김소원.png"
                            alt="">
                    </div>

                    <div style="display: inline; width: 300px;">
                        <h3>김소원 / 부장</h3>
                        <input type="button" value="수정" id="correction_kw">
                    </div>

                    <script>
                        document.getElementById('correction_kw').addEventListener('click', function () {
                            window.open('회원정보수정_popup', 'Input Form', 'width=400,height=500');
                        });
                    </script>

                    <!-- 기존에 만든 각 개인정보를 스크립트에 전달해준다 -->
                </div>





            </div>
            


        </div>
    </div>

    </div>

</body>

</html>