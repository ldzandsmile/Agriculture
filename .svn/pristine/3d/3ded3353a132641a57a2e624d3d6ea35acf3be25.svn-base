package com.zhisolution.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;

/**
 *	放行所有静态资源 
 */
@WebFilter(value = "/*", initParams = {@WebInitParam(name = "allowedResources", value = ".css,.js,.png,login.jsp,LoginServlet") })
public class Filter_1_GlobalStaticResourceFilter implements Filter {

	/**
	 * 仅当服务器启动时才会执行 init 方法, 所以仅会对 allowedResources 赋值一次, 不存在线程安全问题
	 */
	private String[] allowedResources = null;

	/**
	 * 读取初始化参数, 并赋给成员变量
	 */
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		allowedResources = fConfig.getInitParameter("allowedResources").split(",");
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) arg0;
		String requestURI = request.getRequestURI();
		
		// 如果请求静态资源则在 requset 中设置越过登陆验证过滤器
		for(String allowedResource: allowedResources){
			if(requestURI.endsWith(allowedResource)){
				request.setAttribute("skipGlobalLoginValidateFilter", true);
			}
		}
		chain.doFilter(arg0, arg1);
	}
	
	@Override
	public void destroy() {

	}
}
