const calendar = document.getElementById('calendar');

function generateCalendar(year, month) {
    const today = new Date(); // 현재 날짜 가져오기
    const currentYear = today.getFullYear();
    const currentMonth = today.getMonth();
    const currentDate = today.getDate();
    
    const firstDay = new Date(year, month, 1);
    const lastDay = new Date(year, month + 1, 0);
    
    const daysInMonth = lastDay.getDate();
    const startingDay = firstDay.getDay(); // 요일 (0부터 6: 일요일부터 토요일)
    
    const monthNames = ['January', 'February', 'March', 'April', 'May', 'June',
                        'July', 'August', 'September', 'October', 'November', 'December'];
    
    let html = '<h2>' + monthNames[month] + ' ' + year + '</h2>';
    html += '<table>';
    html += '<tr><th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th></tr>';
    
    let day = 1;
    
    for (let i = 0; i < 6; i++) {
        html += '<tr>';
        for (let j = 0; j < 7; j++) {
            if (i === 0 && j < startingDay) {
                html += '<td></td>';
            } else if (day > daysInMonth) {
                break;
            } else {
                // 현재 날짜에 클래스 추가
                let className = (year === currentYear && month === currentMonth && day === currentDate) ? 'today' : '';
                html += '<td class="calendar-day ' + className + '" data-day="' + day + '">' + day + '</td>';
                day++;
            }
        }
        html += '</tr>';
        if (day > daysInMonth) {
            break;
        }
    }
    
    html += '</table>';
    calendar.innerHTML = html;
}

// 현재 연도와 월을 기준으로 달력 생성
const currentDate = new Date();
generateCalendar(currentDate.getFullYear(), currentDate.getMonth());

// 호버 기능 추가
calendar.addEventListener('mouseover', function(e) {
    if (e.target.classList.contains('calendar-day')) {
        const day = e.target.dataset.day;
        e.target.setAttribute('title', day);
    }
});
