<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>欢迎页面-X-admin2.0</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="./css/font.css">
<link rel="stylesheet" href="./css/xadmin.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/bootstrap-table.min.css" rel="stylesheet">
<link href="css/jquery.dataTables.min.css" rel="stylesheet">
<style type="text/css">
#table th, #table td {
	text-align: center;
	vertical-align: middle !important;
}
</style>
</head>
<body>
	<div class="x-body layui-anim layui-anim-up">
		<blockquote class="layui-elem-quote">
			欢迎管理员:&nbsp;&nbsp; <span class="x-red">${sessionScope.username }</span>！当前时间:&nbsp;&nbsp;${sessionScope.date }
		</blockquote>
		<fieldset class="layui-elem-field">
			<legend>数据统计</legend>
			<div class="layui-field-box">
				<div class="layui-col-md12">
					<div class="layui-card">
						<div class="layui-card-body">
							<div class="layui-carousel x-admin-carousel x-admin-backlog"
								lay-anim="" lay-indicator="inside" lay-arrow="none"
								style="width: 100%; height: 90px;">
								<div carousel-item="">
									<ul class="layui-row layui-col-space10 layui-this">
										<li class="layui-col-xs2"><a href="javascript:;"
											class="x-admin-backlog-body">
												<h3>监测数量</h3>
												<p>
													<cite id="deviceCount"></cite>
												</p>
										</a></li>
										<li class="layui-col-xs2"><a href="javascript:;"
											class="x-admin-backlog-body">
												<h3>传感器数量</h3>
												<p>
													<cite id="sensorNumberCount"></cite>
												</p>
										</a></li>
										<li class="layui-col-xs2"><a href="javascript:;"
											class="x-admin-backlog-body">
												<h3>监控数量</h3>
												<p>
													<cite id="sensorMediaCount"></cite>
												</p>
										</a></li>
										<li class="layui-col-xs2"><a href="javascript:;"
											class="x-admin-backlog-body">
												<h3>预警信息</h3>
												<p>
													<cite id="alarmCount"></cite>
												</p>
										</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</fieldset>


		<fieldset class="layui-elem-field">
			<legend>近期温湿度</legend>
			<div class="x-body">
				<table class="layui-table">
					<tbody>
						<tr>
							<td width="50%"><div id="main"
									style="width: 100%;height:200px;"></div></td>
							<td width="50%"><div id="main2"
									style="width: 100%;height:200px;"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
			<script src="//cdn.bootcss.com/echarts/3.3.2/echarts.min.js"
				charset="utf-8"></script>
			<script type="text/javascript"
				src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
			<script type="text/javascript" src="./js/mainChartUtil.js"></script>
			<script type="text/javascript" src="./js/util.js"></script>
			<script>
				aClick();
			</script>
		</fieldset>

		<fieldset class="layui-elem-field">
			<legend>监测项目列表</legend>
			<div class="layui-field-box">
				<table id="table"></table>
			</div>
		</fieldset>
	</div>
	<script>
		var _hmt = _hmt || [];
		(function() {
			var hm = document.createElement("script");
			hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
			var s = document.getElementsByTagName("script")[0];
			s.parentNode.insertBefore(hm, s);
		})();
	</script>

	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<!-- bootstrap-paginator 显示分页 -->
	<script type="application/javascript"
		src="js/bootstrap-paginator.min.js"></script>

	<!-- 工具类 -->
	<script type="application/javascript" src="js/util.js"></script>

	<!-- bootstrap-table -->
	<script src="js/bootstrap-table.min.js"></script>
	<script src="js/bootstrap-table-zh-CN.min.js"></script>

	<!-- DataTables -->
	<script src="js/jquery.dataTables.min.js"></script>

	<!-- JQuery操作cookie -->
	<script type="text/javascript" src="js/jquery.cookie.js"></script>

	<script type="text/javascript">
		$(function() {
			//添加总数
			var headers = {
				"Authorization" : 'Bearer ' + $.cookie("Token"),
			};
			var deviceCount = getJSONS("https://api.ziotc.com/v1/user/alarm/count?status=2&isRead=1", "get", headers, {});
			$("#deviceCount").text(deviceCount.data);
			var sensorNumberCount = getJSONS("https://api.ziotc.com/v1/user/sensor/count?type=number", "get", headers, {});
			$("#sensorNumberCount").text(sensorNumberCount.data);
			var sensorMediaCount = getJSONS("https://api.ziotc.com/v1/user/sensor/count?type=media", "get", headers, {});
			$("#sensorMediaCount").text(sensorMediaCount.data);
			var alarmCount = getJSONS("https://api.ziotc.com/v1/user/alarm/count?status=2", "get", headers, {});
			$("#alarmCount").text(alarmCount.data);
	
			var allMessage;
	
			var pageNumber = 1;
			var pageSize = 10;
			var data = getJSONS("https://api.ziotc.com/v1/user/device/list?isIndex=1&status=1", "get", {
				"Authorization" : 'Bearer ' + $.cookie("Token")
			}, {});
			var total = data.data.length;
	
			$('#table').bootstrapTable({
				url : 'https://api.ziotc.com/v1/user/device/list?isIndex=1&status=1', //请求后台的URL（*）
				method : 'get', //请求方式（*）
				ajaxOptions : {
					headers : {
						//"Authorization" : 'Bearer ' + $.cookie("Token"),
						"Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ",
						"Accept" : "application/json"
					}
				},
				striped : true, //是否显示行间隔色
				cache : false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
				pagination : true, //是否显示分页（*）
				sortable : true, //是否启用排序
				sortOrder : "asc", //排序方式
				sidePagination : "server", //分页方式：client客户端分页，server服务端分页（*）
				pageNumber : pageNumber, //初始化加载第一页，默认第一页
				pageSize : pageSize, //每页的记录行数（*）
				pageList : [ 10, 25, 50, 100 ], //可供选择的每页的行数（*）
	
				strictSearch : true,
				//minimumCountColumns: 2,    //最少允许的列数
				clickToSelect : true, //是否启用点击选中行
	
				silentSort : false, //分页时保留排序
				responseHandler : function(res) { //将返回的数据转成需要的格式
					var rows = new Array();
					$.each(res.data, function(index, object) {
						var message = {
							name : object.name,
							code : object.code
						};
						$.each(object.sensorList, function(key, value) {
							if (value.name == "空气温度") {
								message.airTemperature = value.value;
							} else if (value.name == "空气湿度") {
								message.airHhumidity = value.value;
							} else if (value.name == "光照度") {
								message.Illuminance = value.value;
							} else if (value.name == "土壤温度") {
								message.soilTemperature = value.value;
							} else if (value.name == "土壤湿度") {
								message.soilHumidity = value.value;
							} else if (value.name == "二氧化碳浓度") {
								message.co2 = value.value;
							} else if (value.name == "土壤PH值") {
								message.ph = value.value;
							} else if (value.name == "灌溉阈") {
								message.irrigation = value.value;
							} else if (value.name == "风机阈") {
								message.fan = value.value;
							}
						});
						rows[index] = message;
					});
					allMessage = rows;
					return {
						"total" : total,
						"rows" : rows,
					};
				},
	
				queryParamsType : 'limit', //启用传参
				queryParams : queryParams, //传参函数
				columns : [ {
					field : 'name',
					title : '监测项目'
				}, {
					field : 'airTemperature',
					title : '空气温度'
				}, {
					field : 'airHhumidity',
					title : '空气湿度'
				}, {
					field : 'Illuminance',
					title : '光照度'
				}, {
					field : 'soilTemperature',
					title : '土壤温度'
				}, {
					field : 'soilHumidity',
					title : '土壤湿度'
				}, {
					field : 'co2',
					title : '二氧化碳浓度'
				}, {
					field : 'ph',
					title : '土壤PH值'
				}, {
					field : 'Button',
					title : '操作',
					events : "operateEvents",
					formatter : operateFormatter
				}, ]
			});
	
	
			function queryParams(params) {
				var name = $("form>input[type='hidden']").val();
				return {
					page : params.offset / params.limit + 1,
					size : params.limit,
					deviceName : name,
				};
			}
	
			function customSearch(text) {
				$("#table").bootstrapTable('refresh'); //刷新Table，Bootstrap Table 会自动执行重新查询
			}
	
			//添加操作按钮
			function operateFormatter(value, row, index) {
				return [
					"<button type='button' id='details' class='btn btn-success'>详情</button>"
				].join('');
			}
	
			//为按钮添加事件
			window.operateEvents = {
				'click #details' : function(e, value, row, index) {
					window.location.href = "details.jsp?code="
					+ allMessage[index].code + "&airTemperature="
					+ allMessage[index].airTemperature + "&airHhumidity="
					+ allMessage[index].airHhumidity + "&Illuminance="
					+ allMessage[index].Illuminance + "&soilTemperature="
					+ allMessage[index].soilTemperature + "&soilHumidity="
					+ allMessage[index].soilHumidity + "&co2="
					+ allMessage[index].co2 + "&ph="
					+ allMessage[index].ph;
				}
			};
		})
	</script>
</body>
</html>