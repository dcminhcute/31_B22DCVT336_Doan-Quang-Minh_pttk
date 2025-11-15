<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Home - Garage Management</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/module1.css'/>">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <div class="header-content">
                <h1>🚗 Garage Management System</h1>
                <div class="user-info">
                    <span>Welcome, <strong>${customer.fullName}</strong></span>
                </div>
            </div>
        </header>

        <!-- Navigation -->
        <nav class="navigation">
            <ul>
                <li><a href="<c:url value='/customer/home/${customer.id}'/>" class="active">Home</a></li>
                <li><a href="<c:url value='/appointment/list/${customer.id}'/>">My Appointments</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="customer-dashboard">
                <div class="dashboard-header">
                    <h2>Customer Dashboard</h2>
                </div>

                <!-- Customer Info Card -->
                <div class="info-card">
                    <h3>Your Information</h3>
                    <div class="info-grid">
                        <div class="info-item">
                            <label>Name:</label>
                            <span>${customer.fullName}</span>
                        </div>
                        <div class="info-item">
                            <label>Email:</label>
                            <span>${customer.email}</span>
                        </div>
                        <div class="info-item">
                            <label>Phone:</label>
                            <span>${customer.phone}</span>
                        </div>
                        <div class="info-item">
                            <label>Vehicle:</label>
                            <span>${customer.vehicleInfo}</span>
                        </div>
                        <div class="info-item">
                            <label>Address:</label>
                            <span>${customer.address}</span>
                        </div>
                    </div>
                </div>

                <!-- Quick Actions -->
                <div class="quick-actions">
                    <h3>Quick Actions</h3>
                    <div class="action-buttons">
                        <a href="<c:url value='/appointment/book/${customer.id}'/>" class="btn btn-primary btn-large">
                            <span class="btn-icon">📅</span>
                            Book New Appointment
                        </a>
                        <a href="<c:url value='/appointment/list/${customer.id}'/>" class="btn btn-secondary btn-large">
                            <span class="btn-icon">📋</span>
                            View My Appointments
                        </a>
                    </div>
                </div>

                <!-- Services Available -->
                <div class="services-section">
                    <h3>Our Services</h3>
                    <div class="services-grid">
                        <div class="service-card">
                            <div class="service-icon">🛢️</div>
                            <h4>Oil Change</h4>
                            <p>Regular oil change service</p>
                        </div>
                        <div class="service-card">
                            <div class="service-icon">🔧</div>
                            <h4>Engine Repair</h4>
                            <p>Professional engine diagnostics and repair</p>
                        </div>
                        <div class="service-card">
                            <div class="service-icon">🛞</div>
                            <h4>Tire Service</h4>
                            <p>Tire change and alignment</p>
                        </div>
                        <div class="service-card">
                            <div class="service-icon">🚦</div>
                            <h4>Brake Service</h4>
                            <p>Brake inspection and replacement</p>
                        </div>
                        <div class="service-card">
                            <div class="service-icon">❄️</div>
                            <h4>AC Repair</h4>
                            <p>Air conditioning service</p>
                        </div>
                        <div class="service-card">
                            <div class="service-icon">✅</div>
                            <h4>General Checkup</h4>
                            <p>Complete vehicle inspection</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Garage Management System. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
