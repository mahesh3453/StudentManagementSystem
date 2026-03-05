package com.sms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.sms.db.DBConnection;
import com.sms.model.Student;

public class StudentDAO {

    public static int save(Student s) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "insert into students(name,roll,course,email) values(?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, s.getName());
            ps.setString(2, s.getRoll());
            ps.setString(3, s.getCourse());
            ps.setString(4, s.getEmail());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public static int delete(int id) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM students WHERE id=?");

            ps.setInt(1, id);

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public static int update(Student s) {

        int status = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
            "UPDATE students SET name=?, roll=?, course=?, email=? WHERE id=?");

            ps.setString(1, s.getName());
            ps.setString(2, s.getRoll());
            ps.setString(3, s.getCourse());
            ps.setString(4, s.getEmail());
            ps.setInt(5, s.getId());

            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}