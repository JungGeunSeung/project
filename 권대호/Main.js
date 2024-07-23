const params = new URLSearchParams(window.location.search);
//document.getElementById('name').textContent = params.get('name');
//document.getElementById('email').textContent = params.get('email');

document.addEventListener('DOMContentLoaded', function () {
    document.getElementById('loadPage').addEventListener('click', function (event) {
        event.preventDefault();
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '날짜별생산계획.html', true);
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
});