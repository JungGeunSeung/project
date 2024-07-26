    // 새로운 Chart 객체를 생성하여 bar-chart ID를 가진 캔버스 요소에 차트를 그립니다.
    new Chart(document.getElementById("bar-chart"), {
      type: 'bar', // 차트의 종류를 'bar'로 설정 (막대 차트)
      data: {
        labels: ["1공정", "2공정", "3공정", "4공정", "5공정"], // x축 라벨 설정
        datasets: [
          {
            label: "Population (millions)", // 데이터셋 레이블
            backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"], // 막대 색상
            data: [2478,5267,734,784,433] // 각 라벨에 해당하는 데이터 값
          }
        ]
      },
      options: {
        legend: { display: true }, // 범례 표시 여부
        title: {
          display: true, // 제목 표시 여부
          text: '공정현황' // 차트 제목
        }
      }
  });