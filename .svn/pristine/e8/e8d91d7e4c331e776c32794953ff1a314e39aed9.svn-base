$("#sensor").change(function() {
	//要触发的事件
	var sensor = $("#sensor").val();
	var senserurl = senserUrl(sensor);
	var data = getJSONS(senserurl,
		"get",
		{
			"Authorization" : 'Bearer ' + $.cookie("Token")
		},
		{});
	var rows = new Array();
	$.each(data.data, function(index, value) {
		var message = {
			name : value.name
		};
		if (value.name == "空气温度") {
			message.airTemperature = value.code;
		} else if (value.name == "空气湿度") {
			message.airHhumidity = value.code;
		} else if (value.name == "光照度") {
			message.Illuminance = value.code;
		} else if (value.name == "土壤温度") {
			message.soilTemperature = value.code;
		} else if (value.name == "土壤湿度") {
			message.soilHumidity = value.code;
		} else if (value.name == "二氧化碳浓度") {
			message.co2 = value.code;
		} else if (value.name == "土壤PH值") {
			message.ph = value.code;
		}
		rows[index] = message;
	});
	$("#airTemperature").val(rows[0].airTemperature);
	$("#airHhumidity").val(rows[1].airHhumidity);
	$("#Illuminance").val(rows[2].Illuminance);
	$("#soilTemperature").val(rows[3].soilTemperature);
	$("#soilHumidity").val(rows[4].soilHumidity);
	$("#co2").val(rows[5].co2);
	$("#ph").val(rows[6].ph);
	aClick();
});
$("#time").change(function() {
	//要触发的事件
	aClick();
});
$("#property").change(function() {
	//要触发的事件
	aClick();
});
function aClick() {
	var url = selectUrl();
	var data = getJSONS(url,
		"get",
		{
			"Authorization" : 'Bearer ' + $.cookie("Token")
		},
		{});
	// 基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
	// 指定图表的配置项和数据
	var option = {
		title : {
			text : '折线图堆叠'
		},
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			data : [
				$("#property").val()
			]
		},
		grid : {
			left : '3%',
			right : '4%',
			bottom : '3%',
			containLabel : true
		},
		toolbox : {
			feature : {
				saveAsImage : {}
			}
		},
		xAxis : {
			type : 'category',
			boundaryGap : false,
			data : data.data.xList
		},
		yAxis : {
			type : 'value'
		},
		series : [ {
			name : $("#property").val(),
			type : 'line',
			stack : '总量',
			data : data.data.yList
		} ]
	};
	// 使用刚指定的配置项和数据显示图表。
	myChart.setOption(option);
}
;
function selectUrl() {
	var property = $("#property").val();
	var time = $("#time").val();
	if (time == "minute") {
		var url = "https://api.ziotc.com/v1/user/sensor/" + property + "/statistics/minute?interval=2"
	}
	var url = "https://api.ziotc.com/v1/user/sensor/" + property + "/statistics/" + time + "?interval=1"
	return url;
}
function senserUrl(sensor) {
	var url = "https://api.ziotc.com/v1/user/sensor/list?device="+sensor;
	return url;
}