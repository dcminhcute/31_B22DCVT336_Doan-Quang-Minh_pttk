<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Garage Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
            background: url('${pageContext.request.contextPath}/images/image-1762094557673.jpeg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            position: relative;
        }
        
        body::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(2px);
            z-index: 0;
        }
        
        .login-container {
            background: rgba(20, 20, 20, 0.95);
            border: 2px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.9);
            max-width: 480px;
            width: 90%;
            text-align: center;
            position: relative;
            z-index: 1;
            backdrop-filter: blur(15px);
        }
        
        .logo-container {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #ffffff 0%, #e0e0e0 100%);
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            margin: 0 auto 1.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 20px rgba(255, 255, 255, 0.3);
        }
        
        .logo-icon {
            font-size: 2.5rem;
            color: #000000;
        }
        
        .login-header h1 {
            color: #ffffff;
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.8);
        }
        
        .login-header p {
            color: #c0c0c0;
            font-size: 1rem;
            margin-bottom: 2rem;
            text-shadow: 0 1px 5px rgba(0, 0, 0, 0.8);
        }
        
        .login-type-label {
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 600;
            text-align: left;
            margin-bottom: 1rem;
            display: block;
        }
        
        .login-options {
            display: flex;
            gap: 1rem;
            margin-bottom: 2rem;
        }
        
        .login-option {
            flex: 1;
            background: rgba(30, 30, 30, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 1.5rem 1rem;
            transition: all 0.3s;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.75rem;
        }
        
        .login-option:hover {
            border-color: rgba(255, 255, 255, 0.5);
            background: rgba(40, 40, 40, 0.95);
            transform: translateY(-3px);
            box-shadow: 0 5px 20px rgba(255, 255, 255, 0.2);
        }
        
        .login-option.active {
            border-color: #ffffff;
            background: linear-gradient(135deg, #ffffff 0%, #e0e0e0 100%);
            color: #000000;
            box-shadow: 0 0 30px rgba(255, 255, 255, 0.5);
        }
        
        .option-icon {
            font-size: 2rem;
            color: #c0c0c0;
            transition: all 0.3s;
            filter: drop-shadow(0 0 8px rgba(255, 255, 255, 0.3));
        }
        
        .login-option.active .option-icon {
            color: #000000;
            filter: drop-shadow(0 0 5px rgba(0, 0, 0, 0.3));
        }
        
        .option-title {
            color: #c0c0c0;
            font-size: 1.1rem;
            font-weight: 600;
            transition: all 0.3s;
        }
        
        .login-option.active .option-title {
            color: #000000;
        }
        
        .btn-continue {
            width: 100%;
            padding: 1rem;
            background: linear-gradient(135deg, #ffffff 0%, #e0e0e0 100%);
            color: #000000;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(255, 255, 255, 0.2);
        }
        
        .btn-continue:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(255, 255, 255, 0.4);
            background: linear-gradient(135deg, #ffffff 0%, #f5f5f5 100%);
        }
        
        .btn-continue:active {
            transform: translateY(0);
        }
        
        .demo-note {
            margin-top: 1.5rem;
            padding: 1rem;
            background: rgba(40, 40, 40, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 10px;
            color: #e0e0e0;
            font-size: 0.9rem;
        }
        
        .demo-note strong {
            color: #ffffff;
        }
        
        .footer-text {
            margin-top: 2rem;
            color: #909090;
            font-size: 0.85rem;
        }
    </style>
    <script>
        function selectLoginType(type) {
            // Remove active class from all options
            document.querySelectorAll('.login-option').forEach(option => {
                option.classList.remove('active');
            });
            
            // Add active class to selected option
            event.currentTarget.classList.add('active');
            
            // Update the redirect URL
            document.getElementById('continueBtn').onclick = function() {
                window.location.href = '${pageContext.request.contextPath}/login/' + type;
            };
        }
        
        // Set default selection to customer
        window.onload = function() {
            document.querySelector('.login-option[data-type="customer"]').classList.add('active');
            document.getElementById('continueBtn').onclick = function() {
                window.location.href = '${pageContext.request.contextPath}/login/customer';
            };
        };
    </script>
</head>
<body>
    <div class="login-container">
        <div class="logo-container">
            <div class="logo-icon">�</div>
        </div>
        
        <div class="login-header">
            <h1>Garage Management System</h1>
            <p>Login to your account</p>
        </div>
        
        <label class="login-type-label">Login as:</label>
        
        <div class="login-options">
            <div class="login-option" data-type="customer" onclick="selectLoginType('customer')">
                <div class="option-icon">👤</div>
                <div class="option-title">Customer</div>
            </div>
            
            <div class="login-option" data-type="staff" onclick="selectLoginType('staff')">
                <div class="option-icon">�️</div>
                <div class="option-title">Staff</div>
            </div>
        </div>
        
        <button id="continueBtn" class="btn-continue">
            Continue to Login
        </button>
        
        <div class="demo-note">
            <strong>Demo:</strong> Select your login type and continue
        </div>
        
        <div class="footer-text">
            © 2025 Garage Management System
        </div>
    </div>
</body>
</html>
