$(document).ready(function() {
    var pos = 0; // 현재 위치를 나타내는 변수
    var totalItems = $('#boardList .board-item').length; // 전체 항목 수

    // 슬라이드의 중앙 정렬을 위한 함수
    function calculateOffset(pos) {
        var itemWidth = $('#boardList .board-item').eq(pos).outerWidth(true); // 현재 항목의 너비 계산
        var sliderWidth = $('.board-list').width(); // 슬라이더의 너비
        return (sliderWidth - itemWidth) / 2; // 중앙에 위치하도록 오프셋 계산
    }

    // 가운데 정렬을 위한 슬라이드 이동 함수
    function slideTo(pos) {
        var itemWidths = 0; // 슬라이드 이동을 위한 너비 계산 변수

        // 현재 위치 이전의 모든 항목의 너비를 합산하여 계산
        $('#boardList .board-item').each(function(index) {
            if (index < pos) {
                itemWidths += $(this).outerWidth(true); // 현재 항목까지의 총 너비 계산
            }
        });

        var offset = calculateOffset(pos); // 중앙 정렬을 위한 오프셋 계산
        $('#boardList').css({
            'transform': 'translateX(' + -(itemWidths - offset) + 'px)',
            'transition': '0.5s ease' // 슬라이드 애니메이션
        });
    }

    // '다음' 버튼 클릭 시
    $('#nextBtn').click(function() {
        if (pos < totalItems - 1) {
            pos++;
            slideTo(pos);
            setActiveButton(pos); // 현재 선택된 버튼으로 상태 업데이트
        }
    });

    // '이전' 버튼 클릭 시
    $('#prevBtn').click(function() {
        if (pos > 0) {
            pos--;
            slideTo(pos);
            setActiveButton(pos); // 현재 선택된 버튼으로 상태 업데이트
        }
    });

    // 버튼 클릭 시 해당 버튼을 가운데 정렬하고 활성화 처리
    $('#boardList').on('click', '.boardBtn', function() {
        pos = $(this).closest('.board-item').index(); // 클릭한 버튼의 위치를 가져옴
        slideTo(pos); // 해당 위치로 슬라이드
        setActiveButton(pos); // 클릭한 버튼을 활성화 상태로 설정
    });

    // 활성화된 버튼에 배경색을 주는 함수
    function setActiveButton(index) {
        $('#boardList .boardBtn').removeClass('active-btn'); // 기존 활성화된 버튼의 스타일 제거
        $('#boardList .boardBtn').eq(index).addClass('active-btn'); // 현재 선택된 버튼에 스타일 추가
    }

    // 초기 로딩 시 첫 번째 항목('전체')을 선택하고 가운데로 이동
    setActiveButton(0);
    slideTo(0); // '전체' 버튼을 가운데로 이동
});

$(document).ready(function() {
    // 버튼 클릭 이벤트
    $('.boardBtn').click(function() {
        var boardId = $(this).data('board-id'); // 버튼 텍스트 가져오기

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "post.ajax", // 컨트롤러 URL
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({ "board_id": boardId }), // JSON 형식으로 데이터 전송
            success: function(response) {
                // 성공적으로 응답 받았을 때 처리
                console.log("응답 데이터:", response);

                // 기존 테이블 내용을 모두 지우고 새로운 데이터를 추가
                var tableBody = $("#postTable tbody");
                tableBody.empty(); // 기존 테이블 내용 제거

                // 응답받은 리스트 데이터를 반복하여 테이블에 추가
                $.each(response.list, function(index, post) {
                    var row = '<tr>' +
                        '<td>' + post.rnum + '<input type="hidden" name="post_id" value="' + post.post_id + '"></td>' +
                        '<td>' + post.board_name + '</td>' +
                        '<td><a href="post.read?post_id=' + post.post_id + '">' + post.title + '</a></td>' +
                        '<td>' + post.author_name + '</td>' +
                        '<td>' + formatDate(post.created_at) + '<input type="hidden" name="updated_at" value="' + post.updated_at + '"></td>' +
                        '<td>' + post.view_cnt + '</td>' +
                    '</tr>';
                    
                    tableBody.append(row); // 새로운 행을 테이블에 추가
                });
            },
            error: function(error) {
                // 에러 처리
                console.error("에러 발생:", error);
            }
        });
    });

    // 날짜 포맷팅 함수 (JavaScript에서 날짜 포맷 변경)
    function formatDate(dateString) {
        var date = new Date(dateString);
        var day = ('0' + date.getDate()).slice(-2);
        var month = ('0' + (date.getMonth() + 1)).slice(-2);
        var year = date.getFullYear();
        return year + '.' + month + '.' + day;
    }
});

    
    
    // 슬라이드에 있는 게시판을 클릭하면 게시글이 바뀌는 아작스

