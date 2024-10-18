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
<title>거래처</title>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
</header>
<nav>
	<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
</nav>



<table border="1">
        <caption>거래처</caption>
        
        <thead>
            <tr>
                <th>선택</th>
                <th>거래처 ID</th>
                <th>업체명</th>
                <th>업체주소</th>
                <th>대표이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>등록날짜</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
    
	<div id="pagination"></div>
    

<script>

let currentPage = 1;
const itemsPerPage = 10;
let ClientList = [];

// AJAX 요청 함수
function ajax(url, cb, method) {
    const xhr = new XMLHttpRequest();
    xhr.open(method, url);
    xhr.send();

    xhr.onload = function () {
        if (typeof cb == "function") {
            cb(xhr.responseText);
        }
    };
}

//작업지시 목록을 가져오는 함수
function getList() {
    ajax("selectClient", function (response) { // AJAX 요청
    	ClientList = JSON.parse(response); // 응답을 JSON으로 파싱하여 OrderList에 저장
        drawList(); // 리스트 그리기
        drawPagination(); // 페이징 그리기
    }, "get");
}

//list 그리기
function drawList(){
	const start = (currentPage - 1) * itemsPerPage;
    const end = start + itemsPerPage;
    const paginatedItems = ClientList.slice(start, end);
    
    let html = "";
    for(let i =0;i<paginatedItems.length;i++){
    	const client = paginatedItems[i];
    	html += `
             <tr>
                 <td><input type="checkbox" name="check" value="\${client.client_id}"></td>
                 <td>\${client.client_id}</td>
                 <td>\${client.name}</td>
                 <td>\${client.location}</td>
                 <td>\${client.contact}</td>
                 <td>\${client.phone}</td>
                 <td>\${client.email}</td>
                 <td>\${new Date(client.create_at).toISOString().split('T')[0]}</td>
             </tr>`;
    }
    document.querySelector("#list").innerHTML = html;
}
	// 페이징 버튼을 그리는 함수
    function drawPagination() {
        const totalPages = Math.ceil(ClientList.length / itemsPerPage); // 전체 페이지 수 계산
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