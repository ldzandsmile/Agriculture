$("#风机阀").bootstrapSwitch({  
	atate : true,
    onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "风机阀";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
$("#灌溉阀").bootstrapSwitch({  
	atate : false,
	onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "灌溉阀";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
$("#遮阳帘").bootstrapSwitch({  
    onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "遮阳帘";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
$("#灯").bootstrapSwitch({  
    onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "灯";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
$("#水帘").bootstrapSwitch({  
    onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "水帘";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
$("#加湿器").bootstrapSwitch({  
    onText : "ON",      // 设置ON文本  
    offText : "OFF",    // 设置OFF文本  
    onColor : "success",// 设置ON文本颜色     (info/success/warning/danger/primary)  
    offColor : "primary",  // 设置OFF文本颜色        (info/success/warning/danger/primary)  
    size : "normal",    // 设置控件大小,从小到大  (mini/small/normal/large)  
                // 当开关状态改变时触发  
    	onSwitchChange : function(event, state) {  
    		var name = "加湿器";
    		if (state == true) {
    			alert("ON执行开启");
    			deviceON(name);
            } else {  
               alert("OFF");
               deviceOFF(name);
            }  
        }  
});
function deviceON(name){
	var data = getJSONS("https://api.ziotc.com/v1/user/device/"+sensor,
			"get",
			{
				"Authorization" : 'Bearer ' + $.cookie("Token")
			},
			{});
	$.each(data.data.sensorList, function(index, value) {
		if (value.name == name) {
			getJSONS("http://agro.ziotc.com/publish",
					"post",
					{
						//"Authorization" : 'Bearer ' + $.cookie("Token")
					},
					{
						"pt":value.topicMapping.publicTopic ,
						"rt":value.topicMapping.receiveTopic,
						"value":"1"
					});
		}
	})
} 
function deviceOFF(name){
	var data = getJSONS("https://api.ziotc.com/v1/user/device/"+sensor,
			"get",
			{
				"Authorization" : 'Bearer ' + $.cookie("Token")
			},
			{});
	$.each(data.data.sensorList, function(index, value) {
		if (value.name == name) {
			getJSONS("http://agro.ziotc.com/publish",
					"post",
					{
						//"Access-Control-Allow-Origin" : *
//						"Authorization" : 'Bearer ' + $.cookie("Token")
					},
					{
						"pt":value.topicMapping.publicTopic ,
						"rt":value.topicMapping.receiveTopic,
						"value":"0"
					});
		}
	})
} 

