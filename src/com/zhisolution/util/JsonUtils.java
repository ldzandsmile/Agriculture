package com.zhisolution.util;

import net.sf.json.JSONObject;

public class JsonUtils {
	
	@SuppressWarnings("unchecked")
	public static <T> T beanObject(Object message,Class<T> clazz) {
		
		//将响应体转换为json格式
		JSONObject json = JSONObject.fromObject(message);
		Object bean = JSONObject.toBean(json,clazz);
		
		return (T) bean;
	};
	
}
