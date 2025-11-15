<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supplier Details - Garage Management</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/module2.css'/>"/>
    <style>
        body {
            background: linear-gradient(135deg, #000000 0%, #1a1a1a 100%);
        }
        
        .container {
            background: transparent;
        }
        
        .info-card {
            background: #1a1a1a;
            border: 2px solid rgba(255, 255, 255, 0.15);
        }
        
        .info-card h2 {
            color: #ffffff;
        }
        
        .info-row label {
            color: #b0b0b0;
        }
        
        .info-row span {
            color: #ffffff;
        }
        
        .highlight {
            color: #ff6b6b;
            font-weight: 700;
        }
        
        .table-section {
            background: #1a1a1a;
            border: 2px solid rgba(255, 255, 255, 0.15);
        }
        
        .section-header h3 {
            color: #ffffff;
        }
        
        .section-header p,
        .section-header p strong {
            color: #b0b0b0;
        }
        
        .data-table thead {
            background: #2a2a2a;
            color: #ffffff;
        }
        
        .data-table tbody tr {
            background: #1a1a1a;
        }
        
        .data-table tbody tr:hover {
            background: #2a2a2a;
        }
        
        .data-table td {
            color: #ffffff;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .breadcrumb {
            color: #b0b0b0;
        }
        
        .breadcrumb a {
            color: #ffffff;
        }
        
        .breadcrumb .current {
            color: #808080;
        }
    </style>
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
                <li><a href="<c:url value='/statistics/suppliers'/>">Supplier Statistics</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Breadcrumb -->
        <div class="breadcrumb">
            <a href="<c:url value='/statistics/home'/>">Home</a>
            <span>›</span>
            <a href="<c:url value='/statistics/suppliers'/>">Supplier Statistics</a>
            <span>›</span>
            <span class="current">Supplier Details</span>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="details-container">
                <!-- Supplier Information Card -->
                <div class="info-card">
                    <h2>🏢 Supplier Information</h2>
                    <div class="supplier-info-grid">
                        <div class="info-row">
                            <label>Supplier Code:</label>
                            <span class="highlight">${supplier.supplierCode}</span>
                        </div>
                        <div class="info-row">
                            <label>Supplier Name:</label>
                            <span><strong>${supplier.supplierName}</strong></span>
                        </div>
                        <div class="info-row">
                            <label>Contact Person:</label>
                            <span>${supplier.contactPerson}</span>
                        </div>
                        <div class="info-row">
                            <label>Email:</label>
                            <span>${supplier.email}</span>
                        </div>
                        <div class="info-row">
                            <label>Phone:</label>
                            <span>${supplier.phone}</span>
                        </div>
                        <div class="info-row">
                            <label>Address:</label>
                            <span>${supplier.address}, ${supplier.city}, ${supplier.country}</span>
                        </div>
                    </div>
                </div>

                <!-- Import Details -->
                <div class="table-section">
                    <div class="section-header">
                        <h3>📦 Imported Spare Parts</h3>
                        <p>Period: <strong>${startDate}</strong> 
                           to <strong>${endDate}</strong></p>
                    </div>

                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Order Code</th>
                                    <th>Import Date</th>
                                    <th>Total Parts</th>
                                    <th>Total Amount</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty orders}">
                                        <c:forEach var="order" items="${orders}" varStatus="status">
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td><strong>${order.orderCode}</strong></td>
                                                <td>${order.orderDate}</td>
                                                <td class="number">
                                                    <c:set var="totalQty" value="0"/>
                                                    <c:forEach var="detail" items="${order.orderDetails}">
                                                        <c:set var="totalQty" value="${totalQty + detail.quantity}"/>
                                                    </c:forEach>
                                                    ${totalQty} items
                                                </td>
                                                <td class="number">
                                                    <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫"/>
                                                </td>
                                                <td>
                                                    <span class="status-badge status-${order.status}">
                                                        ${order.status.displayName}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="<c:url value='/order/${order.id}'/>" 
                                                       class="btn btn-small btn-primary">
                                                        View Order
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" class="text-center">
                                                No import orders found for this supplier in the selected date range.
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Back Button -->
                <div class="actions-section">
                    <a href="<c:url value='/statistics/suppliers'/>" class="btn btn-secondary">
                        <span class="btn-icon">←</span>
                        Back to Statistics
                    </a>
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
