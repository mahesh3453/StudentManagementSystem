package com.sms.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("oracle.jdbc.OracleDriver");

            con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@//LAPTOP-7GMHM2ER:1521/orcl",
                    "Kshitija",
                    "Kshitija123");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}