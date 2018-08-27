<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<title>后台登录-X-admin2.0</title>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" href="./css/font.css">
		<link rel="stylesheet" href="./css/xadmin.css">
	</head>

	<body>
		<fieldset class="layui-elem-field">
            <blockquote class="layui-elem-quote"> 
				<div class="x-body">
					<div class="layui-row">
						<form >
							<div class="layui-form-item" id="select">
								<label class="layui-form-label">选择折线图：</label>
								<div class="layui-input-inline">
									<select name="sensor" id="sensor">
										<option value="null">请选择大棚：</option>
										<option value="KD0OZ7QSIHT5">大棚1</option>
										<option value="G9F1E3UA4TYC">大棚2</option>
										<option value="NCF64Y5GLQ93">大棚3</option>
										<option value="1UMEKDXWG0ZL">大棚4</option>
										<option value="6VRSM0TYGBF4">室外人参</option>
									</select>
								</div>
								<div class="layui-input-inline">
									<select name="time" id="time">
										<option value="minute">过去1小时</option>
										<option value="hour">过去24小时</option>
										<option value="week">过去一周</option>
										<option value="month">过去一个月</option>
									</select>
								</div>
								<div class="layui-input-inline">
									<select name="property" id="property">
										<option id="airTemperature" value="169G45YEMR28">空气温度</option>
										<option id="airHhumidity" value="Q9NSL45O0GME">空气湿度</option>
										<option id="Illuminance" value="XLQZ2AF6IGDC">光照</option>
										<option id="soilTemperature" value="MY6U10NVHF87">土壤温度</option>
										<option id="soilHumidity" value="UI5S47ME08WT">土壤湿度</option>
										<option id="co2" value="E7TPAF36GZ0H">CO2浓度</option>
										<option id="ph" value="3WUSL8BX24GF">PH值</option>
									</select>
								</div>
							</div>
						</form>
					</div>
				</div>
			</blockquote>
		</fieldset>
		<div class="x-body">
			<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
			<div id="main" style="width: 100%;height:400px;"></div>
		</div>
		<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="./js/chartUtil.js"></script>
		<script type="text/javascript" src="./js/util.js"></script>
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		
	</body>

</html>