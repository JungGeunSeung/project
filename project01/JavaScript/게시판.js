let postsPerPage = 5; // 한 페이지에 표시할 게시글 수를 설정
let currentPage = 1; // 현재 페이지 번호를 설정

// 로컬스토리지에서 게시글 목록을 불러와서 화면에 표시하는 함수
function loadPosts() {
    let postList = document.getElementById('list'); // 게시글 목록을 표시할 HTML 요소를 선택
    postList.innerHTML = ''; // 게시글 목록을 비움

    let posts = JSON.parse(localStorage.getItem('posts')) || []; // 로컬스토리지에서 게시글을 불러오거나, 없으면 빈 배열을 사용
    let totalPages = Math.ceil(posts.length / postsPerPage); // 전체 페이지 수를 계산
    let startIndex = (currentPage - 1) * postsPerPage; // 현재 페이지의 시작 인덱스를 계산
    let endIndex = Math.min(startIndex + postsPerPage, posts.length); // 현재 페이지의 끝 인덱스를 계산
    let currentPosts = posts.slice(startIndex, endIndex); // 현재 페이지에 표시할 게시글을 슬라이스

    currentPosts.forEach((post, index) => { // 현재 페이지의 게시글을 반복하면서
        let row = document.createElement('tr'); // 새로운 테이블 행을 생성
        row.className = 'body'; // 행에 클래스를 설정

        let numCell = document.createElement('td'); // 번호를 표시할 셀을 생성
        numCell.textContent = startIndex + index + 1; // 셀에 번호를 설정

        let titleCell = document.createElement('td'); // 제목을 표시할 셀을 생성
        titleCell.className = 'title comm'; // 셀에 클래스를 설정
        titleCell.textContent = post.title; // 셀에 제목을 설정

        let authorCell = document.createElement('td'); // 작성자를 표시할 셀을 생성
        authorCell.className = 'author main_hidden';//셀에 클래스 설정
        authorCell.textContent = post.author; // 셀에 작성자를 설정

        let contentCall =document.createElement('td'); // 내용 셀을 표시할 셀을 생성
        contentCall.className = 'content_kw';
        contentCall.textContent = post.content;

        let dateCell = document.createElement('td'); // 날짜를 표시할 셀을 생성
        dateCell.textContent = post.date; // 셀에 날짜를 설정

        let manageCell = document.createElement('td'); // 관리 버튼을 표시할 셀을 생성

        let editBtn = document.createElement('button'); // 수정 버튼을 생성
        editBtn.textContent = '수정'; // 버튼 텍스트를 설정
        editBtn.className = 'edit-btn btn'; // 버튼에 클래스를 설정
        editBtn.onclick = () => editPost(startIndex + index); // 버튼 클릭 시 수정 함수를 호출

        let deleteBtn = document.createElement('button'); // 삭제 버튼을 생성
        deleteBtn.textContent = '삭제'; // 버튼 텍스트를 설정
        deleteBtn.className = 'delete-btn btn'; // 버튼에 클래스를 설정
        deleteBtn.onclick = () => deletePost(startIndex + index); // 버튼 클릭 시 삭제 함수를 호출

        let comment_Btn = document.createElement('button'); //댓글버튼 생성
        comment_Btn.textContent = '댓글';
        comment_Btn.className = 'cmment_btn btn';
        comment_Btn.onclick = () => comment_btn(index);

        manageCell.appendChild(editBtn); // 관리 셀에 수정 버튼을 추가
        manageCell.appendChild(deleteBtn); // 관리 셀에 삭제 버튼을 추가
        // manageCell.appendChild(comment_Btn);
        contentCall.appendChild(comment_Btn);

        row.appendChild(numCell); // 행에 번호 셀을 추가
        row.appendChild(titleCell); // 행에 제목 셀을 추가
        row.appendChild(contentCall); //행에 내용 셀을 추가
        row.appendChild(authorCell); // 행에 작성자 셀을 추가
        row.appendChild(dateCell); // 행에 날짜 셀을 추가
        row.appendChild(manageCell); // 행에 관리 셀을 추가

        postList.appendChild(row); // 게시글 목록에 행을 추가
    });

    renderPagination(totalPages); // 페이지네이션을 렌더링
}

// 게시글 삭제 함수
function deletePost(index) {
    let posts = JSON.parse(localStorage.getItem('posts')) || []; // 로컬스토리지에서 게시글을 불러오거나, 없으면 빈 배열을 사용
    posts.splice(index, 1); // 지정한 인덱스의 게시글을 삭제
    localStorage.setItem('posts', JSON.stringify(posts)); // 변경된 게시글 목록을 로컬스토리지에 저장
    loadPosts(); // 게시글 목록을 다시 불러옴
}

// 게시글 수정 함수
function editPost(index) {
    let posts = JSON.parse(localStorage.getItem('posts')) || []; // 로컬스토리지에서 게시글을 불러오거나, 없으면 빈 배열을 사용
    let post = posts[index]; // 수정할 게시글을 선택
    let newTitle = prompt('새 제목을 입력하세요', post.title); // 새로운 제목을 입력받음
    let newAuthor = prompt('새 작성자를 입력하세요', post.author); // 새로운 작성자를 입력받음
    let newContent = prompt('새 내용을 입력하세요', post.content); // 새로운 내용을 입력받음

    if (newTitle && newAuthor && newContent) { // 모든 필드가 입력되었는지 확인
        posts[index] = {
            ...post, // 기존 게시글 정보를 복사
            title: newTitle, // 제목을 새 제목으로 변경
            author: newAuthor, // 작성자를 새 작성자로 변경
            content: newContent, // 내용을 새 내용으로 변경
            date: new Date().toLocaleDateString() // 수정된 날짜를 현재 날짜로 설정
        };
        localStorage.setItem('posts', JSON.stringify(posts)); // 변경된 게시글 목록을 로컬스토리지에 저장
        loadPosts(); // 게시글 목록을 다시 불러옴
    } else {
        alert('모든 필드를 입력해주세요.'); // 필드가 모두 입력되지 않았을 경우 경고 메시지를 표시
    }
}

//게시글 댓글 함수
function comment_btn(index){
    let new_comment = prompt('댓글을 입력하세요', )
    let comment = document.querySelector('comm')
    comment.appendChild();
    comment.createElement('td')

}



// 페이지네이션 렌더링 함수
function renderPagination(totalPages) {
    let pagination = document.getElementById('pagination'); // 페이지네이션을 표시할 HTML 요소를 선택
    pagination.innerHTML = ''; // 페이지네이션 요소를 비움

    for (let i = 1; i <= totalPages; i++) { // 페이지 수만큼 반복하면서
        let pageBtn = document.createElement('button'); // 페이지 버튼을 생성
        pageBtn.textContent = i; // 버튼 텍스트를 페이지 번호로 설정
        pageBtn.onclick = () => {
            currentPage = i; // 버튼 클릭 시 현재 페이지를 변경
            loadPosts(); // 게시글 목록을 다시 불러옴
        };

        pagination.appendChild(pageBtn); // 페이지네이션 요소에 페이지 버튼을 추가
    }
}

// 페이지가 로드되면 게시글 목록을 불러옴
document.addEventListener('DOMContentLoaded', loadPosts); // DOMContentLoaded 이벤트가 발생하면 게시글 목록을 불러오는 함수를 호출
