var context = document
        .getElementById('myChart')
        .getContext('2d');
    var myChart = new Chart(context, {
        type: 'doughnut', // 차트의 형태
        data: { // 차트에 들어갈 데이터
            labels: [
                //x 축
                "딸기", "사과", "수박"
            ],
            datasets: [
                { //데이터
                    label: '총 판매량', //차트 제목
                    fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                    data: [
                        600, 800, 1000//x축 label에 대응되는 데이터 값
                    ],
                    backgroundColor: [
                        //색상
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                       
                    ],
                    borderColor: [
                        //경계선 색상
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                       
                    ],
                    borderWidth: 1 //경계선 굵기
                }
                   
            ]
        },
        options: {
            scales: {
                yAxes: [
                    {
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });

const ctx2 = document.getElementById("chart-2").getContext("2d");
const myChart2 = new Chart(ctx2, {
  type: "line",
  data: {
    labels: ["2015","2016","2017","2018","2019","2020"],
    datasets: [
      {
        label: "날씨",
        data: [20,50,20,40,60,70],
        backgroundColor: [
          "rgba(54, 162, 235, 1)",
        ],
        borderColor: "rgba(54, 162, 235, 1)",
      },
      {
        label: "검색",
        data: [80,10,50,40,30,70],
        backgroundColor: [
          "rgba(255, 99, 132, 1)",
        ],
        borderColor: "rgba(255, 99, 132, 1)",
      },
      {
        label: "유통",
        data: [70,30,40,50,70,20],
        backgroundColor: [
          "rgba(255, 206, 86, 1)",
        ],
        borderColor: "rgba(255, 206, 86, 1)",
      },
    ],
  },
  options: {
    responsive: true,
  },
});

    document.getElementById("myChart").onclick = function(evt) {
        var activePoints = myChart.getElementsAtEvent(evt);

        if(activePoints.length > 0)
        {
            var clickedElementindex = activePoints[0]["_index"];

            var label = myChart.data.labels[clickedElementindex];
            console.log("label : " + label);

            var value = myChart.data.datasets[0].data[clickedElementindex];
            console.log("value : " + value);
        }
    }