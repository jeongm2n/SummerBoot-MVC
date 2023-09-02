// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function storePerRes(name, res) {
	const purearrayName = name.slice(1, -1).split(",");
	const Name = [];
	for(var i =0; i<purearrayName.length; i++) {
		var idx = purearrayName[i].split(" ");
		Name.push(idx[idx.length-1]);
	}
	console.log(Name);
	const pureRes = res.slice(1, -1).split(",");
	const pureArrayRes = [];
	for(var i=0; i < pureRes.length; i++) {
		pureArrayRes.push(pureRes[i].trim());
	}
	
	let mapRes = new Map();
	let data = [];
	for(var i = 0; i < pureArrayRes.length; i++) {
		mapRes.set(pureArrayRes[i].split("=")[0], pureArrayRes[i].split("=")[1]);
	}
	for(var i=0; i < purearrayName.length; i++) {
		console.log(purearrayName[i]);
		if(mapRes.has(purearrayName[i].trim())) {
			console.log(mapRes);
			console.log("Name : " + purearrayName[i]);
			console.log("get : " + mapRes.get(purearrayName[i]));
			data.push(parseInt(mapRes.get(purearrayName[i].trim())));
		} else {
			data.push(0);
		}
	}
	
	console.log(data);
	// Bar Chart Example
	var ctx = document.getElementById("myBarChart");
	var myBarChart = new Chart(ctx, {
	  type: 'bar',
	  data: {
	    labels: Name,
	    datasets: [{
	      label: "예약",
	      backgroundColor: "rgba(253, 141, 20, 1)",
	      hoverBackgroundColor: "#FD8008",
	      borderColor: "rgba(253, 141, 20, 1)",
	      data: data
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    layout: {
	      padding: {
	        left: 10,
	        right: 25,
	        top: 25,
	        bottom: 0
	      }
	    },
	    scales: {
	      xAxes: [{
	        gridLines: {
	          display: false,
	          drawBorder: false
	        },
	        ticks: {
	          maxTicksLimit: purearrayName.length
	        }
	      }],
	      yAxes: [{
	        ticks: {
	          min: 0,
	          maxTicksLimit: 5,
	          padding: 10,
	          // Include a dollar sign in the ticks
	          callback: function(value) {
	            return value + "건";
	          }
	        },
	        gridLines: {
	          color: "rgb(234, 236, 244)",
	          zeroLineColor: "rgb(234, 236, 244)",
	          drawBorder: false,
	          borderDash: [2],
	          zeroLineBorderDash: [2]
	        }
	      }],
	    },
	    legend: {
	      display: false
	    },
	    tooltips: {
	      titleMarginBottom: 10,
	      titleFontColor: '#6e707e',
	      titleFontSize: 14,
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	      callbacks: {
	        label: function(tooltipItem) {
	          return '예약 : ' + tooltipItem.yLabel + "건";
	        }
	      }
	    },
	  }
	});
}
