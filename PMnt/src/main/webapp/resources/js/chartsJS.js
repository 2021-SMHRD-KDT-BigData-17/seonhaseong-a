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
          "rgba(255, 99, 132, 1)", // 핑크
          "rgba(178, 209, 53, 1)", // 초록
          "rgba(138, 43, 226, 1)", // 보라
          "rgba(236, 56, 67, 1)", // 빨강
          "rgba(247, 193, 0, 1)", // 노랑
          "rgba(0, 186, 201, 1)", // 파랑
          "rgba(179, 255, 255, 1)",
          "rgba(179, 217, 255, 1)",
          
          
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
// const myChart2 = new Chart(ctx2, {
//  type: "line",
//  data: {
//    labels: ["2015","2016","2017","2018","2019","2020"],
//    datasets: [
//      {
//        label: "날씨",
//        data: [20,50,20,40,60,70],
//        backgroundColor: [
//          "rgba(54, 162, 235, 1)",
//        ],
//        borderColor: "rgba(54, 162, 235, 1)",
//     },
//      {
//        label: "검색",
//        data: [80,10,50,40,30,70],
//        backgroundColor: [
//          "rgba(255, 99, 132, 1)",
//        ],
//        borderColor: "rgba(255, 99, 132, 1)",
//      },
//      {
//        label: "유통",
//        data: [70,30,40,50,70,20],
//        backgroundColor: [
//         "rgba(255, 206, 86, 1)",
//        ],
//        borderColor: "rgba(255, 206, 86, 1)",
//      },
//    ],
//  },
//  options: {
//    responsive: true,
//  },
//});
function tempData(data) {
  const uniqueProducts = [...new Set(data.map(item => item.syproduct))]; // 중복 없는 syproduct 목록
  const uniquetemper = [...new Set(data.map(item => item.wtemperature))]; // 중복 없는 wtemperature 목록
  
  const colors = [
    "rgba(255, 99, 132, 1)", // 핑크
    "rgba(178, 209, 53, 1)", // 초록
    "rgba(138, 43, 226, 1)", // 보라
    "rgba(0, 186, 201, 1)", // 파랑
    "rgba(247, 193, 0, 1)", // 노랑
    "rgba(236, 56, 67, 1)", // 빨강
    "rgba(179, 255, 255, 1)",
    "rgba(179, 217, 255, 1)",
  ];
  
  const datasets = uniqueProducts.map((product, index) => {
    const filteredData = data.filter(item => item.syproduct === product);
    return {
      label: product,
      data: filteredData.map(item => item.sycnt),
      backgroundColor: colors[index % colors.length],
      borderColor: colors[index % colors.length],
    };
  });

  const ctx2 = document.getElementById("chart-2").getContext("2d");
  const myChart2 = new Chart(ctx2, {
    type: "line",
    data: {
      labels: uniquetemper,
      datasets: datasets,
    },
    options: {
      responsive: true,
    },
  });
}

