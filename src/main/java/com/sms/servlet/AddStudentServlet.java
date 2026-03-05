package com.sms.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sms.dao.StudentDAO;
import com.sms.model.Student;

@SuppressWarnings("serial")
@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String roll = request.getParameter("roll");
        String course = request.getParameter("course");
        String email = request.getParameter("email");

        Student s = new Student();

        s.setName(name);
        s.setRoll(roll);
        s.setCourse(course);
        s.setEmail(email);

        int status = StudentDAO.save(s);

        if (status > 0) {
            response.sendRedirect("index.jsp");
        } else {
            response.getWriter().println("Error saving student");
        }
    }
}