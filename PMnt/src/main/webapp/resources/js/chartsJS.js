const ctx1 = document.getElementById("chart-1").getContext("2d");
const myChart = new Chart(ctx1, {
  type: "doughnut",
  // ===============원형차트=============
  data: {
    labels: ["딸기", "사과", "수박"],
    datasets: [
      {
        label: "# of Votes",
        data: [600, 800, 1000],
        backgroundColor: [
          "rgba(54, 162, 235, 1)",
          "rgba(255, 99, 132, 1)",
          "rgba(255, 206, 86, 1)",
        ],
      },
    ],
  },
  options: {
    responsive: true,
  },
});
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
