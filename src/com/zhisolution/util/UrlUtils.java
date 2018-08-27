package com.zhisolution.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.regex.Pattern;

import com.zhisolution.enumeration.Opration;
import com.zhisolution.enumeration.Target;

public class UrlUtils {
	
	private static final String URL_REGEX = "(?:([A-Za-z]+):)?(\\/{0,3})([0-9.\\-A-Za-z]+)(?::(\\d+))?(?:\\/([^?#]*))?(?:\\?([^#]*))?(?:#(.*))?";
	
	private static final String HOST = "https://api.ziotc.com";
	private static final String SANDBOX = "/sandbox";
	private static final String VERSION = "/v1";
	private static final String USER = "/user";
	private static final String AUTH = "/auth";
	private static final String TOKEN = "/token";
	
	/**
	 * 
	 * 操作用户的, GET 请求下, 根据传入参数生成特定的 url
	 * @param target 操作目标
	 * @param opration 操作方法
	 * @param params Map 类型的伴 url 请求参数
	 * @return 若传入的 params 正确则返回拼接完成的且完成 url 编码的 url, 否则返回空字符串
	 */
	public static String userGetUrl(Target target, Opration opration, Map<String,String> params){
		String targetContain = target.name().toLowerCase();
		String oprationContain = opration.name().toLowerCase();
		StringBuffer url = new StringBuffer(HOST + VERSION + USER + "/" +targetContain + "/" + oprationContain);
		
		if(params != null && params.size() != 0){
			url.append('?');
			
			for (Map.Entry<String, String> param : params.entrySet()) {
				String key = new String();
				String value = new String();
				try {
					// 将中文与空格等字符进行 url 编码
					key = URLEncoder.encode(param.getKey(), "UTF-8");
					value = URLEncoder.encode(param.getValue(), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
				url.append(key + '=' + value + '&');
			}
			url.deleteCharAt(url.length()-1);
		}

		if(isUrl(url)){
			return url.toString();
		}
		return "";
	}
	
	/**
	 * 操作用户的, POST 请求下, 根据传入参数生成特定的 url
	 * @param target 操作目标
	 * @param opration 操作方法
	 * @return 返回拼接完成的 url
	 */
	public static String userPostUrl(Target target, Opration opration){
		String targetContain = target.name().toLowerCase();
		String oprationContain = opration.name().toLowerCase();
		String url = new String(HOST + VERSION + USER + "/" +targetContain + "/" + oprationContain);
		
		return url;
	}
	
	/**
	 * 获取授权 url
	 * @return 授权 url
	 */
	public static String authPostUrl(){
		return HOST + SANDBOX + AUTH + USER + TOKEN;
	}
	
	private static boolean isUrl(StringBuffer url){
		return Pattern.matches(URL_REGEX, url);
	}
}