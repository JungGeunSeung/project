document.addEventListener("DOMContentLoaded", function() {
    // 이벤트 델리게이션 방식으로 수정
    document.body.addEventListener('click', function(event) {
        // "수정" 버튼이 클릭된 경우
        if (event.target.classList.contains('comment-actions') && event.target.textContent === '수정') {
            const commentContainer = event.target.closest('.comment-container');
            const commentTextDiv = commentContainer.querySelector('.comment-text');
            const originalText = commentTextDiv.textContent; // 기존 댓글 내용 저장
            
            // textarea를 생성하고 기존 텍스트를 넣어줌
            const textarea = document.createElement('textarea');
            textarea.classList.add('comment-input');
            textarea.value = originalText;
            
            // 댓글 내용을 textarea로 대체
            commentTextDiv.innerHTML = '';  // 기존 내용을 지우고
            commentTextDiv.appendChild(textarea);  // textarea 추가
            
            // 버튼 텍스트를 '저장'으로 변경
            event.target.textContent = '저장';
        
        // "저장" 버튼이 눌렸을 때
        } else if (event.target.classList.contains('comment-actions') && event.target.textContent === '저장') {
            const commentContainer = event.target.closest('.comment-container');
            const textarea = commentContainer.querySelector('.comment-text textarea');
            const updatedText = textarea.value; // 수정된 댓글 내용 가져오기
            const commentId = commentContainer.querySelector('input[name="comment_id"]').value; // comment_id 가져오기
            
            // AJAX 요청으로 수정된 댓글 내용과 comment_id 서버로 전송
            fetch('updateComment', {
			    method: 'POST',
			    headers: {
			        'Content-Type': 'application/json',  // 보내는 데이터가 JSON임을 명시
			        'Accept': 'application/json'         // 서버로부터 JSON 응답을 기대
			    },
			    body: JSON.stringify({
			        comment_id: commentId,
			        content: updatedText
			    })
			})
			.then(response => {
			    const contentType = response.headers.get('content-type');
			    if (contentType && contentType.includes('application/json')) {
			        return response.json();  // JSON 응답으로 처리
			    } else {
			        throw new Error("JSON이 아닌 응답을 받았습니다.");
			    }
			})
			.then(data => {
			    if (data.success) {
			        // 성공적으로 댓글 수정
			        const commentTextDiv = commentContainer.querySelector('.comment-text');
			        commentTextDiv.textContent = updatedText;  // textarea를 원래 div로 변경
			        event.target.textContent = '수정';  // 버튼 텍스트를 '수정'으로 되돌림
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
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    document.body.addEventListener('click', function(event) {
        // "삭제" 버튼이 클릭되었는지 확인
        if (event.target.classList.contains('comment-actions') && event.target.textContent === '삭제') {
            const commentContainer = event.target.closest('.comment-container');
            const commentId = commentContainer.querySelector('input[name="comment_id"]').value; // comment_id 가져오기
            
            // 확인 메시지
            if (!confirm("이 댓글을 삭제하시겠습니까?")) {
                return;
            }
            
            // AJAX 요청으로 comment_id 서버로 전송하여 댓글 삭제
            fetch('deleteComment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    comment_id: commentId
                })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    // 성공적으로 삭제되었으면 해당 댓글 DOM 요소를 삭제
                    commentContainer.remove();
                } else {
                    alert("댓글 삭제에 실패했습니다.");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("오류가 발생했습니다.");
            });
        }
    });
    
    document.getElementById('deleteForm').addEventListener('submit', function(event) {
        var confirmed = confirm("정말 삭제하시겠습니까?");
        if (!confirmed) {
            // 삭제 취소 시 폼 제출 방지
            event.preventDefault();
        }
    });
    
    //////////////////////////////////////////////////////////////
    // "답글쓰기" 버튼을 클릭하면 답글 입력창을 토글로 보여줌
    $(".reply-btn").click(function() {
        var commentId = $(this).data("comment-id");
        $("#reply-form-" + commentId).toggle(); // 해당 댓글의 입력창을 토글
    });

    // "저장하기" 버튼 클릭 시 AJAX 요청
    $(".reply-save-btn").click(function() {
        var commentId = $(this).data("comment-id");
        var replyContent = $("#reply-input-" + commentId).val(); // 입력된 답글 내용

        if (replyContent.trim() === "") {
            alert("답글을 입력해주세요.");
            return;
        }

        // AJAX로 데이터 전송
        $.ajax({
            url: "reply.save",
            type: "POST",
            data: {
                comment_id: commentId,
                content: replyContent
            },
            success: function(response) {
                alert("답글이 성공적으로 저장되었습니다.");
                // 필요한 경우 새로 추가된 답글을 화면에 바로 표시
                $("#reply-form-" + commentId).hide(); // 입력창 숨기기
                $("#reply-input-" + commentId).val(""); // 입력창 초기화
            },
            error: function() {
                alert("답글 저장 중 오류가 발생했습니다.");
            }
        });
    });
    
});
