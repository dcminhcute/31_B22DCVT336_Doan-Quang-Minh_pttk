<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment Confirmed - Garage Management</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/module1.css'/>">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <div class="header-content">
                <h1>🚗 Garage Management System</h1>
            </div>
        </header>

        <!-- Main Content -->
        <div class="main-content">
            <div class="success-container">
                <div class="success-icon">
                    <span class="checkmark">✓</span>
                </div>
                
                <h2 class="success-title">Appointment Booked Successfully!</h2>
                <p class="success-message">Your appointment has been confirmed. We look forward to serving you!</p>

                <div class="appointment-summary">
                    <h3>Appointment Details</h3>
                    <div class="summary-grid">
                        <div class="summary-item">
                            <label>Confirmation Number:</label>
                            <span class="highlight">#${appointment.id}</span>
                        </div>
                        <div class="summary-item">
                            <label>Customer Name:</label>
                            <span>${appointment.customer.fullName}</span>
                        </div>
                        <div class="summary-item">
                            <label>Service Type:</label>
                            <span>${appointment.serviceType.displayName}</span>
                        </div>
                        <div class="summary-item">
                            <label>Appointment Date:</label>
                            <span>${appointment.appointmentDate}</span>
                        </div>
                        <div class="summary-item">
                            <label>Appointment Time:</label>
                            <span>${appointment.appointmentTime}</span>
                        </div>
                        <div class="summary-item">
                            <label>Status:</label>
                            <span class="status-badge status-${appointment.status}">${appointment.status.displayName}</span>
                        </div>
                        <c:if test="${not empty appointment.notes}">
                            <div class="summary-item full-width">
                                <label>Notes:</label>
                                <span>${appointment.notes}</span>
                            </div>
                        </c:if>
                    </div>
                </div>

                <div class="success-actions">
                    <a href="<c:url value='/customer/home/${appointment.customer.id}'/>" class="btn btn-primary btn-large">
                        <span class="btn-icon">🏠</span>
                        Back to Home
                    </a>
                    <a href="<c:url value='/appointment/list/${appointment.customer.id}'/>" class="btn btn-secondary btn-large">
                        <span class="btn-icon">📋</span>
                        View All Appointments
                    </a>
                    <a href="<c:url value='/appointment/book/${appointment.customer.id}'/>" class="btn btn-outline btn-large">
                        <span class="btn-icon">➕</span>
                        Book Another Appointment
                    </a>
                </div>

                <div class="info-box">
                    <h4>📌 Important Information</h4>
                    <ul>
                        <li>Please arrive 10 minutes before your scheduled appointment</li>
                        <li>Bring your vehicle registration documents</li>
                        <li>If you need to cancel or reschedule, please contact us at least 24 hours in advance</li>
                        <li>You will receive a confirmation email shortly</li>
                    </ul>
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
