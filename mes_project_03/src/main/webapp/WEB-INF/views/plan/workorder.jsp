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
<title>작업 지시</title>

<style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}
.actionDiv {
	float: right;
	margin-right: 20px;
}
#createBtn {
	width: 120%;
	padding : 0 2px;
}

</style>

</head>

<body>
<!-- 로딩 CSS에 해당하는 HTML -->
   <jsp:include page="/WEB-INF/views/main/tiles/loading.jsp" />
<header>
    <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
</header>
<nav>
	<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
</nav>

<article>
		<h2>작업 지시</h2>
		<span>작업지시를 관리하는 페이지 입니다. 작업을 지시 및 완료 할 수 있습니다.</span>

<table border="1">
        <thead>
            <tr>
                <th>작업 ID</th>
                <th>계획 ID</th>
                <th>담당자 id</th>
                <th>사용 기계</th>
                <th>작업 시작 일자</th>
                <th>작업 종료 일자</th>
                <th>작업 상태<br>(지시,진행,완료)</th>
                <th>생산 수량</th>
                <th>불량 수량</th>
                <th>삭제</th>
                <th>완료/진행</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
    
	<div id="pagination"></div>
</article>


<script>
	let currentPage = 1;
	const itemsPerPage = 20;
	let OrderList = [];
	
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
        ajax("selectOrder", function (response) { // AJAX 요청
        	OrderList = JSON.parse(response); // 응답을 JSON으로 파싱하여 OrderList에 저장
            drawList(); // 리스트 그리기
            drawPagination(); // 페이징 그리기
        }, "get");
    }
	
	//list 그리기
	function drawList(){
		const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = OrderList.slice(start, end);

        let html = "";
        for(let i =0;i<paginatedItems.length;i++){
        	const order = paginatedItems[i];
        	let statusColor = "";
        	let buttonHtml = "";
        	switch (order.status) {
        	case "완료":
                statusColor = "color: green; transparent; -webkit-text-stroke: 1px;";
                buttonHtml = ""; // 완료 상태에는 버튼 없음
                break;
            case "진행":
                statusColor = "color: orange; transparent; -webkit-text-stroke: 1px;";
                // 진행 상태일 때는 완료 버튼만 표시
                buttonHtml = `<button class="completeBtn" data-plan="${order.plan_id}" id="completeBtn_${order.plan_id}">완료</button>`;
                break;
            case "지시":
                statusColor = "color: red; transparent; -webkit-text-stroke: 1px;";
                // 지시 상태일 때는 진행 버튼만 표시
                buttonHtml = `<button class="startProcessBtn" data-plan="${order.plan_id}" id="startProcessBtn_${order.plan_id}">진행</button>`;
                break;
            default:
                statusColor = "";
                buttonHtml = ""; // 기본 상태에서는 버튼 없음
        	}
        	html += `
                 <tr>
                     <td>\${order.order_id}</td>
                     <td>\${order.plan_id}</td>
                     <td>\${order.emp_name}</td>
                     <td>\${order.equipment_name}</td>
                     <td>\${new Date(order.start_date).toISOString().split('T')[0]}</td>
                     <td>\${new Date(order.end_date).toISOString().split('T')[0]}</td>
                     <td style="\${statusColor}">\${order.status}</td>
                     <td>\${order.quantity}</td>
                     <td>\${order.defect_quantity}</td>
                     <td><button class="deleteBtn" data-per_id="\${order.order_id}" id="btn_\${paginatedItems[i].order_id}">삭제</button></td>
                     <td>\${buttonHtml}</td>
                 </tr>`;
        }
        document.querySelector("#list").innerHTML = html;
     // 각 버튼에 대한 이벤트 리스너 추가
        addProcessButtonListeners(); // 진행 버튼 이벤트
        addCompleteButtonListeners(); // 완료 버튼 이벤트
        addDeleteEventListeners(); // 삭제 버튼 이벤트
	}
	 // 진행 버튼 클릭 이벤트 추가
    function addProcessButtonListeners() {
        const startProcessBtns = document.querySelectorAll(".startProcessBtn");
        startProcessBtns.forEach(button => {
            button.addEventListener("click", function () {
                const orderId = this.dataset.id;
                updateOrderStatus(orderId, "진행"); // 상태를 "진행"으로 변경
            });
        });
    }
	 
    // 완료 버튼 클릭 이벤트 추가
    function addCompleteButtonListeners() {
        const completeBtns = document.querySelectorAll(".completeBtn");
        completeBtns.forEach(button => {
            button.addEventListener("click", function () {
                const orderId = this.dataset.id;
                updateOrderStatus(orderId, "완료"); // 상태를 "완료"로 변경
                // 완료 시 performance 테이블에 기록 추가 로직 필요
                insertPerformanceRecord(orderId);
            });
        });
    }
        
        // 삭제 버튼 클릭 이벤트 추가
function addDeleteEventListeners() {
    const deleteButtons = document.querySelectorAll(".deleteBtn");
    deleteButtons.forEach(button => {
        button.addEventListener("click", function () {
            const orderId = this.getAttribute("data-per_id");
            if (confirm("해당 작업지시를 삭제하시겠습니까?")) {
                const xhr = new XMLHttpRequest();
               	console.log(orderId);
                xhr.open("DELETE", `deleteOrder/${orderId}`);
                xhr.onload = function () {
                    if (xhr.status === 200 && xhr.responseText === "success") {
                        alert("삭제되었습니다.");
                        getList(); // 삭제 후 리스트 갱신
                    } else {
                        alert("삭제에 실패했습니다.");
                    }
                };
                xhr.send();
            }
        });
    });
}
        
//상태 업데이트 함수
function updateOrderStatus(orderId, newStatus) {
    const xhr = new XMLHttpRequest();
    xhr.open("PUT", `updateOrderStatus/${orderId}`);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({ status: newStatus }));

    xhr.onload = function () {
        if (xhr.status === 200) {
            alert(`작업 상태가 ${newStatus}으로 변경되었습니다.`);
            getList(); // 상태 변경 후 리스트 갱신
        } else {
            alert("상태 변경에 실패했습니다.");
        }
    };
}
	
//완료 시 성과 기록 추가 함수
function insertPerformanceRecord(orderId) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", `insertPerformance/${orderId}`);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify({
        order_id: orderId,
        actual: 100, // 실제 수량 등 데이터를 여기에 넣음
        defect_quantity: 5, // 불량 수량 등 데이터를 여기에 넣음
        production_date: new Date().toISOString().split('T')[0]
    }));

    xhr.onload = function () {
        if (xhr.status === 200) {
            alert("작업 성과가 기록되었습니다.");
        } else {
            alert("성과 기록에 실패했습니다.");
        }
    };
}
	
	// 페이징 버튼을 그리는 함수
    function drawPagination() {
        const totalPages = Math.ceil(OrderList.length / itemsPerPage); // 전체 페이지 수 계산
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