package com.sms.servlet;

import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.sms.dao.StudentDAO;

@SuppressWarnings("serial")
@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response) throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        StudentDAO.delete(id);

        response.sendRedirect("viewStudents.jsp");
    }
}