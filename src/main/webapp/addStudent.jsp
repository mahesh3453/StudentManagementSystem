<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    <title>Add Student - Student Management System</title>
    
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
        
        /* Navbar styling to match homepage */
        .navbar-custom {
            background: rgba(255, 255, 255, 0.95) !important;
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 1rem 2rem;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            border-bottom: 1px solid rgba(255, 255, 255, 0.5);
        }
        
        .navbar-brand {
            font-weight: 700;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 1.5rem;
        }
        
        .nav-link {
            color: #495057 !important;
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            margin: 0 0.2rem;
            border-radius: 50px;
            transition: all 0.3s ease;
        }
        
        .nav-link:hover {
            background: linear-gradient(135deg, #667eea20 0%, #764ba220 100%);
            color: #667eea !important;
            transform: translateY(-2px);
        }
        
        .nav-link i {
            margin-right: 8px;
            color: #667eea;
        }
        
        .nav-link.active {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white !important;
        }
        
        .nav-link.active i {
            color: white;
        }
        
        /* Main container - adjusted for fixed navbar */
        .main-container {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 100px 20px 20px 20px;
            position: relative;
            z-index: 1;
        }
        
        .form-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 30px;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
            padding: 2.5rem;
            max-width: 600px;
            width: 100%;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.5);
            position: relative;
            overflow: hidden;
        }
        
        .form-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 35px 60px -15px rgba(0, 0, 0, 0.3);
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
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
        
        .header-section {
            text-align: center;
            margin-bottom: 2rem;
            position: relative;
            z-index: 1;
        }
        
        .header-icon {
            font-size: 3.5rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
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
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }
        
        .subtitle {
            color: #6c757d;
            font-weight: 400;
            font-size: 1rem;
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
            display: block;
        }
        
        .input-group-custom {
            position: relative;
            margin-bottom: 1.8rem;
        }
        
        .input-icon {
            position: absolute;
            left: 15px;
            top: 42px;  /* Adjusted for better alignment */
            color: #667eea;
            font-size: 1.1rem;
            z-index: 10;
            line-height: 1;
            transition: all 0.3s ease;
        }
        
        .form-control-custom {
            width: 100%;
            padding: 14px 15px 14px 45px;
            border: 2px solid #e9ecef;
            border-radius: 15px;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            background: white;
            height: 54px;  /* Slightly increased height */
            line-height: 1.5;
        }
        
        /* Fix for select element */
        select.form-control-custom {
            height: 54px;
            padding: 12px 15px 12px 45px;
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%23667eea' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpolyline points='6 9 12 15 18 9'%3E%3C/polyline%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 15px center;
            background-size: 16px;
        }
        
        .form-control-custom:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
        }
        
        .form-control-custom:hover {
            border-color: #764ba2;
        }
        
        .form-control-custom::placeholder {
            color: #adb5bd;
            font-weight: 300;
            opacity: 0.8;
        }
        
        /* Focus state for input groups */
        .input-group-custom.focused .input-icon {
            color: #764ba2;
            transform: scale(1.1);
        }
        
        .input-group-custom.focused .form-control-custom {
            border-color: #764ba2;
            box-shadow: 0 0 0 4px rgba(118, 75, 162, 0.1);
        }
        
        /* Validation styling */
        .form-control-custom:invalid:not(:placeholder-shown) {
            border-color: #dc3545;
        }
        
        .form-control-custom:valid:not(:placeholder-shown) {
            border-color: #28a745;
        }
        
        /* Button styling */
        .btn-submit {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 16px 30px;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-top: 1.5rem;
            box-shadow: 0 10px 20px -5px rgba(102, 126, 234, 0.5);
        }
        
        .btn-submit::before {
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
        
        .btn-submit:hover::before {
            width: 400px;
            height: 400px;
        }
        
        .btn-submit:hover {
            background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
            transform: translateY(-2px);
            box-shadow: 0 15px 30px -5px rgba(102, 126, 234, 0.6);
        }
        
        .btn-submit i {
            margin-right: 10px;
            transition: transform 0.3s ease;
        }
        
        .btn-submit:hover i {
            transform: translateX(5px);
        }
        
        .btn-back {
            display: inline-block;
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
            margin-top: 1.5rem;
            transition: all 0.3s ease;
            text-align: center;
            width: 100%;
            position: relative;
            padding: 8px;
        }
        
        .btn-back:hover {
            color: #764ba2;
            transform: translateX(-5px);
        }
        
        .btn-back i {
            margin-right: 8px;
            transition: transform 0.3s ease;
        }
        
        .btn-back:hover i {
            transform: translateX(-3px);
        }
        
        .form-footer {
            text-align: center;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 2px dashed rgba(102, 126, 234, 0.3);
        }
        
        .required-field::after {
            content: '*';
            color: #dc3545;
            margin-left: 4px;
            font-weight: 600;
        }
        
        /* Alert styling */
        .alert {
            border-radius: 15px;
            border: none;
            padding: 1rem 1.5rem;
            margin-bottom: 2rem;
            animation: slideDown 0.5s ease;
            position: relative;
            z-index: 1;
            display: flex;
            align-items: center;
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
        
        .alert-success {
            background: linear-gradient(135deg, #38ef7d 0%, #11998e 100%);
            color: white;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            color: white;
        }
        
        .alert i {
            font-size: 1.2rem;
            margin-right: 10px;
        }
        
        /* Progress bar for form completion */
        .form-progress {
            margin-bottom: 2rem;
            height: 4px;
            background: #e9ecef;
            border-radius: 2px;
            overflow: hidden;
        }
        
        .form-progress-bar {
            height: 100%;
            background: linear-gradient(90deg, #667eea, #764ba2);
            width: 0%;
            transition: width 0.3s ease;
        }
        
        /* Responsive adjustments */
        @media (max-width: 768px) {
            .navbar-custom {
                padding: 0.5rem 1rem;
            }
            
            .form-card {
                padding: 1.8rem;
            }
            
            .title {
                font-size: 2rem;
            }
            
            .input-icon {
                top: 40px;
            }
            
            .form-control-custom {
                height: 50px;
                padding: 12px 15px 12px 45px;
            }
            
            select.form-control-custom {
                height: 50px;
            }
        }
        
        /* Loading state for submit button */
        .btn-submit.loading {
            pointer-events: none;
            opacity: 0.8;
        }
        
        .btn-submit.loading i {
            animation: spin 1s linear infinite;
        }
        
        @keyframes spin {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
        
        /* Tooltip styling */
        .field-tooltip {
            position: absolute;
            right: 15px;
            top: 42px;
            color: #6c757d;
            cursor: help;
            font-size: 0.9rem;
        }
        
        .field-tooltip:hover {
            color: #667eea;
        }
    </style>
</head>
<body>
    <!-- Navbar inclusion -->
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
                    <i class="fas fa-user-graduate"></i>
                </div>
                <h1 class="title">Add New Student</h1>
                <p class="subtitle">
                    <i class="fas fa-magic me-2"></i>
                    Enter the student details below to register them in the system
                </p>
            </div>
            
            <!-- Form Progress Bar -->
            <div class="form-progress">
                <div class="form-progress-bar" id="formProgress"></div>
            </div>
            
            <!-- Success/Error Message -->
            <% 
                String success = request.getParameter("success");
                if(success != null && success.equals("true")) {
            %>
                <div class="alert alert-success">
                    <i class="fas fa-check-circle"></i>
                    <div>
                        <strong>Success!</strong> Student has been added successfully.
                        <br>
                        <small>You can add another student or return to home.</small>
                    </div>
                </div>
            <% 
                } else if(success != null && success.equals("false")) {
            %>
                <div class="alert alert-danger">
                    <i class="fas fa-exclamation-circle"></i>
                    <div>
                        <strong>Error!</strong> Failed to add student. Please try again.
                        <br>
                        <small>Make sure all fields are filled correctly.</small>
                    </div>
                </div>
            <% } %>
            
            <!-- Form -->
            <form action="addStudent" method="post" id="studentForm" onsubmit="return validateForm()">
                <!-- Name Field -->
                <div class="input-group-custom">
                    <label for="name" class="form-label required-field">Full Name</label>
                    <span class="input-icon"><i class="fas fa-user"></i></span>
                    <span class="field-tooltip" title="Enter student's full name (minimum 3 characters)">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <input 
                        type="text" 
                        class="form-control-custom" 
                        id="name" 
                        name="name" 
                        placeholder="e.g., John Doe" 
                        required
                        minlength="3"
                        maxlength="50"
                        oninput="updateProgress()"
                    >
                </div>
                
                <!-- Roll Number Field -->
                <div class="input-group-custom">
                    <label for="roll" class="form-label required-field">Roll Number</label>
                    <span class="input-icon"><i class="fas fa-id-card"></i></span>
                    <span class="field-tooltip" title="Unique roll number (letters, numbers, and hyphens only)">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <input 
                        type="text" 
                        class="form-control-custom" 
                        id="roll" 
                        name="roll" 
                        placeholder="e.g., CS2024001" 
                        required
                        pattern="[A-Za-z0-9-]+"
                        title="Roll number can only contain letters, numbers, and hyphens"
                        oninput="updateProgress()"
                    >
                </div>
                
                <!-- Course Field -->
                <div class="input-group-custom">
                    <label for="course" class="form-label required-field">Course</label>
                    <span class="input-icon"><i class="fas fa-book-open"></i></span>
                    <span class="field-tooltip" title="Select the course from the dropdown">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <select class="form-control-custom" id="course" name="course" required onchange="updateProgress()">
                        <option value="" disabled selected>Select a course</option>
                        <option value="Computer Science">Computer Science</option>
                        <option value="Engineering">Engineering</option>
                        <option value="Business Administration">Business Administration</option>
                        <option value="Mathematics">Mathematics</option>
                        <option value="Physics">Physics</option>
                        <option value="Chemistry">Chemistry</option>
                        <option value="Biology">Biology</option>
                        <option value="Literature">Literature</option>
                        <option value="History">History</option>
                        <option value="Arts">Arts</option>
                    </select>
                </div>
                
                <!-- Email Field -->
                <div class="input-group-custom">
                    <label for="email" class="form-label required-field">Email Address</label>
                    <span class="input-icon"><i class="fas fa-envelope"></i></span>
                    <span class="field-tooltip" title="Enter a valid email address">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <input 
                        type="email" 
                        class="form-control-custom" 
                        id="email" 
                        name="email" 
                        placeholder="e.g., john.doe@example.com" 
                        required
                        pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
                        title="Please enter a valid email address"
                        oninput="updateProgress()"
                    >
                </div>
                
                <!-- Phone Number (Optional) -->
                <div class="input-group-custom">
                    <label for="phone" class="form-label">Phone Number <small class="text-muted">(Optional)</small></label>
                    <span class="input-icon"><i class="fas fa-phone"></i></span>
                    <span class="field-tooltip" title="Enter contact number (optional)">
                        <i class="fas fa-info-circle"></i>
                    </span>
                    <input 
                        type="tel" 
                        class="form-control-custom" 
                        id="phone" 
                        name="phone" 
                        placeholder="e.g., +1 234 567 8900"
                        pattern="[0-9+\-\s]+"
                        title="Please enter a valid phone number"
                        oninput="updateProgress()"
                    >
                </div>
                
                <!-- Submit Button -->
                <button type="submit" class="btn-submit" id="submitBtn">
                    <i class="fas fa-user-plus"></i> Register Student
                </button>
                
                <!-- Form Footer -->
                <div class="form-footer">
                    <a href="index.jsp" class="btn-back">
                        <i class="fas fa-arrow-left"></i> Back to Home
                    </a>
                    <div class="mt-3">
                        <small class="text-muted">
                            <i class="fas fa-shield-alt me-1"></i>
                            All information is securely stored
                        </small>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Form Validation and Interaction Script -->
    <script>
        // Form validation function
        function validateForm() {
            let name = document.getElementById('name').value;
            let roll = document.getElementById('roll').value;
            let course = document.getElementById('course').value;
            let email = document.getElementById('email').value;
            let isValid = true;
            let errorMessage = '';
            
            // Name validation
            if (name.trim().length < 3) {
                errorMessage += '• Name must be at least 3 characters long\n';
                isValid = false;
            }
            
            // Roll number validation
            if (roll.trim() === '') {
                errorMessage += '• Please enter roll number\n';
                isValid = false;
            }
            
            // Course validation
            if (!course) {
                errorMessage += '• Please select a course\n';
                isValid = false;
            }
            
            // Email validation
            let emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (!emailPattern.test(email)) {
                errorMessage += '• Please enter a valid email address\n';
                isValid = false;
            }
            
            if (!isValid) {
                alert('Please fix the following errors:\n\n' + errorMessage);
                return false;
            }
            
            // Show loading state on button
            const submitBtn = document.getElementById('submitBtn');
            submitBtn.classList.add('loading');
            submitBtn.innerHTML = '<i class="fas fa-spinner"></i> Adding Student...';
            
            return true;
        }
        
        // Update form progress
        function updateProgress() {
            const fields = ['name', 'roll', 'course', 'email'];
            let filledFields = 0;
            
            fields.forEach(fieldId => {
                const field = document.getElementById(fieldId);
                if (field && field.value && field.value.trim() !== '') {
                    filledFields++;
                }
            });
            
            const progress = (filledFields / fields.length) * 100;
            document.getElementById('formProgress').style.width = progress + '%';
        }
        
        // Add animation class to form fields on focus
        document.querySelectorAll('.input-group-custom').forEach(group => {
            const input = group.querySelector('.form-control-custom');
            
            if (input) {
                input.addEventListener('focus', function() {
                    group.classList.add('focused');
                });
                
                input.addEventListener('blur', function() {
                    group.classList.remove('focused');
                });
                
                // Add input validation styling
                input.addEventListener('input', function() {
                    if (this.checkValidity()) {
                        this.style.borderColor = '#28a745';
                    } else {
                        this.style.borderColor = '#dc3545';
                    }
                });
            }
        });
        
        // Initialize progress on page load
        document.addEventListener('DOMContentLoaded', function() {
            updateProgress();
            
            // Add active class to current nav link
            const currentPage = window.location.pathname.split('/').pop();
            const navLinks = document.querySelectorAll('.nav-link');
            
            navLinks.forEach(link => {
                const href = link.getAttribute('href');
                if (href === 'addStudent.jsp') {
                    link.classList.add('active');
                }
            });
        });
        
        // Prevent form resubmission on page refresh
        if (window.history.replaceState) {
            window.history.replaceState(null, null, window.location.href);
        }
        
        // Add smooth scroll to top when form is submitted
        document.getElementById('studentForm').addEventListener('submit', function() {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
        
        // Auto-dismiss alerts after 5 seconds
        setTimeout(function() {
            const alerts = document.querySelectorAll('.alert');
            alerts.forEach(alert => {
                alert.style.transition = 'opacity 0.5s ease';
                alert.style.opacity = '0';
                setTimeout(() => alert.remove(), 500);
            });
        }, 5000);
    </script>
</body>
</html>