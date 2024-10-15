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
	/////////////////////////////////////////////////////////////////////////////////////////////////////////
    // 게시판 버튼 클릭 시 AJAX 요청
    $('.boardBtn').click(function() {
        var boardId = $(this).data('board-id'); // 선택한 게시판 ID 가져오기
        var searchType = $('#searchType').val(); // 검색 타입
        var searchKeyword = $('#searchKeyword').val(); // 검색 키워드
        var page = $('#currentPage').val(); // 현재 페이지
        var countPerPage = $('#countPerPage').val(); // 페이지 당 게시물 수
        $('#selectBoard_id').val(boardId);
		var boardName = $(this).data('board-name');  // 버튼의 data-board-name 값 가져오기
        var boardDesc = $(this).data('board-desc');  // 버튼의 data-board-desc 값 가져오기

        // h1과 span 태그 내용을 변경
        $('h1').text(boardName);  // h1 태그 내용 변경
        $('span').text(boardDesc);  // span 태그 내용 변경

        // AJAX 요청
        $.ajax({
            type: "POST",
            url: "post.ajax",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify({
                "board_id": boardId,
                "searchType": searchType,
                "searchKeyword": searchKeyword,
                "page": page,
                "countPerPage": countPerPage
            }), // 모든 조건을 JSON 형식으로 전송
            success: function(response) {
                // 응답 데이터를 이용해 테이블 업데이트
                var tableBody = $("#postTable tbody");
                tableBody.empty();

                $.each(response.list, function(index, post) {
                    var row = '<tr>' +
                        '<td>' + post.rnum + '</td>' +
                        '<td>' + post.board_name + '</td>' +
                        '<td><a href="post.read?post_id=' + post.post_id + '">' + post.title + '</a></td>' +
                        '<td>' + post.author_name + '</td>' +
                        '<td>' + formatDate(post.created_at) + '</td>' +
                        '<td>' + post.view_cnt + '</td>' +
                    '</tr>';
                    tableBody.append(row);
                });
            },
            error: function(error) {
                console.error("에러 발생:", error);
            }
        });
        if (window.location.search.length > 0) {
		    var newUrl = window.location.origin + window.location.pathname;
		    window.history.replaceState({}, document.title, newUrl);
		}
		
		$('#searchInputText').val('');
    });
    
    $('.newPostBtn').click(function(){
    	window.location.href = 'post.insert';
    });
    
    $('.newBoardBtn').click(function(){
    	window.location.href = 'board';
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

window.onload = function() {
        // 모든 hidden input 요소를 선택
        var createdAtElements = document.querySelectorAll('.created_at');
        
        createdAtElements.forEach(function(element) {
            var createdAt = new Date(element.value); // created_at 값을 Date로 변환
            var now = new Date(); // 현재 시간

            // 두 시간의 차이를 분 단위로 계산
            var diffMinutes = Math.floor((now - createdAt) / 1000 / 60);
            console.log(diffMinutes);
            // 9시간 30분 (570분) 이내일 경우 "new" 아이콘을 표시
            if (diffMinutes <= 570) {
            console.log("if문 true 실행");
                var parentElement = element.parentElement;
                var newPostIcon = parentElement.querySelector('.newPostIcon');
                console.log(newPostIcon);
                console.log(parentElement);

                if (newPostIcon) {
                    newPostIcon.style.display = 'inline'; // newPostIcon을 보이도록 설정
                }
            }
        });
    };
