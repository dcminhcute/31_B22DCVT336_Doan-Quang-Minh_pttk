<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Appointment - Garage Management</title>
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
                <li><a href="<c:url value='/customer/home/${customer.id}'/>">Home</a></li>
                <li><a href="<c:url value='/appointment/list/${customer.id}'/>">My Appointments</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="booking-container">
                <div class="booking-header">
                    <h2>📅 Book an Appointment</h2>
                    <p>Please fill in the details below to book your service appointment</p>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        <strong>Error!</strong> ${error}
                    </div>
                </c:if>

                <!-- Booking Form -->
                <form action="<c:url value='/appointment/book'/>" method="post" class="booking-form" id="bookingForm">
                    <input type="hidden" name="customerId" value="${customer.id}">

                    <div class="form-section">
                        <h3>Customer Information</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Full Name</label>
                                <input type="text" value="${customer.fullName}" readonly class="form-control-readonly">
                            </div>
                            <div class="form-group">
                                <label>Phone Number</label>
                                <input type="text" value="${customer.phone}" readonly class="form-control-readonly">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="text" value="${customer.email}" readonly class="form-control-readonly">
                            </div>
                            <div class="form-group">
                                <label>Vehicle</label>
                                <input type="text" value="${customer.vehicleInfo}" readonly class="form-control-readonly">
                            </div>
                        </div>
                    </div>

                    <div class="form-section">
                        <h3>Appointment Details</h3>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="serviceType">Service Type <span class="required">*</span></label>
                                <select name="serviceType" id="serviceType" class="form-control" required>
                                    <option value="">-- Select Service --</option>
                                    <c:forEach var="type" items="${serviceTypes}">
                                        <option value="${type}">${type.displayName}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="appointmentDate">Appointment Date <span class="required">*</span></label>
                                <input type="date" name="appointmentDate" id="appointmentDate" 
                                       class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="appointmentTime">Appointment Time <span class="required">*</span></label>
                                <select name="appointmentTime" id="appointmentTime" class="form-control" required>
                                    <option value="">-- Select Time --</option>
                                    <option value="08:00:00">08:00 AM</option>
                                    <option value="08:30:00">08:30 AM</option>
                                    <option value="09:00:00">09:00 AM</option>
                                    <option value="09:30:00">09:30 AM</option>
                                    <option value="10:00:00">10:00 AM</option>
                                    <option value="10:30:00">10:30 AM</option>
                                    <option value="11:00:00">11:00 AM</option>
                                    <option value="11:30:00">11:30 AM</option>
                                    <option value="13:00:00">01:00 PM</option>
                                    <option value="13:30:00">01:30 PM</option>
                                    <option value="14:00:00">02:00 PM</option>
                                    <option value="14:30:00">02:30 PM</option>
                                    <option value="15:00:00">03:00 PM</option>
                                    <option value="15:30:00">03:30 PM</option>
                                    <option value="16:00:00">04:00 PM</option>
                                    <option value="16:30:00">04:30 PM</option>
                                    <option value="17:00:00">05:00 PM</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group full-width">
                                <label for="notes">Additional Notes (Optional)</label>
                                <textarea name="notes" id="notes" class="form-control" rows="4" 
                                          placeholder="Please provide any additional information about your vehicle or service requirements..."></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-actions">
                        <button type="submit" class="btn btn-primary btn-large">
                            <span class="btn-icon">✓</span>
                            Confirm Booking
                        </button>
                        <a href="<c:url value='/customer/home/${customer.id}'/>" class="btn btn-secondary btn-large">
                            <span class="btn-icon">✕</span>
                            Cancel
                        </a>
                    </div>
                </form>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Garage Management System. All rights reserved.</p>
        </footer>
    </div>

    <script src="<c:url value='/js/appointment.js'/>"></script>
</body>
</html>
