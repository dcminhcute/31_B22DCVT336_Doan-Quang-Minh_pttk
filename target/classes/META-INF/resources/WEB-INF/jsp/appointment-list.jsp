<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Appointments - Garage Management</title>
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
                    <span>Welcome, ${customer.fullName}</span>
                </div>
            </div>
        </header>

        <!-- Navigation -->
        <nav class="navigation">
            <ul>
                <li><a href="<c:url value='/customer/home/${customer.id}'/>">Home</a></li>
                <li><a href="<c:url value='/appointment/list/${customer.id}'/>" class="active">My Appointments</a></li>
                <li><a href="<c:url value='/appointment/book/${customer.id}'/>">Book Appointment</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="<c:url value='/customer/home/${customer.id}'/>">Home</a>
            <span>›</span>
            <span class="current">My Appointments</span>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="page-header">
                <h2>📅 My Appointments</h2>
                <p>View all your service appointments</p>
            </div>

            <!-- Upcoming Appointments Section -->
            <div class="appointments-section">
                <div class="section-header">
                    <h3>🔜 Upcoming Appointments</h3>
                    <a href="<c:url value='/appointment/book/${customer.id}'/>" class="btn btn-primary btn-small">
                        <span class="btn-icon">➕</span>
                        Book New
                    </a>
                </div>

                <c:choose>
                    <c:when test="${not empty upcomingAppointments}">
                        <div class="appointments-grid">
                            <c:forEach var="appointment" items="${upcomingAppointments}">
                                <div class="appointment-card">
                                    <div class="appointment-header">
                                        <span class="status-badge status-${appointment.status}">
                                            ${appointment.status.displayName}
                                        </span>
                                        <span class="service-type">${appointment.serviceType.displayName}</span>
                                    </div>
                                    
                                    <div class="appointment-body">
                                        <div class="appointment-info">
                                            <div class="info-item">
                                                <span class="icon">📅</span>
                                                <span class="label">Date:</span>
                                                <span class="value">${appointment.appointmentDate}</span>
                                            </div>
                                            <div class="info-item">
                                                <span class="icon">🕐</span>
                                                <span class="label">Time:</span>
                                                <span class="value">${appointment.appointmentTime}</span>
                                            </div>
                                        </div>
                                        
                                        <c:if test="${not empty appointment.notes}">
                                            <div class="appointment-notes">
                                                <strong>Notes:</strong>
                                                <p>${appointment.notes}</p>
                                            </div>
                                        </c:if>
                                    </div>
                                    
                                    <div class="appointment-footer">
                                        <small class="text-muted">
                                            Booked on: ${appointment.createdAt.toLocalDate()}
                                        </small>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="empty-state">
                            <div class="empty-icon">📭</div>
                            <h4>No Upcoming Appointments</h4>
                            <p>You don't have any scheduled appointments</p>
                            <a href="<c:url value='/appointment/book/${customer.id}'/>" class="btn btn-primary">
                                Book Your First Appointment
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Past Appointments Section -->
            <div class="appointments-section">
                <div class="section-header">
                    <h3>📜 Past Appointments</h3>
                </div>

                <c:choose>
                    <c:when test="${not empty pastAppointments}">
                        <div class="table-container">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Service Type</th>
                                        <th>Status</th>
                                        <th>Notes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="appointment" items="${pastAppointments}" varStatus="status">
                                        <tr>
                                            <td>${status.index + 1}</td>
                                            <td>${appointment.appointmentDate}</td>
                                            <td>${appointment.appointmentTime}</td>
                                            <td>${appointment.serviceType.displayName}</td>
                                            <td>
                                                <span class="status-badge status-${appointment.status}">
                                                    ${appointment.status.displayName}
                                                </span>
                                            </td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${not empty appointment.notes}">
                                                        ${appointment.notes}
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="text-muted">-</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="info-box">
                            <p>No past appointments found.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Quick Actions -->
            <div class="actions-section">
                <a href="<c:url value='/customer/home/${customer.id}'/>" class="btn btn-secondary">
                    <span class="btn-icon">←</span>
                    Back to Home
                </a>
                <a href="<c:url value='/appointment/book/${customer.id}'/>" class="btn btn-primary">
                    <span class="btn-icon">➕</span>
                    Book New Appointment
                </a>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Garage Management System. All rights reserved.</p>
        </footer>
    </div>
</body>
</html>
