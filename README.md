# 🎓 Student Management System

A **Java Web Application** for managing student records.
This project allows administrators to **add, view, update, delete, and search students** using a web interface.

The system is built using **Java Servlet, JSP, JDBC, and Oracle Database** and runs on **Apache Tomcat**.

---

## 🚀 Features

* 🔐 **User Authentication**

  * Login system for admin users
  * Session-based authentication
  * Logout functionality

* 👨‍🎓 **Student Management**

  * Add new student
  * View student list
  * Update student details
  * Delete student records

* 🔍 **Search System**

  * Search students by:

    * Name
    * Roll number
    * Course
    * Email

* 📊 **Pagination**

  * Display students in pages
  * Improves performance for large datasets

* 🎨 **Modern UI**

  * Bootstrap-based responsive design
  * Dashboard-like interface

---

## 🛠️ Technologies Used

| Technology      | Purpose               |
| --------------- | --------------------- |
| Java            | Backend logic         |
| JSP             | View layer            |
| Servlet         | Controller            |
| JDBC            | Database connectivity |
| Oracle Database | Data storage          |
| Apache Tomcat   | Application server    |
| Bootstrap       | UI styling            |
| Git             | Version control       |

---

## 📁 Project Structure

```text
StudentManagementSystem
│
├── src/main/java
│   └── com.sms
│       ├── dao
│       │   └── StudentDAO.java
│       ├── db
│       │   └── DBConnection.java
│       ├── model
│       │   └── Student.java
│       └── servlet
│           ├── AddStudentServlet.java
│           ├── UpdateStudentServlet.java
│           ├── DeleteStudentServlet.java
│           ├── SearchStudentServlet.java
│           ├── LoginServlet.java
│           └── LogoutServlet.java
│
├── src/main/webapp
│   ├── login.jsp
│   ├── index.jsp
│   ├── viewStudents.jsp
│   ├── viewStudent.jsp
│   ├── addStudent.jsp
│   ├── editStudent.jsp
│   ├── navbar.jsp
│   └── WEB-INF
│       └── web.xml
│
└── README.md
```

---

## 🗄️ Database Structure

### Students Table

```sql
CREATE TABLE students (
    id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    roll VARCHAR2(50) NOT NULL,
    course VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(20),
    added_on TIMESTAMP
);
```

### Admin Users Table

```sql
CREATE TABLE admin_users (
    id NUMBER PRIMARY KEY,
    username VARCHAR2(50),
    password VARCHAR2(100)
);
```

Example user:

```sql
INSERT INTO admin_users VALUES (1,'admin','admin123');
```

---

## ⚙️ Setup Instructions

1️⃣ Clone the repository

```bash
git clone https://github.com/mahesh3453/StudentManagementSystem.git
```

2️⃣ Import project into **Eclipse / STS**

3️⃣ Add **Oracle JDBC Driver (ojdbc11.jar)**

4️⃣ Configure database connection in

```
DBConnection.java
```

5️⃣ Deploy project on **Apache Tomcat**

6️⃣ Open in browser

```
http://localhost:8080/StudentManagementSystem
```

---

## 📌 Future Improvements

* Role-based authentication (Admin / Staff)
* REST API integration
* Export data to Excel
* Advanced dashboard analytics
* Cloud deployment

---

## 👨‍💻 Author

**Mahesh**

GitHub Profile:
https://github.com/mahesh3453

---

⭐ If you like this project, consider giving it a **star on GitHub**!
