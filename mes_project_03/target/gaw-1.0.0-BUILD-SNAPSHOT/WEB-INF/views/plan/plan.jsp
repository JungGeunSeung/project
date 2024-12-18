<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png"
	type="image/png">
<title>생산계획</title>

<style>
article {
	width: 70%;
	margin: 0 auto;
	border: 1px solid #ddd;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 20px;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}
.modal2{
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.plan_id, .product_id, .start_date, .end_date, .quantity, .created_by,
	.status, .edit, .delete {
	text-align: center;
}

.plan_id {
	width: 70px;
}

.start_date, .end_date {
	width: 100px;
}

.chkbox {
	width: 40px;
}

.edit, .delete {
	width: 70px;
}

input[type="checkbox"] {
	width: 20px;
	height: 20px;
	margin: 0 auto;
	vertical-align: center;
	text-align: center;
}

.actionDiv {
	float: right;
	margin-right: 20px;
}

#createBtn {
	margin-right: 20px;
}

.status {
	width: 50px;
}

.quantity {
	width: 50px;
}

.created_by {
	width: 100px;
}

table {
	margin-top: 70px;
}

#pagination button {
	background-color: inherit;
	border: 1px;
	margin: 0 5px;
	font-size: 16px;
}

#pagination {
	width: 70%;
	margin: 0 auto;
	margin-top: 20px;
	text-align: center;
}

#createBtn {
	width: 100%;
}


</style>
</head>

<body>

	<header>
		<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
	</header>

	<nav>
		<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>

	<article>
		<h2>생산계획</h2>
		<span>생산계획을 관리하는 페이지 입니다. 계획을 수정 및 생성 할 수 있습니다.</span>

		<div class="actionDiv">
			<span><button class="btn" id="createBtn">생산계획 생성</button></span>
		</div>
		
		
			<form id="frm" method="get" action="serchplan">
		<select name="searchType">
			<option value="1"
				${searchType == 1 ? " selected='selected' " : "" }>계획ID</option>
			<option value="2"
				${searchType == 2 ? " selected='selected' " : "" }>제품ID</option>
			<option value="3"
				${searchType == 3 ? " selected='selected' " : "" }>작성자</option>
		</select> <input type="text" name="keyword" placeholder="검색어를 입력하세요"
			value="${keyword }"> <input type="submit" value="검색">


		<input type="hidden" name="orderType" value="${orderType }">

		<table border="1">
			<caption style="display: none;">생산계획목록</caption>
			<thead>
				<tr>
					<th id="serch_planid">계획 ID<c:if test='${orderType == "desc" }'>↓</c:if>
						<c:if test='${orderType eq "asc" }'>↑</c:if></th>
					<th>제품 ID</th>
					<th>생산 시작일</th>
					<th>생산 종료일</th>
					<th>수량</th>
					<th>작성자</th>
					<th>상태</th>
					<th colspan="2">수정 및 삭제</th>
					<th>작업지시서</th>
				</tr>
			</thead>
			<tbody id="list"></tbody>
		</table>
		</form>

		<div id="pagination"></div>


		<!-- 모달 창 -->
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<h2>생산계획 수정/생성</h2>
				<form id="planForm">
					<label for="plan_id">계획 ID:</label> <input type="text" id="plan_id"
						name="plan_id" readonly><br> <br> <label
						for="product_id">제품 ID:</label> <input type="text" id="product_id"
						name="product_id"><br> <br> <label
						for="start_date">생산 예정 시작일:</label> <input type="date"
						id="start_date" name="start_date"><br> <br> <label
						for="end_date">생산 예정 종료일:</label> <input type="date" id="end_date"
						name="end_date"><br> <br> <label for="quantity">계획수량:</label>
					<input type="number" id="quantity" name="quantity"><br>
					<br> <label for="created_by">작성자:</label> <input type="text"
						id="created_by" name="created_by"><br> <br> <label
						for="status">상태:</label> <select id="status" name="status">
						<option value="계획">계획</option>
						<option value="진행">진행</option>
						<option value="완료">완료</option>
					</select><br> <br> <span><button class="btn" type="submit">저장</button></span>
				</form>
			</div>
		</div>
		
		<!-- 작업지시서 작성 모달 -->
<div id="workOrderModal" class="modal2">
    <div class="modal-content">
        <span class="closeWorkOrder">&times;</span>
        <h2>작업지시서 작성</h2>
        <form id="workOrderForm">
            <label for="plan_id">계획 ID:</label><br>
            <input type="text" id="work_plan_id" name="plan_id" readonly><br><br>
            
            <label for="mgr_id">관리자 ID:</label><br>
            <input type="text" id="mgr_id" name="mgr_id"><br><br>

            <label for="equip_id">설비 ID:</label><br>
            <input type="text" id="equip_id" name="equip_id"><br><br>

            <label for="start_date">작업 시작일:</label><br>
            <input type="date" id="work_start_date" name="start_date"><br><br>

            <label for="end_date">작업 종료일:</label><br>
            <input type="date" id="work_end_date" name="end_date"><br><br>

            <label for="status">상태:</label><br>
            <select id="work_status" name="status">
                <option value="계획">계획</option>
                <option value="진행">진행</option>
                <option value="완료">완료</option>
            </select><br><br>

            <label for="quantity">계획 수량:</label><br>
            <input type="number" id="work_quantity" name="quantity"><br><br>

            <label for="defect_quantity">불량 수량:</label><br>
            <input type="number" id="defect_quantity" name="defect_quantity"><br><br>

            <button type="submit" class="btn">작업지시서 저장</button>
        </form>
    </div>
