package com.zhisolution.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/exitServlet")
public class ExitServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//从session中删除
		session.removeAttribute("username");
		session.removeAttribute("date");
		session.removeAttribute("Token");
		
		//将存储在客户端的cookie删除掉
		Cookie token = new Cookie("Token","");
		token.setMaxAge(0);

		response.addCookie(token);
		
		//重定向到登录界面
		response.sendRedirect(request.getContextPath()+"/login.jsp");
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		this.doGet(req, resp);
	}
}
