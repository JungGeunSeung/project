  // 데이터 가져오기
  const productionData = [5180, 3250, 4680, 5190, 3750, 4430, 4970, 2310, 2430, 3890, 4860, 3750];

  // 차트 그리기
  const ctx = document.getElementById('productionChart').getContext('2d');
  const productionChart = new Chart(ctx, {
      type: 'pie',
      data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [{
              label: '총 생산량',
              data: productionData,
              backgroundColor: [
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)',
                  'rgba(255, 99, 132, 0.2)',
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 206, 86, 0.2)',
                  'rgba(75, 192, 192, 0.2)',
                  'rgba(153, 102, 255, 0.2)',
                  'rgba(255, 159, 64, 0.2)'
              ],
              borderColor: [
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)',
                  'rgba(255, 99, 132, 1)',
                  'rgba(54, 162, 235, 1)',
                  'rgba(255, 206, 86, 1)',
                  'rgba(75, 192, 192, 1)',
                  'rgba(153, 102, 255, 1)',
                  'rgba(255, 159, 64, 1)'
              ],
              borderWidth: 1
          }]
      },
      options: {
        responsive: false,  // 반응형 차트 비활성화
        // maintainAspectRatio: false,  // 기본 비율 유지 비활성화
          plugins: {
              legend: {
                  position: 'top',
              },
              title: {
                  display: true,
                  text: '2024년 월별 총 생산량'
              }
          }
      }
  });

  // 데이터 가져오기
  const achievementData = [123, 97, 95, 97, 93, 93, 110, 96, 91, 97, 101, 98];

  // 차트 그리기
  const ctx2 = document.getElementById('achievementChart').getContext('2d');
  const achievementChart = new Chart(ctx2, {
      type: 'bar',
      data: {
          labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
          datasets: [{
              label: '월별 목표 달성률 (%)',
              data: achievementData,
              backgroundColor: 'rgba(54, 162, 235, 0.5)',
              borderColor: 'rgba(54, 162, 235, 1)',
              borderWidth: 1
          }]
      },
      options: {
          responsive: false,  // 반응형 차트 비활성화
          maintainAspectRatio: false,  // 기본 비율 유지 비활성화
          scales: {
              y: {
                  beginAtZero: true,
                  ticks: {
                      callback: function(value) {
                          return value + '%';  // y축에 % 기호 추가
                      }
                  }
              }
          },
          plugins: {
              legend: {
                  position: 'top',
              },
              title: {
                  display: true,
                  text: '2024년 월별 목표 달성률'
              }
          }
      }
  });
