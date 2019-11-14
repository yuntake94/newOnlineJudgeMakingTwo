// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';



// Pie Chart Example
var ctx = document.getElementById("myPieChart2");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["서울대", "연세대", "고려대", "서강대", "성균관대", "한양대", "중앙대", "경희대", "한국외대", "서울시립대", "부산대", "경북대"],
    datasets: [{
      data: [2,5,7,6,7,8,8,10,7,10,7,12],
      backgroundColor: ['#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c','#a024d1','#c6d611','#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c'],
      hoverBackgroundColor: ['#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c','#a024d1','#c6d611','#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
