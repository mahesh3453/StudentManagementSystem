<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.sms.db.DBConnection" %>

<%
	String user = (String)session.getAttribute("user");
	
	if(user == null){
	response.sendRedirect("login.jsp");
	}
	%>
<%
int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement("SELECT * FROM students WHERE id=?");
ps.setInt(1,id);

ResultSet rs = ps.executeQuery();
rs.next();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Student - Student Management System</title>
    
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
        
        .main-container {
            min-height: 100vh;
            padding: 60px 20px 40px 20px;
            position: relative;
            z-index: 1;
        }
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 2.5rem;
            max-width: 700px;
            margin: 0 auto;
            border: 1px solid rgba(255, 255, 255, 0.5);
            position: relative;
            overflow: hidden;
        }
        
        .form-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
            z-index: -1;
        }
        
        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }
        
        .header-section {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 2px solid rgba(102, 126, 234, 0.2);
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
            font-size: 2.2rem;
            margin: 0;
        }
        
        .student-badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 50px;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 2rem;
            font-size: 1rem;
            box-shadow: 0 10px 20px -5px rgba(102, 126, 234, 0.5);
        }
        
        .student-badge i {
            font-size: 1.2rem;
        }
        
        .form-group {
            margin-bottom: 1.8rem;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .form-label i {
            color: #667eea;
        }
        
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 15px;
            padding: 12px 15px;
            font-size: 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
            outline: none;
        }
        
        .form-control:hover {
            border-color: #764ba2;
        }
        
        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
        }
        
        .btn {
            padding: 12px 30px;
            border-radius: 50px;
            font-weight: 500;
            font-size: 1rem;
            transition: all 0.3s ease;
            flex: 1;
            border: none;
            cursor: pointer;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 10px 20px -5px rgba(102, 126, 234, 0.5);
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(102, 126, 234, 0.6);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            color: white;
            box-shadow: 0 10px 20px -5px rgba(108, 117, 125, 0.5);
        }
        
        .btn-secondary:hover {
            background: linear-gradient(135deg, #495057 0%, #6c757d 100%);
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(108, 117, 125, 0.6);
            color: white;
            text-decoration: none;
        }
        
        .form-footer {
            margin-top: 2rem;
            padding-top: 1.5rem;
            border-top: 2px dashed rgba(102, 126, 234, 0.3);
            text-align: center;
            color: #6c757d;
            font-size: 0.85rem;
        }
        
        @media (max-width: 768px) {
            .form-card {
                padding: 1.5rem;
            }
            
            .title {
                font-size: 1.8rem;
            }
            
            .btn-group {
                flex-direction: column;
            }
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
        <div class="form-card">
            <!-- Header Section -->
            <div class="header-section">
                <div class="header-icon">
                    <i class="fas fa-user-edit"></i>
                </div>
                <h1 class="title">Edit Student</h1>
            </div>
            
            <!-- Student Badge -->
            <div class="student-badge">
                <i class="fas fa-id-card"></i>
                Editing Student ID: <strong><%= rs.getInt("id") %></strong>
                <span class="mx-2">|</span>
                <i class="fas fa-user"></i>
                <%= rs.getString("name") %>
            </div>
            
            <!-- Edit Form -->
            <form action="updateStudent" method="post">
                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                
                <!-- Name Field -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-user"></i>
                        Full Name
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="name" 
                           value="<%= rs.getString("name") %>" 
                           required>
                </div>
                
                <!-- Roll Number Field -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-id-card"></i>
                        Roll Number
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="roll" 
                           value="<%= rs.getString("roll") %>" 
                           required>
                </div>
                
                <!-- Course Field -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-book-open"></i>
                        Course
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="course" 
                           value="<%= rs.getString("course") %>" 
                           required>
                </div>
                
                <!-- Email Field -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-envelope"></i>
                        Email Address
                    </label>
                    <input type="email" 
                           class="form-control" 
                           name="email" 
                           value="<%= rs.getString("email") %>" 
                           required>
                </div>
                
                <!-- Phone Field -->
                <div class="form-group">
                    <label class="form-label">
                        <i class="fas fa-phone"></i>
                        Phone Number
                    </label>
                    <input type="text" 
                           class="form-control" 
                           name="phone" 
                           value="<%= rs.getString("phone") != null ? rs.getString("phone") : "" %>">
                </div>
                
                <!-- Button Group -->
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-2"></i>Update Student
                    </button>
                    <a href="viewStudents.jsp" class="btn btn-secondary">
                        <i class="fas fa-times me-2"></i>Cancel
                    </a>
                </div>
                
                <!-- Form Footer -->
                <div class="form-footer">
                    <i class="fas fa-shield-alt me-1"></i>
                    All information is securely stored
                </div>
            </form>
        </div>
    </div>
    
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>