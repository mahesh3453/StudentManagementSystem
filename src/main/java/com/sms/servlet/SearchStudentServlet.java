package com.sms.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.sql.*;

import com.sms.db.DBConnection;

@SuppressWarnings("serial")
public class SearchStudentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM students WHERE name LIKE ? OR roll LIKE ?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");
            ps.setString(2, "%" + keyword + "%");

            ResultSet rs = ps.executeQuery();

            out.println("<h2>Search Results</h2>");

            while (rs.next()) {
                out.println(rs.getInt("id") + " "
                        + rs.getString("name") + " "
                        + rs.getString("roll") + " "
                        + rs.getString("course") + "<br>");
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}