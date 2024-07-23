function 클릭시페이지로드(x,y){


// DOMContentLoaded 이벤트 리스너를 한 번만 등록
document.addEventListener('DOMContentLoaded', function () {
    clicked(x, y);
});

// clicked 함수 정의
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