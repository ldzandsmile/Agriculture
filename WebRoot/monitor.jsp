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
	
	<!-- 添加框样式 -->
	<link href="css/edit.css" rel="stylesheet">
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
          <cite>监测</cite></a>
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
	  
	  <div class="edit hide middle">
		<p>设置监测项目</p><hr>
		<form id="monitorEdit">
			<span>监测项目：</span>
			<input class="input1" type="text" name="monitor_name"><br> 
			<span>备注信息：</span>
			<input class="input1" type="text" name="monitor_remark"><br>
			<input class="input2" type="submit" value="确定">
			<button class="input2">取消</button>
		</form>
	  </div>
	  <!--↓遮罩-->
	  <div class="mark hide">
		 <div class="content"></div>
	  </div>
	  
	  <div id="index" style="display:none;">
		<button class="layui-btn layui-btn-danger" id="indexShow">设置首页显示</button>
		<button class="layui-btn layui-btn-danger" id="indexHidden">设置首页隐藏</button>
	  </div>
	</div>
	<script type="text/javascript">
		$(function(){
			var pageNumber = 1;
			var pageSize = 10;
			var data = getJSONS("https://api.ziotc.com/v1/user/device/count  ", "get", {
				"Authorization" : 'Bearer ' + $.cookie("Token")
				//"Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ"
					}, {});
			var total = data.data;
			
			$('#table').bootstrapTable({
	            url: 'https://api.ziotc.com/v1/user/device/page', //请求后台的URL（*）
	            method: 'get',  //请求方式（*）
	            ajaxOptions:{
			        headers : {
			        	"Authorization" : 'Bearer ' + $.cookie("Token"),
			        	//"Authorization" : "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ",
						"Accept": "application/json"
					}
			    },
	            striped: true,  //是否显示行间隔色
	            cache: false,   //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	            pagination: true, //是否显示分页（*）
	            sortable: true,   //是否启用排序
	            sortOrder: "asc", //排序方式
	            sidePagination: "server",   //分页方式：client客户端分页，server服务端分页（*）
	            pageNumber:pageNumber,      //初始化加载第一页，默认第一页
	            pageSize: pageSize,           //每页的记录行数（*）
	            pageList: [10, 25, 50, 100],  //可供选择的每页的行数（*）
	
	            strictSearch: true,
	            //minimumCountColumns: 2,   //最少允许的列数
	            clickToSelect: true,        //是否启用点击选中行
	            onCheck : function(){
	            	$("#index").attr("style","display:block;");
	            },    //选中行点击事件
	            onUncheck : function(){
	            	if($('#table').bootstrapTable('getSelections') == ""){
		            	$("#index").attr("style","display:none;");
	            	}
	            },    //取消选中行点击事件
	            onCheckAll : function(){
	            	$("#index").attr("style","display:block;");
	            },    //全选
	            onUncheckAll : function(){
	            	$("#index").attr("style","display:none;");
	            },    //全不选
	            
	            silentSort: false,                  //分页时保留排序
	            responseHandler:function (res) {    //将返回的数据转成需要的格式
	               	var data = res.data;
	               	$.each(data,function(index, object){
	               		$.each(object,function(key, value){
	               			if(key == "isIndex"){
		               			value == 0 ? data[index].isIndex = "隐藏" : data[index].isIndex = "显示";
	               			}
	               			if(key == "isOnline"){
	    						value == 0 ? data[index].isOnline = "离线" : data[index].isOnline = "在线";
	               			}
	               		})
	               	})
	                return {
	                	"total" : total,
	                	"rows" : data
	                };
	            },
	
	            queryParamsType:'limit',   //启用传参
				queryParams: queryParams,  //传参函数
	
	            columns: [{
	                checkbox: true
	            }, {
	                field: 'name',
	                title: '监测项目'
	            }, {
	                field: 'macAddress',
	                title: 'MAC'
	            }, {
	                field: 'ipAddress',
	                title: 'IP'
	            }, {
	                field: 'remark',
	                title: '备注'
	            },{
	                field: 'versionNumber',
	                title: '版本号'
	            },{
	                field: 'isIndex',
	                title: '首页显示'
	            },{
	                field: 'isOnline',
	                title: '在线状态',
	            },{
	                field: 'Button',
	                title: '操作',
	                events: "operateEvents",     //设置操作事件
       				formatter: operateFormatter  //设置操作按钮
	            },{
	                field: 'code',
	                title: '设备唯一标识',
	                visible: false
	            }]
	        });
			
			//设置返回参数
			function queryParams(params) {
				var name = $("form>input[type='hidden']").val();
			    return {
			        page: params.offset/params.limit+1,
			        size: params.limit,
			        name: name,
			    };
			}
	
			function customSearch(text) {
			    $("#table").bootstrapTable('refresh');//刷新Table，Bootstrap Table 会自动执行重新查询
			}
			
			//添加操作按钮
			function operateFormatter(value, row, index) {
	            return [
					"<button type='button' id='edit' class='btn btn-info'>编辑</button>"," ",
	               	"<button type='button' id='cut' class='btn btn-danger'>删除</button>"   
	            ].join('');
       		}
       		
       		//为修改，删除按钮添加事件
       		window.operateEvents = {
	            'click #edit': function (e, value, row, index) {
	            	$(".mark").removeClass("hide");
	       			$(".edit").removeClass("hide"); 
	       			var monitor_name = $("table").find("tr").eq(index+1).find("td").eq(1).text();
	       			var monitor_remark = $("table").find("tr").eq(index+1).find("td").eq(4).text();
	       			$(".edit>form>input[name=monitor_name]").attr("value",monitor_name);
	       			$(".edit>form>input[name=monitor_remark]").attr("value",monitor_remark);
		         },
		         'click #cut': function (e, value, row, index) {
			          layer.confirm('确认要删除吗？',function(index){
			              //发异步删除数据
			             /*  $(obj).parents("tr").remove();
			              layer.msg('已删除!',{icon:1,time:1000}); */
			         });         
		         }
	        };
       		
       		//点击取消 移除弹窗
       		$(".edit>button").click(function() {
       			$(".mark").addClass("hide");
       			$(".edit").addClass("hide");
       		});
       		
       		//点击确定 修改
       		$(".edit>form>input[type=submit]").click(function() {
       			var selectAll = $('#table').bootstrapTable('getSelections');
       			var monitor_name = $(".edit>form>input[name=monitor_name]").val();
       			var monitor_remark = $(".edit>form>input[name=monitor_remark]").val();
       			$(".mark").addClass("hide");
       			$(".edit").addClass("hide");
       			var url = "https://api.ziotc.com/v1/user/device/"
       					+ selectAll[0].code + "/update?name="
       					+ monitor_name + "&remark=" + monitor_remark;

       			var headers = {"Authorization" : 'Bearer ' + $.cookie("Token")};
        		var edit = getJSONS(url,"put",headers, {});
       		});

           	var url = "https://api.ziotc.com/v1/user/device/index?codes=";
       		//为首页显示按钮添加事件
       		$("#indexShow,#indexHidden").click(function(e){
       			url = "https://api.ziotc.com/v1/user/device/index?codes=";
	       		var selectAll = $('#table').bootstrapTable('getSelections');
           		for(var i = 0; i<selectAll.length; i++){
           			if(i == selectAll.length-1){
           				url += selectAll[i].code;
           			}else{
	           			url += selectAll[i].code + ",";
           			}
           		}
				$(e.target).attr("id") == "indexShow" ? url += "&index=1" : url += "&index=0";
       		});
       		
       		//确认弹窗
       		$("#index").on('click', ['#indexShow','#indexHidden'], function() {
       			var msg = "是否确认此操作？";
       			if (confirm(msg) == true) {
       				var data = getJSONS(url, "put", {
    	    			"Authorization" : 'Bearer ' + $.cookie("Token")
    	    		}, {});
       				return true;
       			} else {
       				return false;
       			}
       		});
		})
	</script>
	
  </body>

</html>