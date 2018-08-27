package com.zhisolution.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;
import com.google.gson.Gson;
import com.zhisolution.pojo.LoginUser;
import com.zhisolution.pojo.User;
import com.zhisolution.util.HttpUtils;
import com.zhisolution.util.JsonUtils;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	/**
	 * 验证表单, 正确则把 token 放入到 session 域中
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 读取请求内容
		BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream(),"utf-8"));
		String line = null;
		StringBuilder sb = new StringBuilder();
		while ((line = br.readLine()) != null) {
			sb.append(line);
		}
		//将json字符串转换为json对象
		JSONObject json = JSONObject.fromObject(sb.toString());
		//将建json对象转换为java对象
		LoginUser loginUser = (LoginUser) JSONObject.toBean(json,LoginUser.class);
		String username = loginUser.getUsername();
		String password = loginUser.getPassword();
		
		// 发送请求
		String host = "https://api.ziotc.com";
		String path = "/sandbox/auth/user/token";
		String method = "POST";
		Map<String,String> params = new HashMap<String,String>();
		params.put("username", username);
		params.put("password", password);
		Map<String,String> headers = new HashMap<String,String>();
		Map<String,String> bodys = new HashMap<String,String>();
		
		User user = null;
		String message = null;
		try {
	    	HttpResponse resp = HttpUtils.doPost(host, path, method, headers, params, bodys);
	    	message = EntityUtils.toString(resp.getEntity());
	    	user = JsonUtils.beanObject(message, User.class);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
		
		if("200".equals(user.getStatus()) || "304".equals(user.getStatus())){
			request.getSession().setAttribute("username", username);
			request.getSession().setAttribute("date", new Date());
			request.getSession().setAttribute("Token", "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ");

			//创建存储用户名的cookie
			Cookie Token = new Cookie("Token","eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJEQ0ZCMjNBNzUwNDk1NDJERjdGM0Q2NTY2MTNCREI4OEIxMENCNSIsInVzZXIiOiJDMUZCMzNBNTQ0NTg1RjNDRTJGRkNDNEM2RTMzRDg4NkFFMThCNyIsImFwcEtleSI6IjVFNTIzQTFDNzEzNzQ0QkM5RUMzMkMxOEIzNkRENEVDIiwic2NvcGVzIjpbIlJPTEVfVVNFUiJdLCJpc3MiOiJodHRwczovL2FwaS56aW90Yy5jb20iLCJpYXQiOjE1MzMxNzE5MjQsImV4cCI6MTUzNDQ2NzkyNH0.8o2tJAqcX5riOTYqhRyTjp6kY10Mzy1X4AVbjiqsmOTgw2JfV-cuuJV8YRcOZ1ygc15CVhiEpHfvTYokVzt7cQ");
			response.addCookie(Token);
		}
		//将响应体转换为json格式
		JSONObject jsonObject = JSONObject.fromObject(message);
		
		Gson gson = new Gson();
		String jsonData = gson.toJson(jsonObject);
		//设置响应的编码格式
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(jsonData);
		
	}
}