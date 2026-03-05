<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Login - Student Management System</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    background: linear-gradient(-45deg, #667eea, #764ba2, #6b8cff, #9f7aea);
    background-size: 400% 400%;
    animation: gradientBG 15s ease infinite;
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    padding: 20px;
}

@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

.login-card {
    width: 100%;
    max-width: 420px;
    padding: 45px 35px;
    border-radius: 24px;
    background: rgba(255, 255, 255, 0.95);
    backdrop-filter: blur(10px);
    box-shadow: 0 30px 60px rgba(0, 0, 0, 0.3), 
                0 0 0 1px rgba(255, 255, 255, 0.1) inset;
    transform: translateY(0);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.login-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 35px 70px rgba(0, 0, 0, 0.35), 
                0 0 0 1px rgba(255, 255, 255, 0.2) inset;
}

.login-header {
    text-align: center;
    margin-bottom: 35px;
}

.login-icon {
    width: 70px;
    height: 70px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 20px;
    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.login-icon i {
    font-size: 35px;
    color: white;
}

h3 {
    color: #333;
    font-weight: 600;
    font-size: 26px;
    margin: 0;
    letter-spacing: -0.5px;
}

.subtitle {
    color: #666;
    font-size: 14px;
    margin-top: 8px;
}

/* Error Message Styles */
.error-message {
    background: linear-gradient(135deg, #f8d7da, #f5c6cb);
    border: 1px solid #f5c2c7;
    border-radius: 14px;
    color: #721c24;
    padding: 15px 20px;
    margin-bottom: 25px;
    display: flex;
    align-items: center;
    gap: 12px;
    animation: slideDown 0.5s ease;
    box-shadow: 0 5px 15px rgba(220, 53, 69, 0.2);
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.error-icon {
    font-size: 24px;
    color: #dc3545;
    background: white;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    box-shadow: 0 3px 10px rgba(220, 53, 69, 0.3);
}

.error-content {
    flex: 1;
}

.error-title {
    font-weight: 700;
    font-size: 14px;
    margin-bottom: 3px;
    color: #58151c;
}

.error-text {
    font-size: 13px;
    opacity: 0.9;
    margin: 0;
}

.close-error {
    color: #721c24;
    font-size: 18px;
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.3s ease;
    background: none;
    border: none;
    padding: 0 5px;
}

.close-error:hover {
    opacity: 1;
}

.form-floating-group {
    position: relative;
    margin-bottom: 20px;
}

.input-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    z-index: 10;
    transition: color 0.3s ease;
}

.form-control {
    height: 55px;
    padding: 12px 15px 12px 45px;
    border: 2px solid #e0e0e0;
    border-radius: 14px;
    font-size: 15px;
    transition: all 0.3s ease;
    background: #f8f9fa;
}

.form-control.error-input {
    border-color: #dc3545;
    background: #fff8f8;
}

.form-control.error-input:focus {
    border-color: #dc3545;
    box-shadow: 0 0 0 4px rgba(220, 53, 69, 0.1);
}

.form-control:focus {
    border-color: #667eea;
    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
    background: white;
    outline: none;
}

.form-control:focus + .input-icon {
    color: #667eea;
}

.form-control.error-input:focus + .input-icon {
    color: #dc3545;
}

.form-label {
    position: absolute;
    left: 45px;
    top: 50%;
    transform: translateY(-50%);
    color: #999;
    pointer-events: none;
    transition: all 0.3s ease;
    background: transparent;
    padding: 0 5px;
    font-size: 15px;
}

.form-control:focus ~ .form-label,
.form-control:not(:placeholder-shown) ~ .form-label {
    top: 0;
    font-size: 12px;
    color: #667eea;
    background: linear-gradient(to bottom, white 50%, transparent 50%);
}

.form-control.error-input:focus ~ .form-label,
.form-control.error-input:not(:placeholder-shown) ~ .form-label {
    color: #dc3545;
}

.form-control::placeholder {
    color: transparent;
}

.options-row {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 20px 0 25px;
}

.remember-me {
    display: flex;
    align-items: center;
    gap: 8px;
    color: #666;
    cursor: pointer;
}

.remember-me input[type="checkbox"] {
    width: 18px;
    height: 18px;
    cursor: pointer;
    accent-color: #667eea;
}

.forgot-link {
    color: #667eea;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: color 0.3s ease;
}

.forgot-link:hover {
    color: #764ba2;
    text-decoration: underline;
}

.btn-login {
    width: 100%;
    height: 55px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border: none;
    border-radius: 14px;
    color: white;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: 0.5px;
    cursor: pointer;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    box-shadow: 0 10px 20px rgba(102, 126, 234, 0.3);
}

.btn-login:hover {
    background: linear-gradient(135deg, #764ba2, #667eea);
    transform: translateY(-2px);
    box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
}

.btn-login:active {
    transform: translateY(0);
}

.btn-login i {
    margin-right: 8px;
    font-size: 18px;
    vertical-align: middle;
}

.btn-login span {
    vertical-align: middle;
}

.demo-credentials {
    margin-top: 25px;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 14px;
    border: 1px dashed #ccc;
    text-align: center;
}

.demo-credentials p {
    color: #666;
    font-size: 13px;
    margin: 5px 0;
}

.demo-credentials i {
    color: #667eea;
    margin-right: 5px;
}

.credentials-badge {
    display: inline-block;
    background: #e9ecef;
    padding: 4px 12px;
    border-radius: 20px;
    font-size: 12px;
    color: #495057;
    margin: 5px 4px;
    border: 1px solid #dee2e6;
}

.footer-text {
    text-align: center;
    margin-top: 20px;
    color: #999;
    font-size: 13px;
}

.footer-text i {
    color: #ff6b6b;
    font-size: 12px;
}
</style>
</head>

<body>

<div class="login-card">
    
    <div class="login-header">
        <div class="login-icon">
            <i class="bi bi-mortarboard-fill"></i>
        </div>
        <h3>Welcome Back</h3>
        <div class="subtitle">Please login to your account</div>
    </div>

    <%
        // Check if there's an error message from the LoginServlet
        String error = request.getParameter("error");
        String errorMessage = "";
        boolean hasError = false;
        
        if (error != null) {
            hasError = true;
            if (error.equals("1")) {
                errorMessage = "Invalid username or password. Please try again.";
            } else if (error.equals("2")) {
                errorMessage = "Database connection error. Please try again later.";
            } else if (error.equals("3")) {
                errorMessage = "Your account has been locked. Please contact administrator.";
            } else {
                errorMessage = "Login failed. Please check your credentials.";
            }
        }
    %>

    <!-- Error Message Display -->
    <% if (hasError) { %>
    <div class="error-message" id="errorMessage">
        <div class="error-icon">
            <i class="bi bi-exclamation-triangle-fill"></i>
        </div>
        <div class="error-content">
            <div class="error-title">Login Failed</div>
            <p class="error-text"><%= errorMessage %></p>
        </div>
        <button class="close-error" onclick="closeErrorMessage()">
            <i class="bi bi-x-lg"></i>
        </button>
    </div>
    <% } %>

    <form action="LoginServlet" method="post" id="loginForm">
        <div class="form-floating-group">
            <i class="bi bi-person-fill input-icon"></i>
            <input type="text" name="username" class="form-control <%= hasError ? "error-input" : "" %>" 
                   id="username" placeholder="Username" required 
                   value="<%= request.getParameter("username") != null ? request.getParameter("username") : "" %>">
            <label for="username" class="form-label">Username</label>
        </div>

        <div class="form-floating-group">
            <i class="bi bi-lock-fill input-icon"></i>
            <input type="password" name="password" class="form-control <%= hasError ? "error-input" : "" %>" 
                   id="password" placeholder="Password" required>
            <label for="password" class="form-label">Password</label>
        </div>

        <div class="options-row">
            <label class="remember-me">
                <input type="checkbox" name="remember"> Remember me
            </label>
            <a href="#" class="forgot-link">Forgot Password?</a>
        </div>

        <button type="submit" class="btn-login">
            <i class="bi bi-box-arrow-in-right"></i>
            <span>Login to Dashboard</span>
        </button>
    </form>

    <div class="demo-credentials">
        <p><i class="bi bi-info-circle-fill"></i> Demo Credentials</p>
        <div>
            <span class="credentials-badge"><i class="bi bi-person"></i> Username: user</span>
            <span class="credentials-badge"><i class="bi bi-key"></i> Password: user123</span>
        </div>
    </div>

    <div class="footer-text">
        <i class="bi bi-shield-lock-fill"></i> Secure Login • SSL Encrypted
    </div>

</div>

<script>
// Function to close error message
function closeErrorMessage() {
    var errorMessage = document.getElementById('errorMessage');
    if (errorMessage) {
        errorMessage.style.animation = 'slideDown 0.5s reverse';
        setTimeout(function() {
            errorMessage.remove();
        }, 500);
    }
}

// Auto-hide error message after 5 seconds
setTimeout(function() {
    closeErrorMessage();
}, 5000);

// Optional: Add shake animation to form when there's an error
<% if (hasError) { %>
document.addEventListener('DOMContentLoaded', function() {
    var loginCard = document.querySelector('.login-card');
    loginCard.style.animation = 'shake 0.5s ease';
    
    // Add shake animation
    var style = document.createElement('style');
    style.innerHTML = `
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(-5px); }
            20%, 40%, 60%, 80% { transform: translateX(5px); }
        }
    `;
    document.head.appendChild(style);
    
    // Remove animation after it completes
    setTimeout(function() {
        loginCard.style.animation = '';
    }, 500);
});
<% } %>

// Optional: Auto-fill demo credentials for convenience
document.addEventListener('DOMContentLoaded', function() {
    // Uncomment below to auto-fill demo credentials
    // document.getElementById('username').value = 'user';
    // document.getElementById('password').value = 'user123';
});
</script>

</body>
</html>