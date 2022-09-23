// Graph
/*var ctx = document.getElementById("linechart");*/

/*new Chart("linechart", {
	type: "line",
	data: {
		labels: [
			"วันอาทิตย์",
			"วันจันทร์",
			"วันอังคาร",
			"วันพุธ",
			"วันพฤหัสบดี",
			"วันศุกร์",
			"วันเสาร์",
		],
		datasets: [
			{
				data: [15339, 21345, 18483, 24003, 23489, 24092, 12034],
				lineTension: 0,
				backgroundColor: "transparent",
				borderColor: "#007bff",
				borderWidth: 4,
				pointBackgroundColor: "#007bff",
			},
		],
	},
	options: {
		scales: {
			yAxes: [
				{
					ticks: {
						beginAtZero: false,
					},
				},
			],
		},
		legend: {
			display: false,
		},
		title: {
			display: true,
			text: "จำนวนผู้ใช้งานในแต่ละวัน"
		}
	}
}
);*/

// barChart
/*var xValues = ["มกราคม", "กุมภาพันธ์", "มีนาคม", "เมษายน", "พฤษภาคม", "มิถุนายน", "กรกฏาคม", "สิงหาคม", "กันยายน", "ตุลาคม", "พฤศจิกายน", "ธันวาคม"];
var yValues = [19, 24, 22, 24, 20, 25, 28, 25, 21, 17, 18, 20];
var barColors = [
	"#dc3545",
	"#e91e63",
	"#ffc107",
	"#252525",
	"#B23CFD",
	"#00B74A",
	"#39C0ED",
	"#ffea00",
	"#1de9b6",
	"#c6ff00",
	"#1976d2",
	"#0d6efd"
];

new Chart("barChart", {
	type: "bar",
	data: {
		labels: xValues,
		datasets: [{
			backgroundColor: barColors,
			data: yValues
		}]
	},
	options: {
		legend: { display: false },
		title: {
			display: true,
			text: "จำนวนสถิติผู้เข้าใช้งานเว็บไซต์รายปี"
		}
	}
});*/

// donutChart
/*var aValues = ["นิสิต / นักศึกษา", "อาจารย์", "นายจ้าง", "ผู้ดูแลระบบ"];
var bValues = [55, 49, 44, 24];
var barColors = [
	"#dc3545",
	"#0d6efd",
	"#ffc107",
	"#252525",
];

new Chart("donutChart", {
	type: "doughnut",
	data: {
		labels: aValues,
		datasets: [{
			backgroundColor: barColors,
			data: bValues
		}]
	},
	options: {
		title: {
			display: true,
			text: "จำนวนผู้ใช้งานของแต่ละประเภท"
		}
	}
});*/


