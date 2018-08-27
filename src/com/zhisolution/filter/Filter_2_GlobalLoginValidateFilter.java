package com.zhisolution.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 打回所有没有 token 或者 token 不正确的请求
 */
@WebFilter("/*")
public class Filter_2_GlobalLoginValidateFilter implements Filter {

	public Filter_2_GlobalLoginValidateFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain) throws IOException, ServletException {

		Boolean skipGlobalLoginValidateFilter = arg0.getAttribute("skipGlobalLoginValidateFilter")==null?false:true;
		if(skipGlobalLoginValidateFilter){
			chain.doFilter(arg0, arg1);
		}else{
			HttpServletRequest request = (HttpServletRequest) arg0;
			HttpServletResponse response = (HttpServletResponse) arg1;
			HttpSession session = request.getSession();
	
			Object sessionToken = session.getAttribute("Token");
			String cookieToken = null;
			Cookie[] cookies = request.getCookies();
	
			if (cookies != null && cookies.length != 0) {
				// 得到 cookie 中的 token
				for (Cookie cookie : cookies) {
					if ("Token".equals(cookie.getName())) {
						cookieToken = cookie.getValue();
						break;
					}
				}
				// 与 session 中的 token 比对, token 正确则放行
				if (sessionToken != null && cookieToken != null && cookieToken.equals(sessionToken.toString())) {
					chain.doFilter(request, response);
				} else {
					// token 不正确则打回
					response.sendRedirect("login.jsp");
					return;
				}
			} else {
				// 打回无 token 的请求
				response.sendRedirect("login.jsp");
				return;
			}
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}