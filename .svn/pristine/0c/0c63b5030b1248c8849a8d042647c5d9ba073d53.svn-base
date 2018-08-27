package com.zhisolution.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * @WebServlet 单独配置 loadOnStartup 属性, 并不好使, 但写上 value 属性后就好用了
 */
@WebServlet(value = "/6482064ECCC2430097B2AA5FA99DC7AB", loadOnStartup = 1)
public class InitServlet extends HttpServlet {

	/**
	 *	服务器启动时把 appKey 加入到 application 域中
	 */
	@Override
	public void init(ServletConfig config) throws ServletException {
		// 读取配置文件
		Properties prop = new Properties();
		ServletContext context = config.getServletContext();
		InputStream in = context.getResourceAsStream("/WEB-INF/inf.properties");
		
		try {
			prop.load(in);
			String appKey = prop.getProperty("appKey");
			context.setAttribute("appKey", appKey);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
