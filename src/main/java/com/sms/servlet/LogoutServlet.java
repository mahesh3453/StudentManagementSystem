package com.sms.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.*;

@SuppressWarnings("serial")
public class LogoutServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
					throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		session.invalidate();
		
		response.sendRedirect("login.jsp");

	}
}