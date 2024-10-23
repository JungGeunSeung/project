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
	width: 100%;
	padding: 0 7px;
}

#pagination button {
	background-color: inherit;
	border: none;
	margin: 0 5px;
	font-size: 16px;
}

#pagination {
	width: 70%;
	margin: 0 auto;
	margin-top: 20px;
	text-align: center;
}

.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.4);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    padding: 20px;
    border: 1px solid #888;
    width: 400px;
    margin: auto;
    border-radius: 10px;
    position: relative;
}

.close {
    position: absolute;
    top: 10px;
    right: 20px;
    font-size: 24px;
    cursor: pointer;
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
<!-- 거래처를 추가하는 버튼 만들기 -->
        <h2>거래처</h2>
		<span>거래처를 관리하는 페이지 입니다. 거래처를 수정 및 추가 할 수 있습니다.</span>

		<div class="actionDiv">
			<span><button class="btn" id="createBtn">거래처 추가</button></span>
		</div>
<table border="1">
        
		
        <thead>
            <tr>
                <th>거래처 ID</th>
                <th>업체명</th>
                <th>업체주소</th>
                <th>대표이름</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>등록날짜</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
    
	<div id="pagination"></div>
</article>

<!-- 모달창 HTML 추가 -->
<div id="clientModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h3>거래처 추가</h3>
        <form id="clientForm">
            <label for="client_id">거래처 ID:</label><br>
            <input type="text" id="client_id" name="client_id"><br><br>

            <label for="name">업체명:</label><br>
            <input type="text" id="name" name="name"><br><br>

            <label for="location">업체주소:</label><br>
            <input type="text" id="location" name="location"><br><br>

            <label for="contact">대표이름:</label><br>
            <input type="text" id="contact" name="contact"><br><br>

            <label for="phone">전화번호:</label><br>
            <input type="text" id="phone" name="phone"><br><br>

            <label for="email">이메일:</label><br>
            <input type="email" id="email" name="email"><br><br>

            <label for="create_at">등록날짜:</label><br>
            <input type="date" id="create_at" name="create_at"><br><br>

            <button type="submit" class="btn">저장</button>
        </form>
    </div>
</div>


<!-- 거래처 수정 모달 창 HTML -->
<div id="editClientModal" class="modal">
    <div class="modal-content">
        <span class="close-edit">&times;</span>
        <h3>거래처 수정</h3> 
        <form id="editClientForm">
            <input type="hidden" id="edit_client_id" name="edit_client_id"> <!-- 거래처 ID는 숨김 필드로 -->

            <label for="edit_name">업체명:</label><br>
            <input type="text" id="edit_name" name="edit_name" readonly><br><br> <!-- 업체명은 수정 불가 -->

            <label for="edit_location">업체주소:</label><br>
            <input type="text" id="edit_location" name="edit_location"><br><br> <!-- 수정 가능 -->

            <label for="edit_contact">대표이름:</label><br>
            <input type="text" id="edit_contact" name="edit_contact"><br><br> <!-- 수정 가능 -->

            <label for="edit_phone">전화번호:</label><br>
            <input type="text" id="edit_phone" name="edit_phone"><br><br> <!-- 수정 가능 -->

            <button type="submit" class="btn">저장</button>
        </form>
    </div>
</div>



<script>

//모달창 열기/닫기 스크립트
const modal = document.getElementById("clientModal");
const createBtn = document.getElementById("createBtn");
const closeModal = document.getElementsByClassName("close")[0];

// 모달창 열기
createBtn.onclick = function() {
    modal.style.display = "flex";
}

// 모달창 닫기
closeModal.onclick = function() {
    modal.style.display = "none";
}

// 모달창 외부 클릭시 닫기
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

//거래처 추가 폼 제출 이벤트
document.getElementById("clientForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const clientData = {
        client_id: document.getElementById("client_id").value,
        name: document.getElementById("name").value,
        location: document.getElementById("location").value,
        contact: document.getElementById("contact").value,
        phone: document.getElementById("phone").value,
        email: document.getElementById("email").value
    };

    const xhr = new XMLHttpRequest();
    xhr.open("POST", "createClient", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify(clientData));

    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("거래처가 성공적으로 추가되었습니다.");
            modal.style.display = "none";
            getList(); // 목록 갱신
        } else {
            alert("거래처 추가에 실패했습니다.");
        }
    };
});


