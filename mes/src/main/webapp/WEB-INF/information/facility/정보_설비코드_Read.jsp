<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<link rel="stylesheet" href="/mes/CSS/sidebar.css">
<link rel="stylesheet" href="/mes/CSS/topbar.css">
<link rel="stylesheet" href="/mes/CSS/mobile.css">
<link rel="stylesheet" href="/mes/CSS/read.css">
<link rel="stylesheet" href="/mes/CSS/BOMmodal.css">
<script src="/mes/JavaScript/load_info.js"></script>
<title>정보/BOM > 설비코드 > 검색</title>

<style>
    #readtable {
        border-collapse: collapse;
        text-align: center;
        background-color: rgba(173, 216, 230, 0.3);
        border: 1px solid black;
    }

    #readtable td {
        border: 1px solid black;
        padding: 5px
    }

    #readtable th {
        background-color: rgb(135, 206, 250);
        color: white;
        font-size: 20px;
        border: 1px solid black;
        padding: 0px 10px;
    }

    #readtable tr:nth-child(2n) {
        background-color: rgba(173, 216, 230, 0.6);
    }

    #prodTD {
        background-color: rgb(135, 206, 250);
    }
</style>
<script>
		document.addEventListener('DOMContentLoaded', function () {
			// 모달 자바스크립트
			const modal = document.querySelector('.bom_modal');
			const btn = document.querySelector('.bom_modal_btn');
			const closeModal = document.querySelector('.closeModal');

				btn.addEventListener("click", function () {
					
					modal.style.display = "flex";
				});

			// 닫기 버튼 클릭 시 모달창 닫기
			closeModal.addEventListener("click", function () {
				modal.style.display = "none";
			});

			// 모달창 외부 클릭 시 모달창 닫기
			window.addEventListener("click", function (event) {
				if (event.target === modal) {
					modal.style.display = "none";
				}
			});
			
			// 수정하기 버튼 클릭시 submit
			document.querySelector('.modifyModal').addEventListener('click',function(){
				if(!confirm("수정하시겠습니까?")){
					event.preventDefault();
				} else {
				document.querySelector('#modalForm').submit();
				}
			})
			
			document.querySelector('#dleForm').onsubmit = function(event){
				if(!confirm("정말로 삭제하시겠습니까?")){
					event.preventDefault();
				} else {
				alert("삭제 되었습니다. 문서번호 : " + tds[0].textContent.trim());
				}
				
			};
		});


	</script>
</head>

<body>
    <!-- 카테고리바와 사이드바 동시 jsp -->
	<jsp:include page="/WEB-INF/topSide/topSide.jsp" />
    <!-- 메인메뉴 아래 정보가 표시될 영역 -->
    <div class="searchID">

        <!-- 해당 페이지의 제목 -->
        <h1><a href="/mes/Euip/list">설비코드</a></h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>제품생산에 필요한 설비의 코드를 조회하는 페이지입니다.</span> <br>
        </div>
        <!-- 게시물의 개수를 표시할 select -->
    </div>

    <!-- 해당 목록 -->
    <div>
		<div>
	        <c:url var="list1" value="/Equip/list" />
	        <a href="${ list1 }" class="btn">돌아가기</a>
	
	        <button class="btn bom_modal_btn">수정하기</button>
			<div id="dleForm">
		        <form method="post" action="delete">
		            <input type="hidden" name="equiID" value="${Equip.equiID}">
		            <input type="hidden" name="equiname" value="${Equip.equiname}">
		            <input type="submit" value="삭제하기" class="btn">
		        </form>
	        </div>
        </div>
        <div>
            <table id="readtable">
                <tr>
                    <th>설비코드</th>
                    <th>설비 명</th>
                    <th>설비사진</th>
                    <th>설비유형</th>
                    <th>설비설명</th>
                    <th>구매일자</th>
                    <th>위치</th>
                    <th>상태</th>
                    <th>관리자</th>
                </tr>
				<tr>
					<td>${ Equip.equiID }</td>
                    <td>${ Equip.equiname }</td>
                    <td>${ Equip.equiImg }</td>
                    <td>${ Equip.equiType }</td>
                    <td>${ Equip.equiDesc }</td>
                    <td>${ Equip.sellDate }</td>
                    <td>${ Equip.equiLoc }</td>
                    <td>${ Equip.status }</td>
                    <td>${ Equip.userid }</td>
				</tr>
            </table>
        </div>
    </div>
    <hr>
<!--     모달창 -->
    <div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="/mes/Equip/modify">
				<table id="modalTable" border="1">
						<tr>
				            <td>설비코드</td>
				            <td><input type="text" name="equiID" value="${ Equip.equiID }" /></td>
				        </tr>
				        <tr>
				            <td>설비 명</td>
				            <td><input type="text" name="equiname" value="${ Equip.equiname }" /></td>
				        </tr>
				        <tr>
				            <td>설비사진</td>
				            <td><input type="text" name="equiImg" value="${ Equip.equiImg }" /></td>
				        </tr>
				        <tr>
				            <td>설비유형</td>
				            <td><input type="text" name="equiType" value="${ Equip.equiType }" /></td>
				        </tr>
				        <tr>
				            <td>설비설명</td>
				            <td><input type="text" name="equiDesc" value="${ Equip.equiDesc }" /></td>
				        </tr>
				        <tr>
				            <td>구매일자</td>
				            <td><input type="date" name="sellDate" value="${ Equip.sellDate }" /></td>
				        </tr>
				        <tr>
				            <td>위치</td>
				            <td><input type="text" name="equiLoc" value="${ Equip.equiLoc }" /></td>
				        </tr>
				        <tr>
				            <td>상태</td>
				            <td><input type="text" name="status" value="${ Equip.status }" /></td>
				        </tr>
				        <tr>
				            <td>관리자</td>
				            <td><input type="text" name="userid" value="${ Equip.userid }" /></td>
				        </tr>
				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
</body>

</html>