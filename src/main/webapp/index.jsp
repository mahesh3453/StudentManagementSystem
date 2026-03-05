<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="com.sms.db.DBConnection" %>
<%
	String user = (String)session.getAttribute("user");
	
	if(user == null){
	response.sendRedirect("login.jsp");
	}
	%>
<html lang="en">
<jsp:include page="navbar.jsp" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        * {
            font-family: 'Poppins', sans-serif;
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
            animation: float 6s ease-in-out infinite;
        }
        
        .shape1 {
            width: 100px;
            height: 100px;
            top: 10%;
            left: 10%;
            animation-delay: 0s;
        }
        
        .shape2 {
            width: 150px;
            height: 150px;
            bottom: 10%;
            right: 10%;
            animation-delay: 2s;
        }
        
        .shape3 {
            width: 70px;
            height: 70px;
            top: 20%;
            right: 20%;
            animation-delay: 4s;
        }
        
        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }
        
        .main-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            z-index: 1;
        }
        
        .glass-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 3rem;
            max-width: 900px;
            width: 100%;
            transition: transform 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.5);
        }
        
        .glass-card:hover {
            transform: translateY(-5px);
        }
        
        .header-icon {
            font-size: 4rem;
            color: #667eea;
            margin-bottom: 1rem;
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
            }
        }
        
        .title {
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 0.5rem;
            font-size: 3rem;
        }
        
        .subtitle {
            color: #6c757d;
            font-weight: 400;
            margin-bottom: 3rem;
            font-size: 1.1rem;
        }
        
        .feature-card {
            background: rgba(102, 126, 234, 0.1);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            border: 2px solid transparent;
            height: 100%;
        }
        
        .feature-card:hover {
            border-color: #667eea;
            transform: scale(1.05);
            box-shadow: 0 10px 40px -10px rgba(102, 126, 234, 0.5);
        }
        
        .feature-icon {
            font-size: 3rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-bottom: 1rem;
        }
        
        .feature-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 1rem;
        }
        
        .feature-text {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 1.5rem;
        }
        
        .btn-custom {
            padding: 12px 35px;
            border-radius: 50px;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            border: none;
        }
        
        .btn-custom::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.2);
            transform: translate(-50%, -50%);
            transition: width 0.6s, height 0.6s;
        }
        
        .btn-custom:hover::before {
            width: 300px;
            height: 300px;
        }
        
        .btn-primary-custom {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            box-shadow: 0 10px 20px -5px rgba(102, 126, 234, 0.5);
        }
        
        .btn-primary-custom:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(102, 126, 234, 0.6);
        }
        
        .btn-success-custom {
            background: linear-gradient(135deg, #38ef7d 0%, #11998e 100%);
            color: white;
            box-shadow: 0 10px 20px -5px rgba(56, 239, 125, 0.4);
        }
        
        .btn-success-custom:hover {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 15px 25px -5px rgba(56, 239, 125, 0.5);
        }
        
        .stats-container {
            margin-top: 3rem;
            padding-top: 2rem;
            border-top: 2px dashed rgba(102, 126, 234, 0.3);
        }
        
        .stat-item {
            text-align: center;
        }
        
        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: #667eea;
        }
        
        .stat-label {
            color: #6c757d;
            font-size: 0.9rem;
        }
        
        @media (max-width: 768px) {
            .glass-card {
                padding: 2rem;
            }
            
            .title {
                font-size: 2rem;
            }
            
            .feature-card {
                margin-bottom: 1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Animated background shapes -->
    <div class="shape shape1"></div>
    <div class="shape shape2"></div>
    <div class="shape shape3"></div>
    
    <div class="main-container">
        <div class="glass-card">
            <div class="text-center">
                <!-- Header icon -->
                <div class="header-icon">
                    <i class="fas fa-graduation-cap"></i>
                </div>
                
                <!-- Title with gradient -->
                <h1 class="title">Student Management System</h1>
                <p class="subtitle">Efficiently manage your student records with ease</p>
                
                <!-- Features section -->
                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            <h3 class="feature-title">Add New Student</h3>
                            <p class="feature-text">Register new students with complete details including personal information, courses, and enrollment dates.</p>
                            <a href="addStudent.jsp" class="btn btn-custom btn-primary-custom">
                                <i class="fas fa-plus-circle me-2"></i>Add Student
                            </a>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="feature-card">
                            <div class="feature-icon">
                                <i class="fas fa-users"></i>
                            </div>
                            <h3 class="feature-title">View All Students</h3>
                            <p class="feature-text">Browse, search, and manage all student records. Edit information or remove entries as needed.</p>
                            <a href="viewStudents.jsp" class="btn btn-custom btn-success-custom">
                                <i class="fas fa-eye me-2"></i>View Students
                            </a>
                        </div>
                    </div>
                </div>
                
                <!-- Quick stats section (you can replace with dynamic data) -->
                <%
					Connection con = DBConnection.getConnection();

					Statement stmt = con.createStatement();

					ResultSet rs = stmt.executeQuery(
										"select count(*) from students");

										rs.next();

					int total = rs.getInt(1);
				%>
				
				<div class="stat-number">
					<%= total %>
					</div>
					<div class="stat-label">
					Total Students
					</div>
                
                <!-- Footer note -->
                <div class="mt-4 text-muted small">
                    <i class="fas fa-clock me-1"></i> Last updated: Today
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>