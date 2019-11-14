// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function random(num)
{	
	switch(num)
	{
	case 1:
		{
			var rand = Math.floor(Math.random() * 10);
			return (rand+1) * 10;
			break;
		}
	case 2:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 10;
		break;
	}
	case 3:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 8;
		break;
	}
	case 4:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 6;
		break;
	}
	case 5:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 4;
		break;
	}
	case 6:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 2;
		break;
	}
	case 7:
	{
		var rand = Math.floor(Math.random() * 10);
		return (rand+1) * 1 ;
		break;
	}
	}
}

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["이직", "사원", "대리", "과장", "차장", "부장", "이사"],
    datasets: [{
      data: [random(1), random(2), random(3), random(4), random(5), random(6), random(7)],
      backgroundColor: ['#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c','#a024d1','#c6d611'],
      hoverBackgroundColor: ['#eb2d07', '#2e59d9', '#17a673', '#2c9faf','#397d6c','#a024d1','#c6d611'],
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
