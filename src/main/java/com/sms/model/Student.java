package com.sms.model;

/*
 * con = DriverManager.getConnection(
                    "jdbc:oracle:thin:@//LAPTOP-7GMHM2ER:1521/orcl",
                    "Kshitija",
                    "Kshitija123");
 * */
public class Student {

    private String name;
    private String roll;
    private String course;
    private String email;
    private int id;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRoll() {
        return roll;
    }

    public void setRoll(String roll) {
        this.roll = roll;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}