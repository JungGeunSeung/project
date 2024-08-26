// 각 버튼과 해당 월의 테이블을 선택
let jan = document.querySelector('#btn1');
let one = document.querySelector('.monthHI1월');
let feb = document.querySelector('#btn2');
let two = document.querySelector('.monthHI2월');
let mar = document.querySelector('#btn3');
let three = document.querySelector('.monthHI3월');
let apr = document.querySelector('#btn4');
let four = document.querySelector('.monthHI4월');
let may = document.querySelector('#btn5');
let five = document.querySelector('.monthHI5월');
let jun = document.querySelector('#btn6');
let six = document.querySelector('.monthHI6월');
let jul = document.querySelector('#btn7');
let seven = document.querySelector('.monthHI7월');
let aug = document.querySelector('#btn8');
let eight = document.querySelector('.monthHI8월');
let sep = document.querySelector('#btn9');
let nine = document.querySelector('.monthHI9월');
let oct = document.querySelector('#btn10');
let ten = document.querySelector('.monthHI10월');
let nov = document.querySelector('#btn11');
let ele = document.querySelector('.monthHI11월');
let dec = document.querySelector('#btn12');
let twe = document.querySelector('.monthHI12월');

// 현재 표시된 테이블을 추적하는 변수
let All = null;

// 페이지 로드 시 모든 테이블을 표시
window.addEventListener('load', function() {
    document.querySelectorAll('.tableHI').forEach(el => {
        el.style.display = 'block';
    });
});

// 특정 테이블을 표시하고 다른 테이블을 숨기는 함수
function showOnlyTable(tableElement) {
    document.querySelectorAll('.tableHI').forEach(el => {
        el.style.display = 'none';
    });
    tableElement.style.display = 'block';
}

// 이벤트 리스너 설정
jan.addEventListener('click', function() {
    showOnlyTable(one);
});
feb.addEventListener('click', function() {
    showOnlyTable(two);
});
mar.addEventListener('click', function() {
    showOnlyTable(three);
});
apr.addEventListener('click', function() {
    showOnlyTable(four);
});
may.addEventListener('click', function() {
    showOnlyTable(five);
});
jun.addEventListener('click', function() {
    showOnlyTable(six);
});
jul.addEventListener('click', function() {
    showOnlyTable(seven);
});
aug.addEventListener('click', function() {
    showOnlyTable(eight);
});
sep.addEventListener('click', function() {
    showOnlyTable(nine);
});
oct.addEventListener('click', function() {
    showOnlyTable(ten);
});
nov.addEventListener('click', function() {
    showOnlyTable(ele);
});
dec.addEventListener('click', function() {
    showOnlyTable(twe);
});

// "전체" 버튼 클릭 시 모든 테이블 표시
allBtn.addEventListener('click', function() {
    document.querySelectorAll('.tableHI').forEach(el => {
        el.style.display = 'block';
    });
});