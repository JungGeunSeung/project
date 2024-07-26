
function avg(selector) {
    let table = document.querySelector(selector)
    // console.log(table)
    let td = table.getElementsByTagName("tbody")[0].getElementsByTagName("td");
    // console.log(td)
    let sum = 0;
    let count = 0;


    for (let i = 0; i < td.length; i++) {
        let value = parseFloat(td[i].innerText.replace('%',''));
        
        sum += value;
        count++;
    }
    return sum / count;
}

document.getElementById("total").innerText ="총 생산량 : " + avg('#totaltable');
document.getElementById("monavg").innerText = avg('#montable') + "%";
document.getElementById("weekavg").innerText = avg('#weektable');
document.getElementById("mongrowavg").innerText = avg('#mongrowtable').toFixed(2) + '%';