let originalTextNodes = [];  // 원래 한글 텍스트를 저장할 배열

window.addEventListener('load', function () {
    const languageSelect = document.getElementById('languageSelect');
    languageSelect.addEventListener('change', translatePage); // 언어 변경 시 translatePage 호출

    // 페이지 로드 시 모든 텍스트 노드를 저장
    originalTextNodes = getTextNodesUnder(document.body).map(node => ({
        node: node,
        originalText: node.nodeValue.trim()  // 각 텍스트 노드와 원래 텍스트 저장
    }));
});

// 모든 텍스트 노드를 찾는 함수
function getTextNodesUnder(node) {
    const textNodes = [];
    const walker = document.createTreeWalker(node, NodeFilter.SHOW_TEXT, null, false);
    let currentNode;

    while (currentNode = walker.nextNode()) {
        if (currentNode.nodeValue.trim() !== '') {
            textNodes.push(currentNode);
        }
    }

    return textNodes;
}

function translatePage() {
    const lang = document.getElementById('languageSelect').value;
    const loading = document.querySelector('.loading-overlay');

    loading.classList.remove('hidden'); // 로딩 css 보이기

    // 만약 선택된 언어가 'ko' (한국어)라면 원래 한글 텍스트로 복원
    if (lang === 'ko') {
        originalTextNodes.forEach(item => {
            item.node.nodeValue = item.originalText;  // 원래 텍스트로 복원
        });
        loading.classList.add('hidden'); // 언어 복원 후 로딩 애니메이션 숨기기
        return;  // 더 이상 번역 API 호출하지 않음
    }

    // 한국어 외의 언어로 번역 (Google Translate API 호출)
    let remainingRequests = originalTextNodes.length; // 모든 요청이 끝나는지 추적하기 위한 변수

    originalTextNodes.forEach(function (item) {
        const text = item.originalText;  // 원래 텍스트에서 번역 요청

        // XMLHttpRequest 객체 생성
        const xhr = new XMLHttpRequest();
        xhr.open('POST', 'translate', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

        // 서버에서 번역된 텍스트 받기
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                item.node.nodeValue = xhr.responseText;  // 번역된 텍스트로 교체

                // 모든 요청이 완료되면 로딩 애니메이션 숨기기
                remainingRequests--;
                if (remainingRequests === 0) {
                    loading.classList.add('hidden');
                }
            }
        };

        xhr.onerror = function () {
            console.error('번역 중 오류 발생');
            remainingRequests--;
            if (remainingRequests === 0) {
                loading.classList.add('hidden'); // 오류 발생 시에도 로딩 애니메이션 숨김
            }
        };

        // 서버로 번역할 텍스트와 언어를 전송
        xhr.send(`text=${encodeURIComponent(text)}&lang=${encodeURIComponent(lang)}`);
    });
}
