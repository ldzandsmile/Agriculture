function aClick() {
	// 基于准备好的dom，初始化echarts实例
	var data1 = getJSONS("https://api.ziotc.com/v1/user/sensor/XKNE8AR3DTVB/statistics/hour?interval=1",
			"get" ,
			{"Authorization" : 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ'},
			{});
	var data2 = getJSONS("https://api.ziotc.com/v1/user/sensor/7MWD5TBK0ZYH/statistics/hour?interval=1",
			"get" ,
			{"Authorization" : 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ'},
			{});
	var myChart = echarts.init(document.getElementById('main'));
	var myChart2 = echarts.init(document.getElementById('main2'));
	// 指定图表的配置项和数据
	var option = {
		title: {
			text: '折线图堆叠'
		},
		tooltip: {
			trigger: 'axis'
		},
		legend: {
			data: [
			   '温度'
			]
		},
		grid: {
			left: '3%',
			right: '4%',
			bottom: '3%',
			containLabel: true
		},
		toolbox: {
			feature: {
				saveAsImage: {}
			}
		},
		xAxis: {
			type: 'category',
			boundaryGap: false,
			data: data1.data.xList
		},
		yAxis: {
			type: 'value'
		},
		series: [{
			name: '温度',
			type: 'line',
			stack: '总量',
			data: data1.data.yList
		}]
	};
	var option2 = {
			title: {
				text: '折线图堆叠'
			},
			tooltip: {
				trigger: 'axis'
			},
			legend: {
				data: [
				   '湿度'
				]
			},
			grid: {
				left: '3%',
				right: '4%',
				bottom: '3%',
				containLabel: true
			},
			toolbox: {
				feature: {
					saveAsImage: {}
				}
			},
			xAxis: {
				type: 'category',
				boundaryGap: false,
				data: data2.data.xList
			},
			yAxis: {
				type: 'value'
			},
			series: [{
				name: '湿度',
				type: 'line',
				stack: '总量',
				data: data2.data.yList
			}]
		};

	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
	myChart2.setOption(option2);
};
