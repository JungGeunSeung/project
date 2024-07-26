const postsPerPage = 5;
        let currentPage = 1;

        // 로컬스토리지에서 게시글 목록을 불러와서 화면에 표시하는 함수
        function loadPosts() {
            const postList = document.getElementById('post-list');
            postList.innerHTML = '';

            const posts = JSON.parse(localStorage.getItem('posts')) || [];
            const totalPages = Math.ceil(posts.length / postsPerPage);
            const startIndex = (currentPage - 1) * postsPerPage;
            const endIndex = Math.min(startIndex + postsPerPage, posts.length);
            const currentPosts = posts.slice(startIndex, endIndex);

            currentPosts.forEach((post, index) => {
                const row = document.createElement('tr');
                row.className = 'body';

                const numCell = document.createElement('td');
                numCell.textContent = startIndex + index + 1;

                const titleCell = document.createElement('td');
                titleCell.className = 'title';
                titleCell.textContent = post.title;

                const authorCell = document.createElement('td');
                authorCell.textContent = post.author;

                const dateCell = document.createElement('td');
                dateCell.textContent = post.date;

                const manageCell = document.createElement('td');

                const editBtn = document.createElement('button1');
                editBtn.textContent = '수정';
                editBtn.className = 'edit-btn';
                editBtn.onclick = () => editPost(startIndex + index);

                const deleteBtn = document.createElement('button1');
                deleteBtn.textContent = '삭제';
                deleteBtn.className = 'delete-btn';
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
            const posts = JSON.parse(localStorage.getItem('posts')) || [];
            posts.splice(index, 1);
            localStorage.setItem('posts', JSON.stringify(posts));
            loadPosts();
        }

        // 게시글 수정 함수
        function editPost(index) {
            const posts = JSON.parse(localStorage.getItem('posts')) || [];
            const post = posts[index];
            const newTitle = prompt('새 제목을 입력하세요', post.title);
            const newAuthor = prompt('새 작성자를 입력하세요', post.author);
            const newContent = prompt('새 내용을 입력하세요', post.content);

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
            const pagination = document.getElementById('pagination');
            pagination.innerHTML = '';

            for (let i = 1; i <= totalPages; i++) {
                const pageBtn = document.createElement('button1');
                pageBtn.textContent = i;
                pageBtn.onclick = () => {
                    currentPage = i;
                    loadPosts();
                };

                if (i === currentPage) {
                    pageBtn.style.fontWeight = 'bold';
                }

                pagination.appendChild(pageBtn);
            }
        }

        // 페이지가 로드되면 게시글 목록을 불러옴
        document.addEventListener('DOMContentLoaded', loadPosts);