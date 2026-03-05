<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.sms.db.DBConnection" %>
<%
String user = (String)session.getAttribute("user");
if(user == null){
response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Students - Student Management System</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            position: relative;
            overflow-x: hidden;
        }
        
        /* Animated background elements */
        .shape {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 8s ease-in-out infinite;
            z-index: 0;
        }
        
        .shape1 {
            width: 120px;
            height: 120px;
            top: 5%;
            left: 5%;
            animation-delay: 0s;
        }
        
        .shape2 {
            width: 180px;
            height: 180px;
            bottom: 5%;
            right: 5%;
            animation-delay: 2s;
        }
        
        .shape3 {
            width: 90px;
            height: 90px;
            top: 15%;
            right: 15%;
            animation-delay: 4s;
        }
        
        .shape4 {
            width: 60px;
            height: 60px;
            bottom: 20%;
            left: 10%;
            animation-delay: 6s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-30px) rotate(180deg);
            }
        }
        
        /* Main container */
        .main-container {
            min-height: 100vh;
            padding: 100px 20px 40px 20px;
            position: relative;
            z-index: 1;
        }
        
        /* Content card */
        .content-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 2.5rem;
            max-width: 1400px;
            margin: 0 auto;
            border: 1px solid rgba(255, 255, 255, 0.5);
            position: relative;
            overflow: hidden;
        }
        
        /* Header section */
        .header-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .title-section {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .header-icon {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .title {
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.5rem;
            margin: 0;
        }
        
        .subtitle {
            color: #6c757d;
            font-weight: 400;
            margin-top: 0.5rem;
        }
        
        /* Stats card */
        .stats-card {
            background: rgba(102, 126, 234, 0.1);
            border-radius: 20px;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .stats-number {
            font-size: 2rem;
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        
        .stats-label {
            color: #6c757d;
            font-weight: 500;
        }
        
        /* Search section */
        .search-section {
            margin-bottom: 2rem;
        }
        
        .search-wrapper {
            position: relative;
            max-width: 500px;
        }
        
        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #667eea;
            z-index: 10;
        }
        
        .search-input {
            width: 100%;
            padding: 15px 15px 15px 45px;
            border: 2px solid #e9ecef;
            border-radius: 50px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
        }
        
        .search-input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        .search-btn {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }
        
        .search-btn:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-50%) scale(1.05);
            color: white;
        }
        
        /* Debug section */
        .debug-section {
            background: #f8f9fa;
            border-left: 4px solid #667eea;
            border-radius: 10px;
            padding: 1rem;
            margin-bottom: 2rem;
            font-family: monospace;
            font-size: 0.9rem;
        }
        
        .debug-title {
            color: #667eea;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }
        
        .debug-content {
            color: #495057;
            background: white;
            padding: 0.5rem;
            border-radius: 5px;
            border: 1px solid #e9ecef;
        }
        
        /* Table container */
        .table-container {
            overflow-x: auto;
            border-radius: 20px;
            background: white;
            box-shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.1);
        }
        
        .student-table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1000px;
        }
        
        .student-table th {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            font-weight: 600;
            padding: 1rem;
            text-align: left;
            font-size: 1rem;
            white-space: nowrap;
        }
        
        .student-table th:first-child {
            border-top-left-radius: 20px;
        }
        
        .student-table th:last-child {
            border-top-right-radius: 20px;
        }
        
        .student-table td {
            padding: 1rem;
            border-bottom: 1px solid #e9ecef;
            color: #495057;
            vertical-align: middle;
        }
        
        .student-table tbody tr {
            transition: all 0.3s ease;
        }
        
        .student-table tbody tr:hover {
            background: rgba(102, 126, 234, 0.05);
        }
        
        /* Student avatar */
        .student-avatar {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 1rem;
            margin-right: 10px;
        }
        
        .student-info {
            display: flex;
            align-items: center;
        }
        
        /* Roll badge */
        .roll-badge {
            background: #e9ecef;
            color: #495057;
            padding: 5px 10px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }
        
        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
            flex-wrap: wrap;
        }
        
        .btn-action {
            padding: 8px 15px;
            border-radius: 50px;
            font-size: 0.85rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 5px;
            border: none;
            cursor: pointer;
        }
        
        .btn-edit {
            background: linear-gradient(135deg, #ffd93e 0%, #ffb347 100%);
            color: #495057;
        }
        
        .btn-edit:hover {
            background: linear-gradient(135deg, #ffb347 0%, #ffd93e 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px -5px #ffb347;
            color: #495057;
            text-decoration: none;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff4757 100%);
            color: white;
        }
        
        .btn-delete:hover {
            background: linear-gradient(135deg, #ff4757 0%, #ff6b6b 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px -5px #ff4757;
            color: white;
            text-decoration: none;
        }
        
        .btn-view {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-view:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px -5px #667eea;
            color: white;
            text-decoration: none;
        }
        
        /* Empty state */
        .empty-state {
            text-align: center;
            padding: 3rem;
        }
        
        .empty-icon {
            font-size: 4rem;
            color: #667eea;
            opacity: 0.3;
            margin-bottom: 1rem;
        }
        
        .empty-text {
            color: #6c757d;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }
        
        .add-first-btn {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
        }
        
        .add-first-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px rgba(102, 126, 234, 0.5);
            color: white;
        }
        
        /* Footer */
        .footer-note {
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 2px dashed rgba(102, 126, 234, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        /* Alert messages */
        .alert {
            border-radius: 15px;
            border: none;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            animation: slideDown 0.5s ease;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .alert-success {
            background: linear-gradient(135deg, #38ef7d 0%, #11998e 100%);
            color: white;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .alert-warning {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
            color: white;
        }
        
        .alert-info {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        @keyframes slideDown {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        /* Pagination Styles */
        .pagination-section {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 1rem;
        }
        
        .pagination-info {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .pagination {
            display: flex;
            gap: 0.5rem;
            list-style: none;
            padding: 0;
            margin: 0;
            flex-wrap: wrap;
        }
        
        .page-item {
            display: inline-block;
        }
        
        .page-link {
            display: flex;
            align-items: center;
            justify-content: center;
            min-width: 40px;
            height: 40px;
            padding: 0 10px;
            background: white;
            border: 2px solid #e9ecef;
            border-radius: 12px;
            color: #495057;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        
        .page-link:hover {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-color: transparent;
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px -5px rgba(102, 126, 234, 0.5);
        }
        
        .page-item.active .page-link {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-color: transparent;
            color: white;
            font-weight: 600;
        }
        
        .page-item.disabled .page-link {
            background: #f8f9fa;
            border-color: #dee2e6;
            color: #adb5bd;
            pointer-events: none;
            cursor: not-allowed;
        }
        
        .page-item.disabled .page-link:hover {
            transform: none;
            box-shadow: none;
        }
        
        .page-link i {
            font-size: 0.8rem;
        }
        
        .items-per-page {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        .items-per-page select {
            padding: 8px 15px;
            border: 2px solid #e9ecef;
            border-radius: 12px;
            color: #495057;
            font-weight: 500;
            background: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .items-per-page select:hover {
            border-color: #667eea;
        }
        
        .items-per-page select:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        @media (max-width: 768px) {
            .pagination-section {
                flex-direction: column;
                align-items: start;
            }
            
            .pagination {
                justify-content: center;
                width: 100%;
            }
            
            .page-link {
                min-width: 35px;
                height: 35px;
                padding: 0 8px;
            }
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .content-card {
                padding: 1.5rem;
            }
            
            .title {
                font-size: 2rem;
            }
            
            .header-section {
                flex-direction: column;
                align-items: start;
            }
            
            .search-wrapper {
                max-width: 100%;
            }
            
            .footer-note {
                flex-direction: column;
                text-align: center;
            }
        }
        
        .phone-number {
            color: #495057;
            font-size: 0.9rem;
        }
        
        .date-added {
            color: #6c757d;
            font-size: 0.85rem;
        }
        
        .no-data {
            color: #adb5bd;
            font-style: italic;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="navbar.jsp" />
    
    <!-- Animated background shapes -->
    <div class="shape shape1"></div>
    <div class="shape shape2"></div>
    <div class="shape shape3"></div>
    <div class="shape shape4"></div>
    
    <div class="main-container">
        <div class="content-card">
            <!-- Header Section -->
            <div class="header-section">
                <div class="title-section">
                    <div class="header-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div>
                        <h1 class="title">Student List</h1>
                        <p class="subtitle">
                            <i class="fas fa-magic me-2"></i>
                            Manage and view all student records
                        </p>
                    </div>
                </div>
                
                <!-- Stats -->
                <%
                    Connection con = null;
                    Statement stmtCount = null;
                    ResultSet rsCount = null;
                    int totalStudents = 0;
                    String dbStatus = "Unknown";
                    String dbError = "";
                    
                    try {
                        con = DBConnection.getConnection();
                        if(con != null) {
                            dbStatus = "Connected";
                            stmtCount = con.createStatement();
                            rsCount = stmtCount.executeQuery("SELECT COUNT(*) FROM students");
                            if(rsCount.next()) {
                                totalStudents = rsCount.getInt(1);
                            }
                        } else {
                            dbStatus = "Connection Failed";
                        }
                    } catch(Exception e) {
                        dbStatus = "Error";
                        dbError = e.getMessage();
                        e.printStackTrace();
                    } finally {
                        if(rsCount != null) try { rsCount.close(); } catch(Exception e) {}
                        if(stmtCount != null) try { stmtCount.close(); } catch(Exception e) {}
                        if(con != null) try { con.close(); } catch(Exception e) {}
                    }
                %>
                
                <div class="stats-card">
                    <i class="fas fa-database fa-2x" style="color: #667eea;"></i>
                    <div>
                        <span class="stats-number"><%= totalStudents %></span>
                        <span class="stats-label">Total Students</span>
                    </div>
                </div>
            </div>
            
            
            <!-- Search Section -->
            <div class="search-section">
                <form method="get" action="viewStudents.jsp" class="search-wrapper" id="searchForm">
                    <span class="search-icon"><i class="fas fa-search"></i></span>
                    <input type="text" 
                           name="keyword" 
                           class="search-input" 
                           placeholder="Search by name, roll number, course, or email..."
                           value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
                    <input type="hidden" name="page" value="1" id="searchPageInput">
                    <input type="hidden" name="limit" value="<%= request.getParameter("limit") != null ? request.getParameter("limit") : "10" %>" id="searchLimitInput">
                    <button type="submit" class="search-btn">
                        <i class="fas fa-search me-2"></i>Search
                    </button>
                </form>
            </div>
            
            <!-- Success/Error Messages -->
            <%
                String success = request.getParameter("success");
                String error = request.getParameter("error");
                String deleted = request.getParameter("deleted");
                
                if(success != null && success.equals("added")) {
            %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle fa-lg"></i>
                    <div>
                        <strong>Success!</strong> Student has been added successfully.
                    </div>
                </div>
            <% 
                } else if(success != null && success.equals("updated")) {
            %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle fa-lg"></i>
                    <div>
                        <strong>Success!</strong> Student information has been updated successfully.
                    </div>
                </div>
            <% 
                } else if(deleted != null && deleted.equals("true")) {
            %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle fa-lg"></i>
                    <div>
                        <strong>Success!</strong> Student has been deleted successfully.
                    </div>
                </div>
            <% 
                } else if(error != null && error.equals("delete")) {
            %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle fa-lg"></i>
                    <div>
                        <strong>Error!</strong> Failed to delete student. Please try again.
                    </div>
                </div>
            <% 
                } else if(request.getParameter("notfound") != null) {
            %>
                <div class="alert alert-warning">
                    <i class="fas fa-exclamation-triangle fa-lg"></i>
                    <div>
                        <strong>Not Found!</strong> The requested student could not be found.
                    </div>
                </div>
            <% } %>
            
            <!-- Table Section -->
            <div class="table-container">
                <table class="student-table">
                    <thead>
                        <tr>
                            <th><i class="fas fa-user me-2"></i>Name</th>
                            <th><i class="fas fa-id-card me-2"></i>Roll Number</th>
                            <th><i class="fas fa-book-open me-2"></i>Course</th>
                            <th><i class="fas fa-envelope me-2"></i>Email</th>
                            <th><i class="fas fa-phone me-2"></i>Phone</th>
                            <th><i class="fas fa-calendar me-2"></i>Added On</th>
                            <th><i class="fas fa-cog me-2"></i>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            PreparedStatement pstmt = null;
                            PreparedStatement countStmt = null;
                            ResultSet rs = null;
                            ResultSet countRs = null;
                            String searchParam = request.getParameter("keyword");
                            
                            // Pagination parameters
                            int currentPage = 1;
                            int recordsPerPage = 10;
                            int totalRecords = 0;
                            int totalPages = 0;
                            int start = 0;
                            
                            // Get current page from request
                            String pageParam = request.getParameter("page");
                            if(pageParam != null && !pageParam.isEmpty()) {
                                try {
                                    currentPage = Integer.parseInt(pageParam);
                                } catch(NumberFormatException e) {
                                    currentPage = 1;
                                }
                            }
                            
                            // Get records per page from request
                            String limitParam = request.getParameter("limit");
                            if(limitParam != null && !limitParam.isEmpty()) {
                                try {
                                    recordsPerPage = Integer.parseInt(limitParam);
                                    // Limit reasonable values
                                    if(recordsPerPage < 5) recordsPerPage = 5;
                                    if(recordsPerPage > 50) recordsPerPage = 50;
                                } catch(NumberFormatException e) {
                                    recordsPerPage = 10;
                                }
                            }
                            
                            // Calculate start index
                            start = (currentPage - 1) * recordsPerPage;
                            
                            try {
                                conn = DBConnection.getConnection();
                                
                                if(conn == null) {
                                    throw new Exception("Database connection is null");
                                }
                                
                                // First, get total count for pagination
                                String countQuery;
                                if(searchParam != null && !searchParam.trim().isEmpty()) {
                                    countQuery = "SELECT COUNT(*) FROM students WHERE LOWER(name) LIKE ? OR LOWER(roll) LIKE ? OR LOWER(course) LIKE ? OR LOWER(email) LIKE ?";
                                    countStmt = conn.prepareStatement(countQuery);
                                    String searchPattern = "%" + searchParam.toLowerCase() + "%";
                                    countStmt.setString(1, searchPattern);
                                    countStmt.setString(2, searchPattern);
                                    countStmt.setString(3, searchPattern);
                                    countStmt.setString(4, searchPattern);
                                } else {
                                    countQuery = "SELECT COUNT(*) FROM students";
                                    countStmt = conn.prepareStatement(countQuery);
                                }
                                
                                countRs = countStmt.executeQuery();
                                if(countRs.next()) {
                                    totalRecords = countRs.getInt(1);
                                }
                                
                                // Calculate total pages
                                totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                                if(totalPages == 0) totalPages = 1;
                                
                                // Ensure current page is within bounds
                                if(currentPage > totalPages) {
                                    currentPage = totalPages;
                                    start = (currentPage - 1) * recordsPerPage;
                                }
                                if(currentPage < 1) {
                                    currentPage = 1;
                                    start = 0;
                                }
                                
                                // Main query with Oracle pagination using ROWNUM
                                String query;
                                if(searchParam != null && !searchParam.trim().isEmpty()) {
                                    // For Oracle 12c and above, you can use OFFSET FETCH
                                    // But using ROWNUM for broader compatibility
                                    query = "SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM students WHERE LOWER(name) LIKE ? OR LOWER(roll) LIKE ? OR LOWER(course) LIKE ? OR LOWER(email) LIKE ? ORDER BY id DESC) a WHERE ROWNUM <= ?) WHERE rnum > ?";
                                    pstmt = conn.prepareStatement(query);
                                    String searchPattern = "%" + searchParam.toLowerCase() + "%";
                                    pstmt.setString(1, searchPattern);
                                    pstmt.setString(2, searchPattern);
                                    pstmt.setString(3, searchPattern);
                                    pstmt.setString(4, searchPattern);
                                    pstmt.setInt(5, start + recordsPerPage); // End row
                                    pstmt.setInt(6, start); // Start row
                                } else {
                                    // For Oracle 12c and above, you can use OFFSET FETCH
                                    // But using ROWNUM for broader compatibility
                                    query = "SELECT * FROM (SELECT a.*, ROWNUM rnum FROM (SELECT * FROM students ORDER BY id DESC) a WHERE ROWNUM <= ?) WHERE rnum > ?";
                                    pstmt = conn.prepareStatement(query);
                                    pstmt.setInt(1, start + recordsPerPage); // End row
                                    pstmt.setInt(2, start); // Start row
                                }
                                
                                rs = pstmt.executeQuery();
                                int rowCount = 0;
                                
                                // Check if ResultSet has data
                                if(rs != null) {
                                    while(rs.next()) {
                                        rowCount++;
                                        String name = rs.getString("name");
                                        String roll = rs.getString("roll");
                                        String course = rs.getString("course");
                                        String email = rs.getString("email");
                                        String phone = rs.getString("phone");
                                        Timestamp addedOn = rs.getTimestamp("added_on");
                                        int id = rs.getInt("id");
                        %>
                        <tr>
                            <td>
                                <div class="student-info">
                                    <div class="student-avatar">
                                        <%= name != null && !name.isEmpty() ? name.substring(0, 1).toUpperCase() : "?" %>
                                    </div>
                                    <strong><%= name != null ? name : "N/A" %></strong>
                                </div>
                            </td>
                            <td>
                                <span class="roll-badge">
                                    <i class="fas fa-hashtag" style="font-size: 0.7rem;"></i>
                                    <%= roll != null ? roll : "N/A" %>
                                </span>
                            </td>
                            <td><%= course != null ? course : "N/A" %></td>
                            <td>
                                <i class="fas fa-envelope me-1" style="color: #667eea; font-size: 0.85rem;"></i>
                                <span style="font-size: 0.9rem;"><%= email != null ? email : "N/A" %></span>
                            </td>
                            <td>
                                <% if(phone != null && !phone.trim().isEmpty()) { %>
                                    <span class="phone-number">
                                        <i class="fas fa-phone-alt me-1" style="color: #28a745;"></i>
                                        <%= phone %>
                                    </span>
                                <% } else { %>
                                    <span class="no-data">
                                        <i class="fas fa-minus-circle me-1"></i>Not provided
                                    </span>
                                <% } %>
                            </td>
                            <td>
                                <% if(addedOn != null) { 
                                    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy");
                                    java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("hh:mm a");
                                %>
                                    <span class="date-added">
                                        <i class="fas fa-calendar-alt me-1" style="color: #764ba2;"></i>
                                        <%= sdf.format(addedOn) %>
                                        <br>
                                        <small class="text-muted">
                                            <i class="fas fa-clock me-1" style="font-size: 0.7rem;"></i>
                                            <%= timeFormat.format(addedOn) %>
                                        </small>
                                    </span>
                                <% } else { %>
                                    <span class="no-data">
                                        <i class="fas fa-minus-circle me-1"></i>Not available
                                    </span>
                                <% } %>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <a href="viewStudent.jsp?id=<%= id %>" class="btn-action btn-view" title="View Details">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                    <a href="editStudent.jsp?id=<%= id %>" class="btn-action btn-edit" title="Edit Student">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="javascript:void(0)" 
                                       onclick="confirmDelete(<%= id %>, '<%= name != null ? name.replace("'", "\\'") : "Unknown" %>')" 
                                       class="btn-action btn-delete" 
                                       title="Delete Student">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                                    }
                                }
                                
                                if(rowCount == 0) {
                        %>
                        <tr>
                            <td colspan="7">
                                <div class="empty-state">
                                    <div class="empty-icon">
                                        <i class="fas fa-user-slash"></i>
                                    </div>
                                    <div class="empty-text">
                                        <% if(searchParam != null && !searchParam.isEmpty()) { %>
                                            No students found matching "<strong><%= searchParam %></strong>"
                                        <% } else { %>
                                            No students registered yet
                                        <% } %>
                                    </div>
                                    <a href="addStudent.jsp" class="add-first-btn">
                                        <i class="fas fa-plus-circle me-2"></i>Add Your First Student
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <%
                                }
                            } catch(Exception e) {
                                e.printStackTrace();
                        %>
                        <tr>
                            <td colspan="7">
                                <div class="alert alert-danger m-3">
                                    <i class="fas fa-exclamation-circle fa-lg"></i>
                                    <div>
                                        <strong>Database Error!</strong> Unable to load student data.
                                        <br>
                                        <small class="mt-2 d-block">
                                            <strong>Error Details:</strong> <%= e.getMessage() %>
                                        </small>
                                        <br>
                                        <small>
                                            Please check:
                                            <ul class="mt-1">
                                                <li>Database connection in DBConnection class</li>
                                                <li>Table 'students' exists in database</li>
                                                <li>Table has required columns: id, name, roll, course, email, phone, added_on</li>
                                            </ul>
                                        </small>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <%
                            } finally {
                                if(rs != null) try { rs.close(); } catch(Exception e) {}
                                if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
                                if(countRs != null) try { countRs.close(); } catch(Exception e) {}
                                if(countStmt != null) try { countStmt.close(); } catch(Exception e) {}
                                if(conn != null) try { conn.close(); } catch(Exception e) {}
                            }
                        %>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination Section -->
            <div class="pagination-section">
                <div class="pagination-info">
                    <i class="fas fa-info-circle me-1" style="color: #667eea;"></i>
                    Showing 
                    <% if(totalRecords > 0) { %>
                        <%= start + 1 %> - <%= Math.min(start + recordsPerPage, totalRecords) %>
                    <% } else { %>
                        0
                    <% } %>
                    of <strong><%= totalRecords %></strong> student(s)
                    <% if(searchParam != null && !searchParam.trim().isEmpty()) { %>
                        matching "<strong><%= searchParam %></strong>"
                    <% } %>
                </div>
                
                <div class="d-flex align-items-center gap-3">
                    <!-- Items per page selector -->
                    <div class="items-per-page">
                        <label for="limitSelect"><i class="fas fa-list me-1"></i>Show:</label>
                        <select id="limitSelect" onchange="changeLimit(this.value)">
                            <option value="5" <%= recordsPerPage == 5 ? "selected" : "" %>>5</option>
                            <option value="10" <%= recordsPerPage == 10 ? "selected" : "" %>>10</option>
                            <option value="20" <%= recordsPerPage == 20 ? "selected" : "" %>>20</option>
                            <option value="50" <%= recordsPerPage == 50 ? "selected" : "" %>>50</option>
                        </select>
                    </div>
                    
                    <!-- Pagination controls -->
                    <% if(totalPages > 1) { %>
                    <ul class="pagination">
                        <!-- First page -->
                        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%= getPaginationUrl(request, 1, recordsPerPage) %>" aria-label="First">
                                <i class="fas fa-angle-double-left"></i>
                            </a>
                        </li>
                        
                        <!-- Previous page -->
                        <li class="page-item <%= currentPage == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%= getPaginationUrl(request, currentPage - 1, recordsPerPage) %>" aria-label="Previous">
                                <i class="fas fa-angle-left"></i>
                            </a>
                        </li>
                        
                        <!-- Page numbers -->
                        <%
                            int startPage = Math.max(1, currentPage - 2);
                            int endPage = Math.min(totalPages, currentPage + 2);
                            
                            if(startPage > 1) {
                        %>
                            <li class="page-item">
                                <a class="page-link" href="<%= getPaginationUrl(request, 1, recordsPerPage) %>">1</a>
                            </li>
                            <% if(startPage > 2) { %>
                                <li class="page-item disabled">
                                    <span class="page-link">...</span>
                                </li>
                            <% }
                            }
                            
                            for(int i = startPage; i <= endPage; i++) {
                        %>
                            <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                                <a class="page-link" href="<%= getPaginationUrl(request, i, recordsPerPage) %>"><%= i %></a>
                            </li>
                        <%
                            }
                            
                            if(endPage < totalPages) {
                                if(endPage < totalPages - 1) {
                        %>
                            <li class="page-item disabled">
                                <span class="page-link">...</span>
                            </li>
                        <%
                                }
                        %>
                            <li class="page-item">
                                <a class="page-link" href="<%= getPaginationUrl(request, totalPages, recordsPerPage) %>"><%= totalPages %></a>
                            </li>
                        <%
                            }
                        %>
                        
                        <!-- Next page -->
                        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                            <a class="page-link" href="<%= getPaginationUrl(request, currentPage + 1, recordsPerPage) %>" aria-label="Next">
                                <i class="fas fa-angle-right"></i>
                            </a>
                        </li>
                        
                        <!-- Last page -->
                        <li class="page-item <%= currentPage == totalPages ? "disabled" : "" %>">
                            <a class="page-link" href="<%= getPaginationUrl(request, totalPages, recordsPerPage) %>" aria-label="Last">
                                <i class="fas fa-angle-double-right"></i>
                            </a>
                        </li>
                    </ul>
                    <% } %>
                </div>
            </div>
            
            <%!
                // Helper method to generate pagination URLs
                private String getPaginationUrl(HttpServletRequest request, int page, int limit) {
                    String keyword = request.getParameter("keyword");
                    StringBuilder url = new StringBuilder("viewStudents.jsp?page=" + page + "&limit=" + limit);
                    if(keyword != null && !keyword.trim().isEmpty()) {
                        try {
                            url.append("&keyword=").append(java.net.URLEncoder.encode(keyword, "UTF-8"));
                        } catch(Exception e) {
                            url.append("&keyword=").append(keyword);
                        }
                    }
                    return url.toString();
                }
            %>
            
            <!-- Footer Section -->
            <div class="footer-note">
                <div class="text-muted small">
                    <i class="fas fa-clock me-1"></i>
                    Last updated: <%= new java.text.SimpleDateFormat("MMMM dd, yyyy hh:mm a").format(new java.util.Date()) %>
                    <br>
                    <span class="mt-1 d-block">
                        <i class="fas fa-database me-1"></i>
                        Showing <%= Math.min(recordsPerPage, totalRecords - start) %> of <%= totalRecords %> total student(s)
                    </span>
                </div>
                <div>
                    <a href="addStudent.jsp" class="btn-action btn-view" style="display: inline-block;">
                        <i class="fas fa-plus-circle"></i> Add New Student
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content" style="border-radius: 20px;">
                <div class="modal-header border-0">
                    <h5 class="modal-title">
                        <i class="fas fa-exclamation-triangle text-warning me-2"></i>
                        Confirm Delete
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center py-4">
                    <div class="mb-3">
                        <i class="fas fa-user-times fa-4x" style="color: #ff4757;"></i>
                    </div>
                    <p class="mb-0">Are you sure you want to delete</p>
                    <h5 class="my-2 fw-bold" id="studentName" style="color: #ff4757;"></h5>
                    <p class="text-muted small">This action cannot be undone. All data related to this student will be permanently removed.</p>
                </div>
                <div class="modal-footer border-0">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" style="border-radius: 50px; padding: 10px 25px;">
                        <i class="fas fa-times me-2"></i>Cancel
                    </button>
                    <a href="#" id="confirmDeleteBtn" class="btn btn-danger" style="border-radius: 50px; padding: 10px 25px;">
                        <i class="fas fa-trash me-2"></i>Delete Student
                    </a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script>
        // Confirm delete function
        function confirmDelete(studentId, studentName) {
            document.getElementById('studentName').textContent = studentName;
            document.getElementById('confirmDeleteBtn').href = 'deleteStudent?id=' + studentId;
            
            // Show the modal
            var deleteModal = new bootstrap.Modal(document.getElementById('deleteModal'));
            deleteModal.show();
        }
        
        // Auto-dismiss alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.transition = 'opacity 0.5s ease';
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            });
        }, 5000);
        
        // Add active class to current nav link
        document.addEventListener('DOMContentLoaded', function() {
            const currentPage = window.location.pathname.split('/').pop();
            const navLinks = document.querySelectorAll('.nav-link');
            
            navLinks.forEach(link => {
                const href = link.getAttribute('href');
                if (href === 'viewStudents.jsp') {
                    link.classList.add('active');
                }
            });
        });
        
        // Prevent form resubmission on page refresh
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
        
        // Function to change items per page
        function changeLimit(limit) {
            const urlParams = new URLSearchParams(window.location.search);
            urlParams.set('limit', limit);
            urlParams.set('page', '1'); // Reset to first page when changing limit
            window.location.href = window.location.pathname + '?' + urlParams.toString();
        }
        
        // Update search form to maintain pagination parameters
        document.addEventListener('DOMContentLoaded', function() {
            const searchForm = document.getElementById('searchForm');
            if(searchForm) {
                searchForm.addEventListener('submit', function() {
                    document.getElementById('searchPageInput').value = '1';
                    const limitSelect = document.getElementById('limitSelect');
                    if(limitSelect) {
                        document.getElementById('searchLimitInput').value = limitSelect.value;
                    }
                });
            }
        });
    </script>
</body>
</html>