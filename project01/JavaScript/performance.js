
function avg(selector) { // 전달인자로 선택자를 받아 함수를 실행
    let table = document.querySelector(selector) // 전달인자가 들어가 table라는 변수에 저장
    let td = table.getElementsByTagName("tbody")[0].getElementsByTagName("td"); // 저장된 변수의 tbody의 첫번째 배열을 가져와 td를 선택해 저장하는 변수
    let sum = 0; // 합을 넣기 위해 만든 변수
    let count = 0; // 합이 될때마다 카운트해서 총 몇개의 데이터가 합쳐졌는지 알기 위한 변수


    for (let i = 0; i < td.length; i++) {
        let value = parseFloat(td[i].innerText.replace('%','')); // 타입을 float으로 바꾸고 td를 반복문으로 저장
                                            // replace : td에 만약 %가 들어가 있으면 지우는 함수
        sum += value; // 저장된 td의 값을 sum 변수에 저장
        count++; // for문 한번 돌아갈때마다 ++
    }
    return sum / count;
}

document.getElementById("total").innerText ="총 생산량 : " + avg('#totaltable');
document.getElementById("monavg").innerText = avg('#montable') + "%";
document.getElementById("mongrowavg").innerText = avg('#mongrowtable').toFixed(2) + '%';

