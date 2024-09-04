<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/mes/CSS/topbar.css">
    <!-- 일부러 닫는 태그 안씀. -->
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
                            <li><a href="/mes/BOM/list">BOM</a></li>
                            <li class="manager"><a href="설비코드">설비코드</a></li>
                            <li><a href="조직도">조직도</a></li>
                            <li><a href="/mes/doc/list">문서관리</a></li>
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
                            <li><a href="/mes/Equip">설비고장/수리이력</a></li>
                            <li><a href="비가동이력">비가동이력</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
		</div>
        <hr>