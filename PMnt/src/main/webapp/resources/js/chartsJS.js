const ctx1 = document.getElementById("chart-1").getContext("2d");

var chartData =[];

const myChart = new Chart(ctx1, {
  type: "doughnut",
  data: {
    labels: [], // 초기에는 빈 배열로 설정
    datasets: [
      {
        label: "# of Votes",
        data: [],
        backgroundColor: [
          "rgba(54, 162, 235, 1)",
          "rgba(255, 99, 132, 1)",
          "rgba(255, 206, 86, 1)",
          "rgba(204, 0, 225, 1)",
          "rgba(10, 179, 55, 1)",
          "rgba(35, 255, 255, 1)",
          "rgba(150, 20, 10, 1)",
          "rgba(34, 51, 156, 1)",
          
        ],
      },
    ],
  },
  options: {
    responsive: true,
  },
});
function chartVal(data) {
  console.log(data);
  chartData = data;
	
  // 데이터를 받은 후에 labels를 업데이트합니다.
  myChart.data.labels = chartData.map((item) => item.syproduct);
  myChart.data.datasets[0].data = chartData.map((item) => item.sycnt);

  myChart.update();
  }

// ==============꺾은선차트==========
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
