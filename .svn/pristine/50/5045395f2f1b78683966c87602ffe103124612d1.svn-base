<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    
    <link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>

	<!-- bootstrap-paginator 显示分页 -->
	<script type="application/javascript" src="js/bootstrap-paginator.min.js"></script>

	<!-- 工具类 -->
	<script type="application/javascript" src="js/util.js"></script>

	<!-- bootstrap-table -->
	<link href="css/bootstrap-table.min.css" rel="stylesheet">
	<script src="js/bootstrap-table.min.js"></script>
	<script src="js/bootstrap-table-zh-CN.min.js"></script>

	<!-- DataTables -->
	<link href="css/jquery.dataTables.min.css" rel="stylesheet">
	<script src="js/jquery.dataTables.min.js"></script>
	
	<!-- JQuery操作cookie -->
	<script type="text/javascript" src="js/jquery.cookie.js"></script>
	<style type="text/css">
        #table th, #table td { 
			text-align: center;
			vertical-align: middle!important;
		}
    </style>
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>预警</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so layui-form-pane">
          <input class="layui-input" placeholder="" name="cate_name">
          <input type="hidden" value="${param.cate_name}">
          <button class="layui-btn" lay-submit="" lay-filter="sreach" onclick="customSearch()" id="search">查询</button>
        </form>
      </div>
      
      <div>
		<table id="table"></table>
	  </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
      </xblock>
    </div>
    
    <script type="text/javascript">
    	$(function(){
    		//"Authorization" : 'Bearer ' + $.cookie("Token")
			var pageNumber = 1;
			var pageSize = 10;
			var data = getJSONS("https://api.ziotc.com/v1/user/alarm/count", "get", {
				"Authorization" : 'Bearer ' + $.cookie("Token")
				//"Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ"
					}, {});
			var total = data.data;
			$('#table').bootstrapTable({
				url: 'https://api.ziotc.com/v1/user/alarm/page', //请求后台的URL（*）
	            method: 'get',   //请求方式（*）
	            ajaxOptions:{
			        headers : {
			        	"Authorization" : 'Bearer ' + $.cookie("Token"),
			        	//"Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ",
						"Accept": "application/json"
					}
			    },
	            striped: true,             //是否显示行间隔色
	            cache: false,              //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true,          //是否显示分页（*）
	            sortable: true,            //是否启用排序
	            sortOrder: "asc",          //排序方式
	            sidePagination: "server",  //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:pageNumber,     //初始化加载第一页，默认第一页
	            pageSize: pageSize,        //每页的记录行数（*）
	            pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
	
	            strictSearch: true,
	            //minimumCountColumns: 2,    //最少允许的列数
	            clickToSelect: true,         //是否启用点击选中行
	
	            silentSort: false,               //分页时保留排序
	            responseHandler:function (res) { //将返回的数据转成需要的格式
	               	var data = res.data;
	               	$.each(data,function(index, object){
	               		$.each(object,function(key, value){
	               			if(key == "isRead"){
		               			value == 0 ? data[index].isRead = "已读" : data[index].isRead = "未读";
	               			}
	               			if(key == "createDate"){
	               				data[index].createDate = new Date(parseInt(value)).toLocaleString();
	               			}
	               			if(key == "status"){
		               			value == 2 ? data[index].status = "预警" : data[index].status = "正常";
	               			}
	               		})
	               	})
	                return {
	                	"total" : total,
	                	"rows" : data
	                };
	            },
	
	            queryParamsType:'limit',    //启用传参
				queryParams: queryParams,	//传参函数
	            columns: [{
	                checkbox: true
	            }, {
	                field: 'deviceName',
	                title: '监测项目'
	            }, {
	                field: 'sensorName',
	                title: '传感器'
	            }, {
	                field: 'content',
	                title: '报警内容'
	            }, {
	                field: 'isRead',
	                title: '是否已读'
	            },{
	                field: 'status',
	                title: '预警状态'
	            },{
	                field: 'createDate',
	                title: '预警时间'
	            },{
	                field: 'Button',
	                title: '操作',
	                events: "operateEvents",
       				formatter: operateFormatter
	            },]
	        });
			
			
			function queryParams(params) {
				var name = $("form>input[type='hidden']").val();
			    return {
			        page: params.offset/params.limit+1,
			        size: params.limit,
			        deviceName: name,
			    };
			}
	
			function customSearch(text) {
			    $("#table").bootstrapTable('refresh');//刷新Table，Bootstrap Table 会自动执行重新查询
			}
			
			//添加操作按钮
			function operateFormatter(value, row, index) {
	            return [
	                "<button type='button' id='cut' class='btn btn-danger'>删除</button>"   
    				//"<a title='删除' id='cut'><i class='layui-icon'>删除</i></a>"
	            ].join('');
       		}
       		
       		//为按钮添加事件
       		window.operateEvents = {
		         'click #cut': function (e, value, row, index) {
			          layer.confirm('确认要删除吗？',function(index){
			              //发异步删除数据
			              /* $(obj).parents("tr").remove();
			              layer.msg('已删除!',{icon:1,time:1000}); */
			              $.ajax({
							type : "",
							url : url,
							dataType : 'json',
							data : data,
							headers : headers,
							async : false,
							success : function(data) {
								message = data;
							},
							error : function(xhr, text) {
								alert("fail");
							}
						});
			         });         
		         }
	        };
		})
	</script>
  </body>

</html>