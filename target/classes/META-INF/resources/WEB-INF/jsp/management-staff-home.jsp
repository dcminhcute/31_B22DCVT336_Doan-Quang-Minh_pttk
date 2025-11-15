<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Management Staff Home - Garage Management</title>
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
                <li><a href="<c:url value='/statistics/home'/>" class="active">Home</a></li>
                <li><a href="<c:url value='/login/logout'/>">Logout</a></li>
            </ul>
        </nav>

        <!-- Main Content -->
        <div class="main-content">
            <div class="management-dashboard">
                <div class="dashboard-header">
                    <h2>Management Dashboard</h2>
                    <p>View statistics and manage operations</p>
                </div>

                <div class="statistics-menu">
                    <h3>Statistical Reports</h3>
                    <div class="menu-grid">
                        <!-- Services Statistics -->
                        <div class="menu-card">
                            <div class="menu-icon">🔧</div>
                            <h4>Services Statistics</h4>
                            <p>View service performance and trends</p>
                            <button class="btn btn-outline" disabled>Coming Soon</button>
                        </div>

                        <!-- Parts Statistics -->
                        <div class="menu-card">
                            <div class="menu-icon">📦</div>
                            <h4>Parts Statistics</h4>
                            <p>Analyze spare parts inventory</p>
                            <button class="btn btn-outline" disabled>Coming Soon</button>
                        </div>

                        <!-- Customer Statistics -->
                        <div class="menu-card">
                            <div class="menu-icon">👥</div>
                            <h4>Customer Statistics</h4>
                            <p>Customer analytics and reports</p>
                            <button class="btn btn-outline" disabled>Coming Soon</button>
                        </div>

                        <!-- Supplier Statistics - ACTIVE -->
                        <div class="menu-card active">
                            <div class="menu-icon">📊</div>
                            <h4>Supplier Statistics</h4>
                            <p>View supplier import statistics by quantity</p>
                            <a href="<c:url value='/statistics/suppliers'/>" class="btn btn-primary">
                                View Statistics
                            </a>
                        </div>
                    </div>
                </div>

                <div class="quick-info">
                    <h3>Quick Information</h3>
                    <div class="info-cards">
                        <div class="info-card-small">
                            <div class="card-number">0</div>
                            <div class="card-label">Total Suppliers</div>
                        </div>
                        <div class="info-card-small">
                            <div class="card-number">0</div>
                            <div class="card-label">Total Orders</div>
                        </div>
                        <div class="info-card-small">
                            <div class="card-number">0</div>
                            <div class="card-label">Total Parts</div>
                        </div>
                        <div class="info-card-small">
                            <div class="card-number">0</div>
                            <div class="card-label">Pending Orders</div>
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
