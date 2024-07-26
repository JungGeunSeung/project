let postsPerPage = 5;
let currentPage = 1;

// 로컬스토리지에서 게시글 목록을 불러와서 화면에 표시하는 함수
function loadPosts() {
    let postList = document.getElementById('post-list');
    postList.innerHTML = '';

    let posts = JSON.parse(localStorage.getItem('posts')) || [];
    let totalPages = Math.ceil(posts.length / postsPerPage);
    let startIndex = (currentPage - 1) * postsPerPage;
    let endIndex = Math.min(startIndex + postsPerPage, posts.length);
    let currentPosts = posts.slice(startIndex, endIndex);

    currentPosts.forEach((post, index) => {
        let row = document.createElement('tr');
        row.className = 'body';

        let numCell = document.createElement('td');
        numCell.textContent = startIndex + index + 1;

        let titleCell = document.createElement('td');
        titleCell.className = 'title';
        titleCell.textContent = post.title;

        let authorCell = document.createElement('td');
        authorCell.textContent = post.author;

        let dateCell = document.createElement('td');
        dateCell.textContent = post.date;

        let manageCell = document.createElement('td');

        let editBtn = document.createElement('button');
        editBtn.textContent = '수정';
        editBtn.className = 'edit-btn btn';
        editBtn.onclick = () => editPost(startIndex + index);

        let deleteBtn = document.createElement('button');
        deleteBtn.textContent = '삭제';
        deleteBtn.className = 'delete-btn btn';
        deleteBtn.onclick = () => deletePost(startIndex + index);

        manageCell.appendChild(editBtn);
        manageCell.appendChild(deleteBtn);

        row.appendChild(numCell);
        row.appendChild(titleCell);
        row.appendChild(authorCell);
        row.appendChild(dateCell);
        row.appendChild(manageCell);

        postList.appendChild(row);
    });

    renderPagination(totalPages);
}

// 게시글 삭제 함수
function deletePost(index) {
    let posts = JSON.parse(localStorage.getItem('posts')) || [];
    posts.splice(index, 1);
    localStorage.setItem('posts', JSON.stringify(posts));
    loadPosts();
}

// 게시글 수정 함수
function editPost(index) {
    let posts = JSON.parse(localStorage.getItem('posts')) || [];
    let post = posts[index];
    let newTitle = prompt('새 제목을 입력하세요', post.title);
    let newAuthor = prompt('새 작성자를 입력하세요', post.author);
    let newContent = prompt('새 내용을 입력하세요', post.content);

    if (newTitle && newAuthor && newContent) {
        posts[index] = {
            ...post,
            title: newTitle,
            author: newAuthor,
            content: newContent,
            date: new Date().toLocaleDateString()
        };
        localStorage.setItem('posts', JSON.stringify(posts));
        loadPosts();
    } else {
        alert('모든 필드를 입력해주세요.');
    }
}

// 페이지네이션 렌더링 함수
function renderPagination(totalPages) {
    let pagination = document.getElementById('pagination');
    pagination.innerHTML = '';

    for (let i = 1; i <= totalPages; i++) {
        let pageBtn = document.createElement('button');
        pageBtn.textContent = i;
        pageBtn.onclick = () => {
            currentPage = i;
            loadPosts();
        };

        pagination.appendChild(pageBtn);
    }
}

// 페이지가 로드되면 게시글 목록을 불러옴
document.addEventListener('DOMContentLoaded', loadPosts);