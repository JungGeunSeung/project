// 인풋 타입 데이트 타입에 태그에 현재 날짜와 일주일 전을 표시하게 하는 함수
function getTodayDate() {
    let today = new Date();
    let year = today.getFullYear();
    let month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
    let day = String(today.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
}

function getlastweekDate() {
    let today = new Date();
    let year = today.getFullYear();
    let month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
    let day = String(today.getDate() - 7).padStart(2, '0');
    return `${year}-${month}-${day}`;
}




document.querySelector('#enddate').value = getTodayDate();
document.querySelector('#startdate').value = getlastweekDate();


