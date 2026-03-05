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
    <title>View Student Details - Student Management System</title>
    
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
            max-width: 900px;
            margin: 0 auto;
            border: 1px solid rgba(255, 255, 255, 0.5);
            position: relative;
            overflow: hidden;
        }
        
        .content-card::before {
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
        
        /* Header section */
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
        
        .header-title {
            flex: 1;
        }
        
        .title {
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 2.2rem;
            margin: 0;
        }
        
        .subtitle {
            color: #6c757d;
            font-weight: 400;
            margin-top: 0.3rem;
            font-size: 0.95rem;
        }
        
        /* Student profile header */
        .profile-header {
            display: flex;
            align-items: center;
            gap: 2rem;
            margin-bottom: 2.5rem;
            flex-wrap: wrap;
        }
        
        .student-avatar-large {
            width: 120px;
            height: 120px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            font-weight: 600;
            color: white;
            box-shadow: 0 10px 30px -5px rgba(102, 126, 234, 0.5);
        }
        
        .student-quick-info {
            flex: 1;
        }
        
        .student-name-large {
            font-size: 2rem;
            font-weight: 700;
            color: #333;
            margin-bottom: 0.5rem;
        }
        
        .student-roll-badge {
            display: inline-block;
            background: rgba(102, 126, 234, 0.1);
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 1rem;
            color: #667eea;
            font-weight: 500;
        }
        
        .student-roll-badge i {
            margin-right: 5px;
        }
        
        /* Details grid */
        .details-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .detail-card {
            background: rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            padding: 1.5rem;
            border: 1px solid rgba(102, 126, 234, 0.2);
            transition: all 0.3s ease;
        }
        
        .detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px -10px rgba(102, 126, 234, 0.3);
            border-color: #667eea;
        }
        
        .detail-label {
            color: #6c757d;
            font-size: 0.9rem;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .detail-label i {
            color: #667eea;
        }
        
        .detail-value {
            font-size: 1.2rem;
            font-weight: 600;
            color: #333;
            word-break: break-word;
        }
        
        .detail-value.small {
            font-size: 1rem;
        }
        
        /* Info section */
        .info-section {
            background: rgba(102, 126, 234, 0.05);
            border-radius: 20px;
            padding: 1.5rem;
            margin-bottom: 2rem;
        }
        
        .info-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 5px;
        }
        
        .info-title i {
            color: #667eea;
        }
        
        /* Action buttons */
        .action-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 2rem;
        }
        
        .btn-action {
            padding: 12px 30px;
            border-radius: 50px;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
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
            box-shadow: 0 10px 20px -5px #ffb347;
            color: #495057;
            text-decoration: none;
        }
        
        .btn-back {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-back:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px #667eea;
            color: white;
            text-decoration: none;
        }
        
        .btn-delete {
            background: linear-gradient(135deg, #ff6b6b 0%, #ff4757 100%);
            color: white;
        }
        
        .btn-delete:hover {
            background: linear-gradient(135deg, #ff4757 0%, #ff6b6b 100%);
            transform: translateY(-2px);
            box-shadow: 0 10px 20px -5px #ff4757;
            color: white;
            text-decoration: none;
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
        
        .alert-danger {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .alert-warning {
            background: linear-gradient(135deg, #f6d365 0%, #fda085 100%);
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
        
        /* Responsive */
        @media (max-width: 768px) {
            .content-card {
                padding: 1.5rem;
            }
            
            .title {
                font-size: 1.8rem;
            }
            
            .profile-header {
                flex-direction: column;
                text-align: center;
                gap: 1rem;
            }
            
            .details-grid {
                grid-template-columns: 1fr;
            }
            
            .action-buttons {
                flex-direction: column;
            }
            
            .btn-action {
                width: 100%;
                justify-content: center;
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
        <div class="content-card">
            <%
                String idParam = request.getParameter("id");
                if(idParam == null || idParam.trim().isEmpty()) {
                    response.sendRedirect("viewStudents.jsp?error=invalid");
                    return;
                }
                
                int studentId = Integer.parseInt(idParam);
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                
                try {
                    conn = DBConnection.getConnection();
                    String query = "SELECT * FROM students WHERE id = ?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, studentId);
                    rs = pstmt.executeQuery();
                    
                    if(!rs.next()) {
                        response.sendRedirect("viewStudents.jsp?notfound=true");
                        return;
                    }
                    
                    String name = rs.getString("name");
                    String roll = rs.getString("roll");
                    String course = rs.getString("course");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    Timestamp addedOn = rs.getTimestamp("added_on");
            %>
            
            <!-- Header Section -->
            <div class="header-section">
                <div class="header-icon">
                    <i class="fas fa-user-graduate"></i>
                </div>
                <div class="header-title">
                    <h1 class="title">Student Profile</h1>
                    <p class="subtitle">
                        <i class="fas fa-magic me-2"></i>
                        Detailed information about the student
                    </p>
                </div>
            </div>
            
            <% 
				    String success = request.getParameter("success");
				    if(success != null && success.equals("updated")) {
				%>
				    <div class="alert alert-success">
				        <i class="fas fa-check-circle fa-lg"></i>
				        <div>
				            <strong>Success!</strong> Student information has been updated successfully.
				        </div>
				    </div>
				<% } %>
            
            <!-- Profile Header -->
            <div class="profile-header">
                <div class="student-avatar-large">
                    <%= name != null && !name.isEmpty() ? name.substring(0, 1).toUpperCase() : "?" %>
                </div>
                <div class="student-quick-info">
                    <h2 class="student-name-large"><%= name != null ? name : "N/A" %></h2>
                    <span class="student-roll-badge">
                        <i class="fas fa-id-card"></i>
                        Roll Number: <%= roll != null ? roll : "N/A" %>
                    </span>
                </div>
            </div>
            
            <!-- Details Grid -->
            <div class="details-grid">
                <!-- Course Card -->
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-book-open"></i>
                        Course
                    </div>
                    <div class="detail-value">
                        <%= course != null ? course : "N/A" %>
                    </div>
                </div>
                
                <!-- Email Card -->
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-envelope"></i>
                        Email Address
                    </div>
                    <div class="detail-value small">
                        <%= email != null ? email : "N/A" %>
                    </div>
                </div>
                
                <!-- Phone Card -->
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-phone"></i>
                        Phone Number
                    </div>
                    <div class="detail-value">
                        <% if(phone != null && !phone.trim().isEmpty()) { %>
                            <%= phone %>
                        <% } else { %>
                            <span style="color: #999;">Not provided</span>
                        <% } %>
                    </div>
                </div>
                
                <!-- Added Date Card -->
                <div class="detail-card">
                    <div class="detail-label">
                        <i class="fas fa-calendar-alt"></i>
                        Registered On
                    </div>
                    <div class="detail-value small">
                        <% if(addedOn != null) { 
                            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMMM yyyy");
                            java.text.SimpleDateFormat timeFormat = new java.text.SimpleDateFormat("hh:mm a");
                        %>
                            <%= sdf.format(addedOn) %> at <%= timeFormat.format(addedOn) %>
                        <% } else { %>
                            <span style="color: #999;">Not available</span>
                        <% } %>
                    </div>
                </div>
            </div>
            
            <!-- Additional Info Section -->
            <div class="info-section">
                <div class="info-title">
                    <i class="fas fa-info-circle"></i>
                    Additional Information
                </div>
                <div class="row">
                    <div class="col-md-6 mb-2">
                        <small class="text-muted">Student ID:</small>
                        <br>
                        <strong>#<%= studentId %></strong>
                    </div>
                    <div class="col-md-6 mb-2">
                        <small class="text-muted">Account Status:</small>
                        <br>
                        <span class="badge bg-success">Active</span>
                    </div>
                </div>
            </div>
            
            <!-- Action Buttons -->
            <div class="action-buttons">
                <a href="editStudent.jsp?id=<%= studentId %>" class="btn-action btn-edit">
                    <i class="fas fa-edit"></i> Edit Student
                </a>
                <a href="viewStudents.jsp" class="btn-action btn-back">
                    <i class="fas fa-arrow-left"></i> Back to List
                </a>
                <a href="javascript:void(0)" 
                   onclick="confirmDelete(<%= studentId %>, '<%= name != null ? name.replace("'", "\\'") : "Unknown" %>')" 
                   class="btn-action btn-delete">
                    <i class="fas fa-trash"></i> Delete Student
                </a>
            </div>
            
            <%
                } catch(Exception e) {
                    e.printStackTrace();
            %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle fa-lg"></i>
                    <div>
                        <strong>Error!</strong> Unable to load student details.
                        <br>
                        <small><%= e.getMessage() %></small>
                    </div>
                </div>
                <div class="text-center mt-3">
                    <a href="viewStudents.jsp" class="btn-action btn-back">
                        <i class="fas fa-arrow-left"></i> Back to List
                    </a>
                </div>
            <%
                } finally {
                    if(rs != null) try { rs.close(); } catch(Exception e) {}
                    if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
                    if(conn != null) try { conn.close(); } catch(Exception e) {}
                }
            %>
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
    </script>
</body>
</html>