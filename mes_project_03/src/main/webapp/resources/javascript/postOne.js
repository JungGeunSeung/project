document.addEventListener("DOMContentLoaded", function () {

    // 댓글 수정 버튼 처리
    document.querySelectorAll('.commentModifyBtn').forEach(button => {
        button.addEventListener('click', function (event) {
            const commentContainer = event.target.closest('.comment-container');
            const commentTextDiv = commentContainer.querySelector('.comment-text');
            const originalText = commentTextDiv.textContent.trim(); // 기존 댓글 내용

            if (button.textContent === '수정') {
                // textarea로 변환
                const textarea = document.createElement('textarea');
                textarea.classList.add('comment-input');
                textarea.value = originalText;
                commentTextDiv.innerHTML = ''; // 기존 내용 제거
                commentTextDiv.appendChild(textarea); // textarea 추가
                button.textContent = '저장'; // 버튼 텍스트를 '저장'으로 변경
            } else {
                // 저장 버튼 클릭 시 처리
                const textarea = commentTextDiv.querySelector('textarea');
                const updatedText = textarea.value.trim(); // 수정된 댓글 내용
                const commentId = commentContainer.querySelector('input[name="comment_id"]').value;

                if (!updatedText) {
                    alert("댓글 내용을 입력하세요.");
                    return;
                }

                // AJAX 요청으로 수정된 댓글 내용 전송
                fetch('updateComment', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({
                        comment_id: commentId,
                        content: updatedText
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        commentTextDiv.textContent = updatedText; // textarea를 다시 텍스트로 변경
                        button.textContent = '수정'; // 버튼 텍스트를 '수정'으로 되돌림
                    } else {
                        alert("댓글 수정에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("오류가 발생했습니다: " + error.message);
                });
            }
        });
    });
    
    // 댓글 삭제 버튼 처리
    document.querySelectorAll('.commentDeleteBtn').forEach(button => {
        button.addEventListener('click', function (event) {
            const commentContainer = event.target.closest('.comment-container');
            const commentId = commentContainer.querySelector('input[name="comment_id"]').value;

            // 삭제 확인
            if (confirm("이 댓글을 삭제하시겠습니까?")) {
                // AJAX 요청으로 댓글 삭제
                fetch('deleteComment', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        comment_id: commentId
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // 댓글이 성공적으로 삭제되면 DOM에서 제거
                        commentContainer.remove();
                    } else {
                        alert("댓글 삭제에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("오류가 발생했습니다: " + error.message);
                });
            }
        });
    });
    

    // 답글 수정 버튼 처리
    document.querySelectorAll('.replyModifyBtn').forEach(button => {
        button.addEventListener('click', function (event) {
            const replyContainer = event.target.closest('.reply-container');
            const replyTextDiv = replyContainer.querySelector('.reply-text');
            const originalText = replyTextDiv.textContent.trim(); // 기존 답글 내용

            if (button.textContent === '수정') {
                // textarea로 변환
                const textarea = document.createElement('textarea');
                textarea.classList.add('reply-input');
                textarea.value = originalText;
                replyTextDiv.innerHTML = ''; // 기존 내용 제거
                replyTextDiv.appendChild(textarea); // textarea 추가
                button.textContent = '저장'; // 버튼 텍스트를 '저장'으로 변경
            } else {
                // 저장 버튼 클릭 시 처리
                const textarea = replyTextDiv.querySelector('textarea');
                const updatedText = textarea.value.trim(); // 수정된 답글 내용
                const replyId = replyContainer.querySelector('input[name="reply_id"]').value;

                if (!updatedText) {
                    alert("답글 내용을 입력하세요.");
                    return;
                }

                // AJAX 요청으로 수정된 답글 내용 전송
                fetch('reply.update', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Accept': 'application/json'
                    },
                    body: JSON.stringify({
                        reply_id: replyId,
                        content: updatedText
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        replyTextDiv.textContent = updatedText; // textarea를 다시 텍스트로 변경
                        button.textContent = '수정'; // 버튼 텍스트를 '수정'으로 되돌림
                    } else {
                        alert("답글 수정에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("오류가 발생했습니다: " + error.message);
                });
            }
        });
    });
    
    // 답글 삭제 버튼 처리
    document.querySelectorAll('.replyDeleteBtn').forEach(button => {
        button.addEventListener('click', function (event) {
            const replyContainer = event.target.closest('.reply-container');
            const replyId = replyContainer.querySelector('input[name="reply_id"]').value;

            // 삭제 확인
            if (confirm("이 답글을 삭제하시겠습니까?")) {
                // AJAX 요청으로 답글 삭제
                fetch('reply.delete', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        reply_id: replyId
                    })
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        // 답글이 성공적으로 삭제되면 DOM에서 제거
                        replyContainer.remove();
                    } else {
                        alert("답글 삭제에 실패했습니다.");
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert("오류가 발생했습니다: " + error.message);
                });
            }
        });
    });
    
    // 답글쓰기 버튼 처리 - 답글 작성 폼을 보여줌
    document.querySelectorAll('.reply-btn').forEach(button => {
        button.addEventListener('click', function (event) {
            const commentId = button.getAttribute('data-comment-id'); // 클릭한 댓글의 ID 가져오기
            const replyForm = document.getElementById('reply-form-' + commentId); // 해당 댓글의 답글 작성 폼 선택

            // 답글 작성 폼 토글 (숨기기/보이기)
            if (replyForm.style.display === 'none' || !replyForm.style.display) {
                replyForm.style.display = 'block'; // 답글 작성 폼 보이기
            } else {
                replyForm.style.display = 'none'; // 답글 작성 폼 숨기기
            }
        });
    });

    // 답글 저장 처리
    document.querySelectorAll('.reply-save-btn').forEach(button => {
        button.addEventListener('click', function (event) {
            const commentId = button.getAttribute('data-comment-id'); // 댓글 ID 가져오기
            const replyInput = document.getElementById('reply-input-' + commentId); // 해당 댓글의 답글 입력 필드
            const replyContent = replyInput.value.trim(); // 입력된 답글 내용
            const postId = document.getElementById('post_id').value; // 게시글 ID

            if (!replyContent) {
                alert("답글을 입력하세요.");
                return;
            }

            // AJAX 요청으로 답글 전송
            fetch('reply.save', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `comment_id=${encodeURIComponent(commentId)}&content=${encodeURIComponent(replyContent)}`
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("답글이 성공적으로 저장되었습니다.");
                    replyInput.value = ''; // 입력 필드 초기화
                    window.location.reload(); // 페이지 새로고침으로 답글 반영
                } else {
                    alert("답글 저장에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("오류가 발생했습니다: " + error.message);
            });
        });
    });

});
