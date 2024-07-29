// 페이지 로드 시, 저장된 게시글을 로드
document.addEventListener('DOMContentLoaded', loadPosts);

document.getElementById('postbtn btn').addEventListener('click', () => {
    document.getElementById('npf').style.display = 'block';
});

document.getElementById('save').addEventListener('click', savePost);

function savePost() {
    const title = document.getElementById('ptitle').value;
    const content = document.getElementById('pcontent').value;
    const author = document.getElementById('paut').value;
    const date = new Date().toLocaleString();

    // 기존 게시글 가져오기
    const posts = JSON.parse(localStorage.getItem('posts')) || [];
    // 새 게시글 추가
    posts.push({ title, content, author, date, comments: [] });
    // 로컬스토리지에 저장
    localStorage.setItem('posts', JSON.stringify(posts));
    // 게시글 목록 로드
    loadPosts();

    // 새 글 작성 폼 초기화 및 숨김 처리
    document.getElementById('ptitle').value = '';
    document.getElementById('pcontent').value = '';
    document.getElementById('paut').value = '';
    document.getElementById('npf').style.display = 'none';
}

function loadPosts() {
    const postList = document.getElementById('list');
    postList.innerHTML = ''; // 게시글 목록 비우기

    const posts = JSON.parse(localStorage.getItem('posts')) || [];

    posts.forEach((post, index) => {
        const postItem = document.createElement('li');
        postItem.innerHTML = `
            <h3>${post.title}</h3>
            <p>${post.content}</p>
            <p>작성자: ${post.author} - ${post.date}</p>
            <button class="comment-button btn">댓글</button>
            <div class="comment-section" style="display: none;">
                <input type="text" placeholder="댓글 작성자"><br>
                <textarea placeholder="댓글 내용"></textarea><br>
                <button class="save-comment-button btn">댓글 저장</button>
            </div>
            <ul class="comment-list"></ul>
        `;
        postList.appendChild(postItem);

        // 댓글 버튼 이벤트 리스너 추가
        postItem.querySelector('.comment-button').addEventListener('click', () => {
            const commentSection = postItem.querySelector('.comment-section');
            commentSection.style.display = commentSection.style.display === 'none' ? 'block' : 'none';
        });

        // 댓글 저장 이벤트 리스너 추가
        postItem.querySelector('.save-comment-button').addEventListener('click', () => {
            saveComment(index);
        });

        // 댓글 로드
        loadComments(post.comments, postItem.querySelector('.comment-list'), index);
    });
}

function saveComment(postIndex) {
    const posts = JSON.parse(localStorage.getItem('posts')) || [];
    const postItem = document.querySelectorAll('#list li')[postIndex];
    const commentAuthor = postItem.querySelector('.comment-section input').value;
    const commentContent = postItem.querySelector('.comment-section textarea').value;
    const commentDate = new Date().toLocaleString();

    if (commentAuthor === '' || commentContent === '') {
        alert('댓글 작성자와 내용을 입력해주세요.');
        return;
    }

    // 댓글 추가
    const comment = { author: commentAuthor, content: commentContent, date: commentDate, replies: [] };
    posts[postIndex].comments.push(comment);
    localStorage.setItem('posts', JSON.stringify(posts));

    // 댓글 목록 업데이트
    loadPosts();
}

function loadComments(comments, commentList, postIndex) {
    comments.forEach((comment, commentIndex) => {
        const commentItem = document.createElement('li');
        commentItem.innerHTML = `
            <p><strong>${comment.author}:</strong> ${comment.content} <br><small>${comment.date}</small></p>
            <button class="reply-button">답글</button>
            <div class="reply-section" style="display: none;">
                <input type="text" placeholder="답글 작성자"><br>
                <textarea placeholder="답글 내용"></textarea><br>
                <button class="save-reply-button btn">답글 저장</button>
            </div>
            <ul class="reply-list"></ul>
        `;
        commentList.appendChild(commentItem);

        // 답글 버튼 이벤트 리스너 추가
        commentItem.querySelector('.reply-button').addEventListener('click', () => {
            const replySection = commentItem.querySelector('.reply-section');
            replySection.style.display = replySection.style.display === 'none' ? 'block' : 'none';
        });

        // 답글 저장 이벤트 리스너 추가
        commentItem.querySelector('.save-reply-button').addEventListener('click', () => {
            saveReply(postIndex, commentIndex);
        });

        // 답글 로드
        loadComments(comment.replies, commentItem.querySelector('.reply-list'), postIndex, commentIndex);
    });
}

function saveReply(postIndex, commentIndex) {
    const posts = JSON.parse(localStorage.getItem('posts')) || [];
    const postItem = document.querySelectorAll('#list li')[postIndex];
    const commentItem = postItem.querySelectorAll('.comment-list li')[commentIndex];
    const replyAuthor = commentItem.querySelector('.reply-section input').value;
    const replyContent = commentItem.querySelector('.reply-section textarea').value;
    const replyDate = new Date().toLocaleString();

    if (replyAuthor === '' || replyContent === '') {
        alert('답글 작성자와 내용을 입력해주세요.');
        return;
    }

    // 답글 추가
    const reply = { author: replyAuthor, content: replyContent, date: replyDate, replies: [] };
    posts[postIndex].comments[commentIndex].replies.push(reply);
    localStorage.setItem('posts', JSON.stringify(posts));

    // 답글 목록 업데이트
    loadPosts();
}
