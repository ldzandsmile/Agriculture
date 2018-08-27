/*
 * 
 * url: 访问路径
 * type: 访问方式 get，post，put，delete
 * headers: 消息头 json格式
 * data: 参数 没有就输入 {}
 * 成功返回响应信息，失败返回fail
 * */
function getJSONS(url, type, headers, data) {
	var message = "fail";
	$.ajax({
		type : type,
		url : url,
		dataType : 'json',
		data : data,
		headers : headers,
		async : false,
		success : function(data) {
			message = data;
		},
		error : function(xhr, text) {
		}
	});
	return message;
}

/*
 * data: json
 * keys: 集合
 * 
 * 此方法会依次将json中key值 于keys匹配的值显示到 table 中，
 * 注意：次页面只能有一个table 
 */
function addTable(data, keys){
	var tr = $("<tr></tr>");
	tr.append("<td> <div class='layui-unselect layui-form-checkbox' lay-skin='primary' data-id='2'><i class='layui-icon'>&#xe605;</i></div></td>");
	$.each(keys, function(key, value){
		$.each(data, function(index, object) {
			if(value == index){
				var td = $("<td>" + object + "</td>");
				tr.append(td);
			}
		});
	});
	
    tr.append("<td></td>");
	$("table").append(tr);
}
