package com.sms.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

import com.sms.db.DBConnection;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		try {
		
			Connection con = DBConnection.getConnection();
			
			PreparedStatement ps = con.prepareStatement(
			"SELECT * FROM admin_users WHERE username=? AND password=?");
			
			ps.setString(1, username);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
		
		if(rs.next()){
		
			HttpSession session = request.getSession();
			session.setAttribute("user", username);
			
			response.sendRedirect("index.jsp");
		
		}else{
		
			response.sendRedirect("login.jsp?error=1");
		
		}
		
		}catch(Exception e){
			e.printStackTrace();
		}
	
	}
}