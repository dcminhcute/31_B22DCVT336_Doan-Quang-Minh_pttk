<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Details - Garage Management</title>
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/module2.css'/>"/>
    <style>
        /* Dark theme for order-details page */
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
        
        .info-card h3 {
            color: #ffffff;
        }
        
        .info-content .info-item label {
            color: #b0b0b0;
        }
        
        .info-content .info-item span {
            color: #ffffff;
        }
        
        .parts-section {
            background: #1a1a1a;
            border: 2px solid rgba(255, 255, 255, 0.15);
        }
        
        .parts-section h3 {
            color: #ffffff;
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
        
        .data-table tfoot {
            background: #2a2a2a;
            color: #ffffff;
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
        
        .page-header h1 {
            color: #ffffff;
        }
        
        .page-header p {
            color: #b0b0b0;
        }
        
        /* Order header card text colors */
        .order-header-card .summary-item label,
        .order-header-card .summary-item span,
        .order-header-card .highlight {
            color: #ffffff !important;
        }
        
        /* Remove badge background for status in red header */
        .order-header-card .status-badge {
            background: transparent !important;
            border: none !important;
            padding: 0 !important;
            border-radius: 0 !important;
            color: #ffffff !important;
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
            <a href="<c:url value='/statistics/supplier/${order.supplier.id}'/>">Supplier Details</a>
            <span>›</span>
            <span class="current">Order Details</span>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="order-details-container">
                <div class="page-header">
                    <h2>📄 Order Details</h2>
                    <p>Complete information about the selected order</p>
                </div>

                <!-- Order Header Information -->
                <div class="order-header-card">
                    <div class="order-summary">
                        <div class="summary-item">
                            <label>Order Code:</label>
                            <span class="highlight large">${order.orderCode}</span>
                        </div>
                        <div class="summary-item">
                            <label>Status:</label>
                            <span class="status-badge status-${order.status} large">
                                ${order.status.displayName}
                            </span>
                        </div>
                    </div>
                </div>

                <div class="info-grid">
                    <!-- Supplier Information -->
                    <div class="info-card">
                        <h3>🏢 Supplier Information</h3>
                        <div class="info-content">
                            <div class="info-item">
                                <label>Supplier Name:</label>
                                <span><strong>${order.supplier.supplierName}</strong></span>
                            </div>
                            <div class="info-item">
                                <label>Supplier Code:</label>
                                <span>${order.supplier.supplierCode}</span>
                            </div>
                            <div class="info-item">
                                <label>Contact Person:</label>
                                <span>${order.supplier.contactPerson}</span>
                            </div>
                            <div class="info-item">
                                <label>Phone:</label>
                                <span>${order.supplier.phone}</span>
                            </div>
                            <div class="info-item">
                                <label>Email:</label>
                                <span>${order.supplier.email}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Order Information -->
                    <div class="info-card">
                        <h3>📋 Order Information</h3>
                        <div class="info-content">
                            <div class="info-item">
                                <label>Import Date:</label>
                                <span>${order.orderDate}</span>
                            </div>
                            <div class="info-item">
                                <label>Processed By:</label>
                                <span>${order.warehouseStaff.fullName}</span>
                            </div>
                            <div class="info-item">
                                <label>Staff Code:</label>
                                <span>${order.warehouseStaff.staffCode}</span>
                            </div>
                            <div class="info-item">
                                <label>Total Amount:</label>
                                <span class="amount"><fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫"/></span>
                            </div>
                            <c:if test="${not empty order.notes}">
                                <div class="info-item">
                                    <label>Notes:</label>
                                    <span>${order.notes}</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- Spare Parts Details -->
                <div class="parts-section">
                    <h3>📦 Spare Parts in Order</h3>
                    <div class="table-container">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Part Code</th>
                                    <th>Part Name</th>
                                    <th>Category</th>
                                    <th class="text-right">Quantity</th>
                                    <th class="text-right">Unit Price</th>
                                    <th class="text-right">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="detail" items="${orderDetails}" varStatus="status">
                                    <tr>
                                        <td>${status.index + 1}</td>
                                        <td>${detail.sparepart.partCode}</td>
                                        <td><strong>${detail.sparepart.partName}</strong></td>
                                        <td>${detail.sparepart.category.displayName}</td>
                                        <td class="text-right">${detail.quantity} ${detail.sparepart.unit}</td>
                                        <td class="text-right">
                                            <fmt:formatNumber value="${detail.unitPrice}" type="currency" currencySymbol="₫"/>
                                        </td>
                                        <td class="text-right">
                                            <strong><fmt:formatNumber value="${detail.subtotal}" type="currency" currencySymbol="₫"/></strong>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr class="total-row">
                                    <td colspan="6" class="text-right"><strong>TOTAL AMOUNT:</strong></td>
                                    <td class="text-right">
                                        <strong class="total-amount">
                                            <fmt:formatNumber value="${order.totalAmount}" type="currency" currencySymbol="₫"/>
                                        </strong>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

                <!-- Actions -->
                <div class="actions-section">
                    <button onclick="window.history.back()" class="btn btn-secondary">
                        <span class="btn-icon">←</span>
                        Back to Supplier Details
                    </button>
                    <button onclick="window.print()" class="btn btn-outline">
                        <span class="btn-icon">🖨️</span>
                        Print Order
                    </button>
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
