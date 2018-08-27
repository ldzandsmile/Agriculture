<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta charset="UTF-8">
<title>后台登录-X-admin2.0</title>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>

</head>
<body class="login-bg">

	<div class="login layui-anim layui-anim-up">
		<div class="message">x-admin2.0-管理登录</div>
		<div id="darkbannerwrap"></div>

		<form method="post" class="layui-form">
			<input name="username" placeholder="用户名" type="text"
				lay-verify="required" class="layui-input" maxlength="20">
			<hr class="hr15">
			<input name="password" lay-verify="required" placeholder="密码"
				type="password" class="layui-input" maxlength="20">
			<hr class="hr15">
			<input value="登录" lay-submit lay-filter="login" style="width:100%;"
				type="submit">
			<hr class="hr20">
		</form>
	</div>

	<script>
		$(function() {
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(login)', function(data) {
				
					var flag = false;
					$.ajax({
						type : "POST",
						url : "LoginServlet",
						dataType : "json",
						async : false,
						// TODO 缺陷：明文传输 
						data : JSON.stringify(data.field),
						success : function(responseMessage) {
							if(responseMessage.status == 200)
								flag = true;
						}
					});
					
					if(flag){
						location.href = 'index.jsp';
					}else{
						layer.msg("用户名或者密码错误", function() {
						});
					}
					
					return false;
				});
			});
		})
	</script>


	<!-- 底部结束 -->
</body>
</html>
