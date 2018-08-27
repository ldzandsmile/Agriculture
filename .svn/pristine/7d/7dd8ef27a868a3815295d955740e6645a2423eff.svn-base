package com.zhisolution.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

/**
 *	@WebFilter 注解，当使用注解配置多个Filter时，无法控制其执行顺序，此时Filter过滤的顺序是按照Filter的类名来控制的，按自然排序的规则。
 */
@WebFilter("/*")
public class Filter_0_GlobalDecodeFilter implements Filter {

    public Filter_0_GlobalDecodeFilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
