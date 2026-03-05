package com.sms.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.sms.db.DBConnection;

@SuppressWarnings("serial")
@WebServlet("/updateStudent")

public class UpdateStudentServlet extends HttpServlet {

protected void doPost(HttpServletRequest request,HttpServletResponse response)
throws ServletException,IOException{

try{

int id = Integer.parseInt(request.getParameter("id"));

String name = request.getParameter("name");
String roll = request.getParameter("roll");
String course = request.getParameter("course");
String email = request.getParameter("email");
String phone = request.getParameter("phone");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"UPDATE students SET name=?,roll=?,course=?,email=?,phone=? WHERE id=?"
);

ps.setString(1,name);
ps.setString(2,roll);
ps.setString(3,course);
ps.setString(4,email);
ps.setString(5,phone);
ps.setInt(6,id);

ps.executeUpdate();

response.sendRedirect("viewStudents.jsp");

}
catch(Exception e){
e.printStackTrace();
}

}

}