<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css"> 
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<title>생산 실적</title>
</head>
<body>
	<header>
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>

    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>
    
    <table border="1">
        <caption>생산실적 목록</caption>
        <thead>
            <tr>
                <th>선택</th>
                <th>실적 ID</th>
                <th>작업 ID</th>
                <th>최종 생산 수량</th>
                <th>불량 수량</th>
                <th>생산일자</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
    
	<div id="pagination"></div>

<script>
	let currentPage = 1;
	const itemsPerPage = 10;
	let PerformanceList = [];
	
	// AJAX 요청 함수
    function ajax(url, cb, method) {
        const xhr = new XMLHttpRequest();
        xhr.open(method, url);
        xhr.send();

        xhr.onload = function () {
            if (typeof cb === "function") {
                cb(xhr.responseText);
            }
        };
    }
	
    // 생산 실적 목록을 가져오는 함수
    function getList() {
        ajax("selectPerformance", function (response) { // AJAX 요청
        	PerformanceList = JSON.parse(response); // 응답을 JSON으로 파싱하여 planList에 저장
            drawList(); // 리스트 그리기
            drawPagination(); // 페이징 그리기
        }, "get");
    }

 	// 리스트 그리기
    function drawList() {
    	const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = PerformanceList.slice(start, end);
        
        let html = "";
        for (let i = 0; i < paginatedItems.length; i++) {
            const per = paginatedItems[i];
            html += `
                <tr>
                    <td><input type="checkbox" name="check" value="\${per.per_id}"></td>
                    <td>\${per.per_id}</td>
                    <td>\${per.order_id}</td>
                    <td>\${per.actual}</td>
                    <td>\${per.defect_quantity}</td>
                    <td>\${new Date(per.production_date).toISOString().split('T')[0]}</td>
                    <td><button class="deleteBtn" data-per_id="\${per.per_id}" id="btn_\${paginatedItems[i].per_id}">삭제</button></td>
                </tr>`;
        }
        document.querySelector("#list").innerHTML = html;
        
     // 삭제 버튼 이벤트 추가
        const delBtnList = document.querySelectorAll("[id^=btn_]");
        for (let btn of delBtnList) {
            btn.addEventListener("click", function(event) {
                const per_id = event.target.getAttribute("data-per_id"); // 오타 수정
//                 console.log(per_id);

                const url = "deletePerformance";
                const data = {
                    "per_id": per_id
                };

                const xhr2 = new XMLHttpRequest();
                xhr2.open("DELETE", url);
                xhr2.setRequestHeader("Content-Type", "application/json");
                xhr2.send(JSON.stringify(data));

                xhr2.onload = function() { // 오타 수정
                    console.log(xhr2.responseText);
                    // 삭제 후 리스트를 다시 가져와서 갱신할 수 있습니다.
                    getList(); // 삭제 후 리스트를 갱신
                };
            });
        }
    }

    // 페이징 버튼을 그리는 함수
    function drawPagination() {
        const totalPages = Math.ceil(PerformanceList.length / itemsPerPage); // 전체 페이지 수 계산
        let paginationHtml = ""; // 페이징 HTML 문자열 초기화

        for (let i = 1; i <= totalPages; i++) { // 각 페이지에 대해 버튼 생성
            paginationHtml += `<button class="page-btn" data-page="\${i}">\${i}</button>`;
        }

        document.querySelector("#pagination").innerHTML = paginationHtml; // 페이징 버튼 삽입

        // 페이지 버튼 클릭 이벤트 추가
        const pageButtons = document.querySelectorAll(".page-btn"); // 모든 페이지 버튼 선택
        pageButtons.forEach(button => {
            button.addEventListener("click", function () { // 버튼 클릭 시
                currentPage = parseInt(this.dataset.page); // 클릭한 버튼의 페이지 번호로 currentPage 업데이트
                drawList(); // 리스트 다시 그리기
            });
        });
    }

    // 페이지가 로드될 때 getList 함수 호출
    window.addEventListener("load", getList);

 
</script>

<footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>
</body>
</html>