</div>

		
		
	</article>

	<script>
    let currentPage = 1;
    const itemsPerPage = 10;
    let planList = [];

    const modal = document.getElementById("myModal");
    const closeModalBtn = document.querySelector(".close");

    // 모달 창 열기
function openModal(plan) {
    modal.style.display = "block";

    if (plan) {
        document.getElementById("plan_id").value = plan.plan_id;
        document.getElementById("product_id").value = plan.product_id;
        document.getElementById("start_date").value = new Date(plan.start_date).toISOString().split('T')[0];
        document.getElementById("end_date").value = new Date(plan.end_date).toISOString().split('T')[0];
        document.getElementById("quantity").value = plan.quantity;
        document.getElementById("created_by").value = plan.created_by;
        document.getElementById("status").value = plan.status; // 상태 값 설정
    } else {
        document.getElementById("planForm").reset();
        document.getElementById("plan_id").removeAttribute("readonly");
    }
}

    // 모달 창 닫기
    closeModalBtn.addEventListener("click", function () {
        modal.style.display = "none";
    });

    // 생성 버튼 클릭 시 모달 창 열기
    document.getElementById("createBtn").addEventListener("click", function () {
        openModal(null);
    });
    
 // 작업지시서 모달 열기 함수
    function openWorkOrderModal(planId) {
        const workOrderModal = document.getElementById("workOrderModal");
        workOrderModal.style.display = "block"; // 모달 열기
        document.getElementById("work_plan_id").value = planId; // 선택된 계획 ID 설정
    }

    // 작업지시서 모달 닫기
    const closeWorkOrderBtn = document.querySelector(".closeWorkOrder");
    closeWorkOrderBtn.addEventListener("click", function() {
        const workOrderModal = document.getElementById("workOrderModal");
        workOrderModal.style.display = "none"; // 모달 닫기
    });

    // 작업지시서 저장 폼 제출 이벤트 처리
    document.getElementById("workOrderForm").addEventListener("submit", function(event) {
        event.preventDefault();

        const workOrderData = {
            plan_id: document.getElementById("work_plan_id").value,
            mgr_id: document.getElementById("mgr_id").value,
            equip_id: document.getElementById("equip_id").value,
            start_date: document.getElementById("work_start_date").value,
            end_date: document.getElementById("work_end_date").value,
            status: document.getElementById("work_status").value,
            quantity: document.getElementById("work_quantity").value,
            defect_quantity: document.getElementById("defect_quantity").value
        };

        const xhr = new XMLHttpRequest();
        xhr.open("POST", "createWorkOrder", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.send(JSON.stringify(workOrderData));

        xhr.onload = function() {
            if (xhr.status === 200) {
                alert("작업지시서가 성공적으로 생성되었습니다.");
                const workOrderModal = document.getElementById("workOrderModal");
                workOrderModal.style.display = "none"; // 모달 닫기
            } else {
                alert("작업지시서 생성에 실패했습니다.");
            }
        };
    });

    // 작업지시서 버튼 클릭 이벤트 추가
    function attachWorkOrderButtons() {
        document.querySelectorAll(".createWorkOrderBtn").forEach(button => {
            button.addEventListener("click", function() {
                const planId = this.dataset.plan; // 선택된 계획 ID 가져오기
                console.log(planId)
                openWorkOrderModal(planId); // 작업지시서 모달 열기
            });
        });
    }

    // 페이지 로드 시 작업지시서 버튼 이벤트 핸들러 추가
    window.addEventListener("load", function() {
        getList(); // 페이지 로드 시 리스트 가져오기
    });

    // 리스트 가져오기 함수
    function getList() {
        ajax("selectPlan", function (response) {
            planList = JSON.parse(response);
            drawList();
            drawPagination();
            attachWorkOrderButtons(); // 작업지시서 버튼 이벤트 추가
        }, "GET");
    }




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

    // 리스트 그리기
    function drawList() {
    	try{
        const start = (currentPage - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const paginatedItems = planList.slice(start, end);
        let html = "";

        for (let i = 0; i < paginatedItems.length; i++) {
        	
            const plan = paginatedItems[i];
            let statusColor = "";
            switch (plan.status) {
                case "완료":
                    statusColor = "color: green; transparent; -webkit-text-stroke: 1px;";
                    break;
                case "진행":
                    statusColor = "color: orange; transparent; -webkit-text-stroke: 1px;";
                    break;
                case "계획":
                    statusColor = "color: red; transparent; -webkit-text-stroke: 1px;";
                    break;
                default:
                    statusColor = "";
            }

            html += `
                <tr>
                    <td class="plan_id">\${plan.plan_id}</td>
                    <td class="product_id">\${plan.product_name}</td>
                    <td class="start_date">\${new Date(plan.start_date).toISOString().split('T')[0]}</td>
                    <td class="end_date">\${new Date(plan.end_date).toISOString().split('T')[0]}</td>
                    <td class="quantity">\${plan.quantity}</td>
                    <td class="created_by">\${plan.emp_name}</td>
                    <td class="status" style="\${statusColor}">\${plan.status}</td>
                    <td class="edit"><sapn><button type="button" class="editBtn btn" data-plan='\${JSON.stringify(plan)}'>수정</button></span></td>
                    <td class="delete"><span><button type="button" data-plan="\${plan.plan_id}" class="deleteBtn btn" id="btn_\${plan.plan_id}">삭제</button></span></td>
                    <td class="createWorkOrder"><button type="button" class="createWorkOrderBtn btn" data-plan='\${plan.plan_id}'>작업지시서 작성</button></td> 
                </tr>`;
        	}
        document.querySelector("#list").innerHTML = html;

        // 수정 버튼 클릭 이벤트 추가
        const editButtons = document.querySelectorAll(".editBtn");
        editButtons.forEach(button => {
            button.addEventListener("click", function () {
                const plan = JSON.parse(this.getAttribute('data-plan'));
                openModal(plan);
            });
        });

        // 삭제 버튼 클릭 이벤트 추가
        const delBtnList = document.querySelectorAll("[id^=btn_]");
        for (let btn of delBtnList) {
            btn.addEventListener("click", function (event) {
           		
            	const id = event.target.getAttribute("id")
                const plan = event.target.getAttribute("data-plan");
                console.log("삭제할 계획 ID: ", plan);

                url = "deletePlan"
    				const data = {
    						"plan": plan
    				}
                
                const xhr2 = new XMLHttpRequest();
                xhr2.open("DELETE", url);
                xhr2.setRequestHeader("Content-Type", "application/json");
                xhr2.send(JSON.stringify(data));

                xhr2.onload = function () {
                    console.log(xhr2.responseText);
                    getList(); // 삭제 후 리스트 갱신
                }
            });
        }
    	}catch(e){
			console.log("ahax ERROR :url",url,e);
		}

    }
    

    // 페이지 로드 시 getList 함수 호출
    window.addEventListener("load", getList);

    // 리스트 가져오기 함수
    function getList() {
        ajax("selectPlan", function (response) {
            planList = JSON.parse(response);
            drawList();
            drawPagination();
        }, "GET");
    }

    // 페이징 버튼 그리기
    function drawPagination() {
        const totalPages = Math.ceil(planList.length / itemsPerPage);
        let paginationHtml = "";

        for (let i = 1; i <= totalPages; i++) {
            paginationHtml += `<button class="page-btn" data-page="\${i}">\${i}</button>`;
        }
        document.querySelector("#pagination").innerHTML = paginationHtml;

        const pageButtons = document.querySelectorAll(".page-btn");
        pageButtons.forEach(button => {
            button.addEventListener("click", function () {
                currentPage = parseInt(this.dataset.page);
                drawList();
            });
        });
    }

    // 폼 제출 (수정 또는 생성)
    document.getElementById("planForm").addEventListener("submit", function (event) {
        event.preventDefault();

        const planData = {
            plan_id: document.getElementById("plan_id").value,
            product_id: document.getElementById("product_id").value,
            start_date: document.getElementById("start_date").value,
            end_date: document.getElementById("end_date").value,
            quantity: document.getElementById("quantity").value,
            created_by: document.getElementById("created_by").value,
            status: document.getElementById("status").value
        };
        console.log("전송할 데이터:", planData);
        
        const method = planData.plan_id ? "PUT" : "POST";
        const url = method === "POST" ? "createPlan" : `updatePlan/${planData.plan_id}`;
        
        const xhr3 = new XMLHttpRequest();
        xhr3.open(method, url); 
        xhr3.setRequestHeader("Content-Type", "application/json");

        xhr3.onreadystatechange = function () {
            if (xhr3.readyState === 4) {
                if (xhr3.status === 200) {
                    console.log('저장 성공');
                    modal.style.display = "none"; // 모달 닫기
                    getList(); // 리스트 갱신
                } else {
                    console.error('저장 실패:', xhr3.responseText);
                }
            }
        };

        xhr3.send(JSON.stringify(planData));
    });
    
  //클릭 이벤트를 사용하여 
	document.querySelector("#serch_planid").addEventListener("click", function() {
		const orderType = document.querySelector("[name=orderType]");

		// '' > 'desc' > 'asc' > '' 처럼 세개의 값을 순환하게 만들기
		console.log(orderType.value, orderType.value == '');
		if (orderType.value == '') {
			orderType.value = 'desc'
		} else if (orderType.value == 'desc') {
			orderType.value = 'asc'
		} else if (orderType.value == 'asc') {
			orderType.value = ''
		}

		const frm = document.querySelector("#frm");
		frm.submit();

	})
</script>


	<footer>
		<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>

</body>

</html>
