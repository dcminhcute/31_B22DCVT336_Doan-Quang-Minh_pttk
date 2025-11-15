<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Statistics - Garage Management</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/module2.css'/>">
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <div class="header-content">
                <h1>🚗 Garage Management System</h1>
                <div class="user-info">
                    <span>Management Portal</span>
                </div>
            </div>
        </header>

        <!-- Navigation -->
        <nav class="navigation">
            <ul>
                <li><a href="<c:url value='/statistics/home'/>">Home</a></li>
                <li><a href="<c:url value='/statistics/suppliers'/>" class="active">Supplier Statistics</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="statistics-container">
                <div class="page-header">
                    <h2>📊 Supplier Statistics by Imported Quantity</h2>
                    <p>View supplier import statistics within a date range</p>
                </div>

                <!-- Error Message -->
                <c:if test="${not empty error}">
                    <div class="alert alert-error">
                        <strong>Error!</strong> ${error}
                    </div>
                </c:if>

                <!-- Date Range Form -->
                <div class="filter-section">
                    <form action="<c:url value='/statistics/suppliers'/>" method="post" class="filter-form">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="startDate">Start Date</label>
                                <input type="date" name="startDate" id="startDate" 
                                       value="${startDate}" 
                                       class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="endDate">End Date</label>
                                <input type="date" name="endDate" id="endDate" 
                                       value="${endDate}" 
                                       class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>&nbsp;</label>
                                <button type="submit" class="btn btn-primary">
                                    <span class="btn-icon">🔍</span>
                                    View Statistics
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Statistics Results -->
                <c:if test="${not empty supplierStats}">
                    <div class="results-section">
                        <div class="results-header">
                            <h3>Suppliers Information</h3>
                            <p>Showing results from <strong>${startDate}</strong> 
                               to <strong>${endDate}</strong></p>
                        </div>

                        <div class="table-container">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Supplier Code</th>
                                        <th>Supplier Name</th>
                                        <th>Total Imported Quantity</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${not empty supplierStats}">
                                            <c:forEach var="stat" items="${supplierStats}" varStatus="status">
                                                <tr>
                                                    <td>${status.index + 1}</td>
                                                    <td>${stat.supplierCode}</td>
                                                    <td><strong>${stat.supplierName}</strong></td>
                                                    <td class="number">${stat.totalQuantity}</td>
                                                    <td>
                                                        <c:url var="detailUrl" value="/statistics/supplier/${stat.id}">
                                                            <c:param name="startDate" value="${startDate}"/>
                                                            <c:param name="endDate" value="${endDate}"/>
                                                        </c:url>
                                                        <a href="${detailUrl}" class="btn btn-small btn-info">
                                                            View Detail
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="5" class="text-center">
                                                    No supplier data found for the selected date range.
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:if>

                <!-- Instructions (shown when no results) -->
                <c:if test="${empty supplierStats}">
                    <div class="info-box">
                        <h4>ℹ️ Instructions</h4>
                        <ul>
                            <li>Select a date range using the form above</li>
                            <li>Click "View Statistics" to see supplier import data</li>
                            <li>The results will show suppliers sorted by total imported quantity</li>
                            <li>Click "View Detail" to see detailed import information for each supplier</li>
                        </ul>
                    </div>
                </c:if>
            </div>
        </div>

        <!-- Footer -->
        <footer class="footer">
            <p>&copy; 2025 Garage Management System. All rights reserved.</p>
        </footer>
    </div>

    <script src="<c:url value='/js/statistics.js'/>"></script>
</body>
</html>
