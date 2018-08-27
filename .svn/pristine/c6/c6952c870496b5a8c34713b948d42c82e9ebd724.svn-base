<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

</head>

<body>
	<script type="text/javascript"
		src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript" src="./js/chartUtil.js"></script>
	<script type="text/javascript" src="./js/util.js"></script>
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<script type="text/javascript">
		var data = getJSONS("https://api.ziotc.com/v1/user/device/G9F1E3UA4TYC",
			"get",
			{
				"Authorization" : 'Bearer ' + $.cookie("Token")
			},
			{});
		 var rows = new Array();
		$.each(data.data.sensorList, function(index, value) {
			var message = {
				name : value.name
			};
			if (value.name == "空气温度") {
				alert(value.topicMapping.publicTopic);
				alert(value.topicMapping.receiveTopic);
				alert(value.value);
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
	</script>
</body>
</html>
