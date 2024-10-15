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
    
    <title>생산계획</title>
</head>

<body>

    <header>
        <!----------------- 헤더 ----------------->
        <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
    </header>
    <!----------------- 메뉴바 ----------------->
    <nav>
        <jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
    </nav>


    <table border="1">
        <caption>생산계획목록</caption>
        <thead>
            <tr>
                <th>선택</th>
                <th>계획 ID</th>
                <th>제품 ID</th>
                <th>생산 시작일</th>
                <th>생산 종료일</th>
                <th>생산할 수량</th>
                <th>작성자</th>
                <th>생산 상태</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
        <!-- 데이터가 들어갈 부분 -->
    </table>

    <div id="pagination"></div>
    <!-- 페이징 버튼이 들어갈 부분 -->

    <script>
        let currentPage = 1; // 현재 페이지를 추적하는 변수
        const itemsPerPage = 10; // 한 페이지에 보여줄 항목 수
        let planList = []; // 전체 데이터를 저장할 배열

        // AJAX 요청을 보내는 함수
        function ajax(url, cb, method) {
            if (!method) method = 'get'; // 기본 메서드는 GET

            const xhr = new XMLHttpRequest(); // XMLHttpRequest 객체 생성
            xhr.open(method, url); // 요청 초기화
            xhr.send(); // 요청 전송

            xhr.onload = function () { // 요청이 완료되면
                if (typeof cb === "function") { // 콜백 함수가 정의되어 있으면
                    cb(xhr.responseText); // 응답 텍스트를 콜백 함수에 전달
                }
            };
        }

        // 생산 계획 목록을 가져오는 함수
        function getList() {
            ajax("selectPlan", function (response) { // AJAX 요청
                planList = JSON.parse(response); // 응답을 JSON으로 파싱하여 planList에 저장
                drawList(); // 리스트 그리기
                drawPagination(); // 페이징 그리기
            }, "get");
        }

     // 리스트를 그리는 함수
        function drawList() {
            const start = (currentPage - 1) * itemsPerPage; // 현재 페이지의 시작 인덱스
            const end = start + itemsPerPage; // 현재 페이지의 끝 인덱스
            const paginatedItems = planList.slice(start, end); // 현재 페이지에 해당하는 데이터 추출
            console.log(paginatedItems);

            let html = ""; // HTML 문자열 초기화
            for (let i = 0; i < paginatedItems.length; i++) { // 각 항목에 대해
                const start_date = new Date(paginatedItems[i].start_date); // 시작일을 Date 객체로 변환
                const ys = start_date.getFullYear(); // 시작일의 연도
                const ms = String(start_date.getMonth() + 1).padStart(2, '0'); // 시작일의 월 (2자리)
                const ds = start_date.getDate(); // 시작일의 일

                const end_date = new Date(paginatedItems[i].end_date); // 종료일을 Date 객체로 변환
                const ye = end_date.getFullYear(); // 종료일의 연도
                const me = String(end_date.getMonth() + 1).padStart(2, '0'); // 종료일의 월 (2자리)
                const de = end_date.getDate(); // 종료일의 일

                // HTML 문자열에 행 추가
                html += `
                        <tr>
                        <td><input type="checkbox" name="check" value="\${paginatedItems[i].plan_id}"></td>
                        <td>\${paginatedItems[i].plan_id}</td>
                        <td>\${paginatedItems[i].product_id}</td>
                        <td>\${ys}년 \${ms}월 \${ds}일</td>
                        <td>\${ye}년 \${me}월 \${de}일</td>
                        <td>\${paginatedItems[i].quantity}</td>
                        <td>\${paginatedItems[i].created_by}</td>
                        <td>\${paginatedItems[i].status}</td>
                        <td><button type="button" data-plan_id="\${paginatedItems[i].plan_id}" class="btnDel" id="btn_${paginatedItems[i].plan_id}">삭제</button></td>
                        </tr>`;
            }
            document.querySelector("#list").innerHTML = html; // tbody에 HTML 삽입

            // 삭제 버튼 이벤트 추가
            const delBtnList = document.querySelectorAll("[id^=btn_]");
            for (let btn of delBtnList) {
                btn.addEventListener("click", function(event) {
                    const plan_id = event.target.getAttribute("data-plan_id"); // 오타 수정
                    console.log(plan_id);

                    const url = "deletePlan";
                    const data = {
                        "plan_id": plan_id
                    };

                    const xhr2 = new XMLHttpRequest();
                    xhr2.open("delete", url);
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
            const totalPages = Math.ceil(planList.length / itemsPerPage); // 전체 페이지 수 계산
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
    <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />

    <!-----------------  풋터 ----------------->
    <footer>
        <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
    </footer>

</body>

</html>