//모달창 열기/닫기 스크립트 (수정 모달)
const editModal = document.getElementById("editClientModal");
const closeEditModal = document.getElementsByClassName("close-edit")[0];

// 모달창 열기 (수정)
function openEditModal(client) {
    editModal.style.display = "flex";
    document.getElementById("edit_client_id").value = client.client_id;
    document.getElementById("edit_name").value = client.name;
    document.getElementById("edit_location").value = client.location;
    document.getElementById("edit_contact").value = client.contact;
    document.getElementById("edit_phone").value = client.phone;
    document.getElementById("edit_name").readOnly = true; // 업체명은 수정 불가
}

// 모달창 닫기 (수정)
closeEditModal.onclick = function() {
    editModal.style.display = "none";
}

// 모달창 외부 클릭 시 닫기 (수정)
window.onclick = function(event) {
    if (event.target == editModal) {
        editModal.style.display = "none";
    }
}

// 수정 폼 제출
document.getElementById("editClientForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const clientData = {
        client_id: document.getElementById("edit_client_id").value,
        location: document.getElementById("edit_location").value,
        contact: document.getElementById("edit_contact").value,
        phone: document.getElementById("edit_phone").value
    };

    const xhr = new XMLHttpRequest();
    xhr.open("PUT", "updateClient", true);
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send(JSON.stringify(clientData));

    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("거래처가 성공적으로 수정되었습니다.");
            editModal.style.display = "none";
            getList(); // 목록 갱신
        } else {
            alert("거래처 수정에 실패했습니다.");
        }
    };
});

// 목록에서 수정 버튼 클릭 시 수정 모달 열기
function attachEditButtons() {
    document.querySelectorAll(".editBtn").forEach(button => {
        button.addEventListener("click", function() {
            const client = JSON.parse(this.dataset.client); // 수정할 거래처 정보 가져오기
            openEditModal(client); // 수정 모달 열기
        });
    });
}



let currentPage = 1;
const itemsPerPage = 5;
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
                 <td>\${client.client_id}</td>
                 <td>\${client.name}</td>
                 <td>\${client.location}</td>
                 <td>\${client.contact}</td>
                 <td>\${client.phone}</td>
                 <td>\${client.email}</td>
                 <td>\${new Date(client.create_at).toISOString().split('T')[0]}</td>
                 <td><button class="editBtn" data-client='\${JSON.stringify(client)}'>수정</button></td> <!-- 수정 버튼 추가 -->
                 <td><button class="deleteBtn" data-client-id='\${client.client_id}'>삭제</button></td> <!-- 삭제 버튼 추가 -->

                 </tr>`;
    }
    document.querySelector("#list").innerHTML = html;
    attachEditButtons(); // 수정 버튼에 클릭 이벤트 추가
    attachDeleteButtons(); // 삭제 버튼 이벤트 연결

}
//삭제 버튼 클릭 이벤트 추가 함수
function attachDeleteButtons() {
    document.querySelectorAll(".deleteBtn").forEach(button => {
        button.addEventListener("click", function() {
            const clientId = this.dataset.clientId; // 삭제할 거래처 ID 가져오기

            if (confirm("정말로 삭제하시겠습니까?")) {
                deleteClient(clientId); // 삭제 요청 함수 호출
            }
        });
    });
}

// 거래처 삭제 함수
function deleteClient(clientId) {
    const xhr = new XMLHttpRequest();
    url = "deleteClient"
    	const data = {
    		"client_id":client_id
    }
    xhr.open("DELETE", url); // 삭제 요청 보내기
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.send();

    xhr.onload = function() {
        if (xhr.status === 200) {
            alert("거래처가 성공적으로 삭제되었습니다.");
            getList(); // 목록 갱신
        } else {
            alert("거래처 삭제에 실패했습니다.");
        }
    };
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