
// 클릭시 페이지를 로드 하는 함수를 전달인자로 전달
function 클릭시페이지로드(x,y){


// DOMContentLoaded 이벤트 리스너로 페이지 로드 완료시 함수가 실행 되게 하기.
document.addEventListener('DOMContentLoaded', function () {
    clicked(x, y);
});

// clicked 함수
function clicked(buttonId, url) {
    var button = document.getElementById(buttonId);
    if (button) {
        button.addEventListener('click', function (event) {
            event.preventDefault();
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState == 4) {
                    if (xhr.status == 200) {
                        document.getElementById('pageContent').innerHTML = xhr.responseText;
                    } else {
                        console.error('Error loading the page: ' + xhr.status);
                    }
                }
            };
            xhr.send();
        });
    } else {
        console.error('Element with ID ' + buttonId + ' not found.');
    }
}
}