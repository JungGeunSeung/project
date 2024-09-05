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
<title>소원을 들어주는 MES</title>

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
			const modal = document.querySelector('.bom_modal');
			const btn = document.querySelector('.bom_modal_btn');
			const closeModal = document.querySelector('.closeModal');

				btn.addEventListener("click", function () {
					let prodTD = document.querySelector('#prodTD');
					let td_bom_id = document.querySelectorAll('#td_bom_id');
					let td_mid = document.querySelectorAll('.td_mid');
					let td_bom_quantity = document.querySelectorAll('.td_bom_quantity');
					
					let bom_id = document.querySelector('#bom_id');
					let production_id = document.querySelector('#production_id');
					let inputProduction_id = document.querySelector('#inputProduction_id');
					let mid = document.querySelector('#mid');
					let bom_quantity = document.querySelector('#bom_quantity');
					
					production_id.textContent = prodTD.textContent.trim();
					
					
					
					
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
			
			document.querySelector('.modifyModal').addEventListener('click',function(){
				document.querySelector('#modalForm').submit();
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
    <!-- 사이드바 -->
    <jsp:include page="/WEB-INF/assetsform/sidebar.jsp" />
    <!-- 	상단바 -->
    <jsp:include page="/WEB-INF/assetsform/topbar.jsp" />
    <!-- 메인메뉴 아레 정보가 표시될 영역 -->
    <div class="searchID">

        <!-- 해당 페이지의 제목 -->
        <h1><a href="/mes/BOM/list">BOM</a></h1>
        <!-- 해당 페이지의 설명 -->
        <div class="subhead">
            <span>제품의 BOM을 조회하는 페이지입니다.</span> <br>
        </div>
        <!-- 게시물의 개수를 표시할 select -->
    </div>

    <!-- 해당 목록 -->
    <div>
		<div>
	        <c:url var="list1" value="/BOM/list" />
	        <a href="${ list1 }" class="btn">돌아가기</a>
	
	        <button class="btn bom_modal_btn">수정하기</button>
			<div id="dleForm">
		        <form method="post" action="delete">
		            <input type="hidden" name="bom_id" value="${bom.bom_id}">
		            <input type="submit" value="삭제하기" class="btn">
		        </form>
	        </div>
        </div>
        <div>
            <table id="readtable">
                <tr>
                    <th>제품코드</th>
                    <th>BOM 코드</th>
                    <th>자재 코드</th>
                    <th>사용 개수</th>
                </tr>
                <tr>
                    <td rowspan="${ promat.size() }" id="prodTD">${ bom.production_id }</td>
                    <td class="td_bom_id">${ bom.bom_id }</td>
                    <td class="td_mid">${ bom.mid }</td>
                    <td class="td_bom_quantity">${ bom.bom_quantity }</td>
                </tr>
                <c:forEach var="bom" items="${ promat }" begin="1">
                    <tr>
                        <td class="td_bom_id">${ bom.bom_id }</td>
                        <td class="td_mid">${ bom.mid }</td>
                        <td class="td_bom_quantity">${ bom.bom_quantity }</td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <hr>
<!--     모달창 -->
    <div class="bom_modal">
		<div class="bom_modal_body">
			<form id="modalForm" method="post" action="modify">
				<table id="modalTable" border="1">
						<tr>
							<td>상품 코드</td>
							<td id="production_id"></td>
						</tr>
				</table>
				<table>
					<c:forEach var="modal" begin="1" end="${ promat.size() }" items="${ promat }">
					<tr>
						<td>BOM 코드</td>
						<td>자재 코드</td>
						<td>재품별 자재 사용개수</td>
					</tr>
					<tr>
						<td><span id="bom_id"></span><input type="hidden" name="bom_id" id="input_bom_id"></td>
						<td><input type="text" name="mid" id="mid"></td>
						<td><input type="number" name="bom_quantity" id="bom_quantity"></td>
					</tr>
					</c:forEach>
				</table>
			</form>
			<div class="modifyModal" onclick="modifySubmit()">수정하기</div>
			<div class="closeModal">닫기</div>
		</div>
	</div>
</body>

</html>