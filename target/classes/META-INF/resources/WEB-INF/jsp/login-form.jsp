<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${userType} Login - Garage Management System</title>
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
        
        .login-form-container {
            background: rgba(20, 20, 20, 0.95);
            border: 2px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 3rem;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.9);
            max-width: 480px;
            width: 90%;
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
        
        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }
        
        .form-header h2 {
            color: #ffffff;
            font-size: 1.75rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.8);
        }
        
        .form-header p {
            color: #c0c0c0;
            font-size: 1rem;
            text-shadow: 0 1px 5px rgba(0, 0, 0, 0.8);
        }
        
        .login-type-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 0.5rem 1.25rem;
            background: linear-gradient(135deg, #ffffff 0%, #e0e0e0 100%);
            color: #000000;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 25px;
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.3);
        }
        
        .form-group {
            margin-bottom: 1.5rem;
        }
        
        .form-group label {
            display: block;
            color: #ffffff;
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 0.95rem;
        }
        
        .form-control {
            width: 100%;
            padding: 0.875rem 1rem;
            border: 2px solid rgba(255, 255, 255, 0.25);
            border-radius: 10px;
            font-size: 1rem;
            transition: all 0.3s;
            background: rgba(30, 30, 30, 0.9);
            color: #ffffff;
        }
        
        .form-control:focus {
            outline: none;
            border-color: rgba(255, 255, 255, 0.6);
            background: rgba(40, 40, 40, 0.95);
            box-shadow: 0 0 0 3px rgba(255, 255, 255, 0.15);
        }
        
        .form-control::placeholder {
            color: #808080;
        }
        
        .alert-error {
            background: rgba(139, 0, 0, 0.4);
            border: 2px solid rgba(255, 100, 100, 0.6);
            color: #ffcccc;
            padding: 1rem;
            border-radius: 10px;
            margin-bottom: 1.5rem;
            text-align: center;
            font-weight: 500;
        }
        
        .btn-login {
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
        
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 25px rgba(255, 255, 255, 0.4);
            background: linear-gradient(135deg, #ffffff 0%, #f5f5f5 100%);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .back-link {
            display: block;
            text-align: center;
            margin-top: 1.5rem;
            color: #e0e0e0;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            text-shadow: 0 0 10px rgba(255, 255, 255, 0.4);
        }
        
        .back-link:hover {
            text-decoration: underline;
            color: #ffffff;
        }
        
        .demo-credentials {
            background: rgba(40, 40, 40, 0.9);
            border: 2px solid rgba(255, 255, 255, 0.25);
            border-radius: 12px;
            padding: 1.25rem;
            margin-top: 1.5rem;
            font-size: 0.9rem;
        }
        
        .demo-credentials h4 {
            color: #ffffff;
            margin-bottom: 0.75rem;
            font-size: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .demo-credentials p {
            color: #c0c0c0;
            margin: 0.35rem 0;
            line-height: 1.5;
        }
        
        .demo-credentials strong {
            color: #ffffff;
            font-weight: 600;
        }
    </style>
</head>
<body>
    <div class="login-form-container">
        <div class="logo-container">
            <div class="logo-icon">🔧</div>
        </div>
        
        <div class="form-header">
            <h2>Garage Management System</h2>
            <p>Login to your account</p>
        </div>
        
        <div style="text-align: center;">
            <div class="login-type-badge">
                <c:choose>
                    <c:when test="${userType == 'Customer'}">
                        <span>👤</span>
                        <span>Login as Customer</span>
                    </c:when>
                    <c:otherwise>
                        <span>🛡️</span>
                        <span>Login as Staff</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        
        <c:if test="${not empty error}">
            <div class="alert-error">
                ⚠️ ${error}
            </div>
        </c:if>
        
        <form method="post" action="${pageContext.request.contextPath}/login/${userType == 'Customer' ? 'customer' : 'staff'}">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-control" 
                       placeholder="Enter your username" required autofocus>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" 
                       placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="btn-login">
                <c:choose>
                    <c:when test="${userType == 'Customer'}">Login as Customer</c:when>
                    <c:otherwise>Login as Staff</c:otherwise>
                </c:choose>
            </button>
        </form>
        
        <a href="${pageContext.request.contextPath}/login" class="back-link">
            ← Back to Login Selection
        </a>
        
        <div class="demo-credentials">
            <h4>🔑 Demo Credentials</h4>
            <c:choose>
                <c:when test="${userType == 'Customer'}">
                    <p><strong>Username:</strong> customer1</p>
                    <p><strong>Password:</strong> 123456</p>
                    <p style="margin-top: 0.5rem; font-size: 0.85rem; color: #718096;">
                        Other usernames: customer2, customer3, customer4, customer5
                    </p>
                </c:when>
                <c:otherwise>
                    <p><strong>Username:</strong> manager1</p>
                    <p><strong>Password:</strong> 123456</p>
                    <p style="margin-top: 0.5rem; font-size: 0.85rem; color: #718096;">
                        Or use: manager2 / 123456
                    </p>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>
