<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Garage Management System</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>🚗 Garage Management System</h1>
            <p>Comprehensive solution for garage operations</p>
        </header>

        <div class="main-content">
            <div class="welcome-section">
                <h2>Welcome to Garage Management System</h2>
                <p>Select your role to continue:</p>
            </div>

            <div class="role-cards">
                <!-- Customer Card -->
                <div class="role-card">
                    <div class="card-icon">👤</div>
                    <h3>Customer</h3>
                    <p>Book appointments and manage your service requests</p>
                    <a href="<c:url value='/customer/home'/>" class="btn btn-primary">Customer Portal</a>
                </div>

                <!-- Management Staff Card -->
                <div class="role-card">
                    <div class="card-icon">📊</div>
                    <h3>Management Staff</h3>
                    <p>View statistics and manage operations</p>
                    <a href="<c:url value='/statistics/home'/>" class="btn btn-success">Management Portal</a>
                </div>
            </div>

            <div class="features-section">
                <h3>System Modules</h3>
                <div class="features-grid">
                    <div class="feature-item">
                        <h4>📅 Appointment Booking</h4>
                        <p>Customers can book service appointments online</p>
                    </div>
                    <div class="feature-item">
                        <h4>📈 Supplier Statistics</h4>
                        <p>Management can view detailed supplier import statistics</p>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; 2025 Garage Management System. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
