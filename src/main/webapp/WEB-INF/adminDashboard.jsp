<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Admin Dashboard | Product Order Management</title>
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

        <style>
            :root {
                --primary-color: #4e73df;
                --secondary-color: #858796;
                --success-color: #1cc88a;
                --info-color: #36b9cc;
                --warning-color: #f6c23e;
                --danger-color: #e74a3b;
                --dark-color: #5a5c69;
                --light-bg: #f8f9fc;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: var(--light-bg);
                margin: 0;
                padding: 0;
                color: #333;
            }

            /* NAVBAR */
            .navbar {
                background: #fff;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
                position: sticky;
                top: 0;
                z-index: 1000;
            }

            .navbar-brand {
                font-weight: 700;
                color: var(--primary-color);
                text-decoration: none;
                font-size: 1.5rem;
            }

            .nav-links {
                display: flex;
                gap: 20px;
            }

            .nav-links a {
                color: var(--dark-color);
                text-decoration: none;
                font-weight: 500;
                transition: all 0.3s;
                padding: 5px 10px;
                border-radius: 5px;
            }

            .nav-links a:hover,
            .nav-links a.active {
                color: var(--primary-color);
                background: rgba(78, 115, 223, 0.1);
            }

            .logout-btn {
                background: var(--danger-color);
                color: white !important;
            }

            .logout-btn:hover {
                background: #be2617 !important;
            }

            /* CONTENT */
            .container {
                max-width: 1200px;
                margin: 2rem auto;
                padding: 0 1rem;
            }

            .header {
                margin-bottom: 2rem;
            }

            .header h1 {
                font-weight: 700;
                color: #4e73df;
                margin: 0;
            }

            /* DASHBOARD CARDS */
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
                gap: 1.5rem;
                margin-bottom: 3rem;
            }

            .card {
                background: white;
                border-radius: 0.75rem;
                padding: 1.5rem;
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
                border-left: 0.25rem solid transparent;
                display: flex;
                justify-content: space-between;
                align-items: center;
                transition: transform 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
            }

            .card-products {
                border-left-color: var(--primary-color);
            }

            .card-categories {
                border-left-color: var(--success-color);
            }

            .card-orders {
                border-left-color: var(--info-color);
            }

            .card-customers {
                border-left-color: var(--warning-color);
            }

            .card-info h6 {
                color: var(--primary-color);
                font-size: 0.75rem;
                font-weight: 700;
                text-transform: uppercase;
                margin: 0 0 0.5rem 0;
            }

            .card-products .card-info h6 {
                color: var(--primary-color);
            }

            .card-categories .card-info h6 {
                color: var(--success-color);
            }

            .card-orders .card-info h6 {
                color: var(--info-color);
            }

            .card-customers .card-info h6 {
                color: var(--warning-color);
            }

            .card-info .count {
                font-size: 1.5rem;
                font-weight: 700;
                color: #5a5c69;
                margin: 0;
            }

            .card-icon {
                font-size: 2rem;
                color: #dddfeb;
            }

            /* QUICK ACTIONS */
            .quick-actions {
                background: white;
                border-radius: 0.75rem;
                padding: 2rem;
                box-shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.1);
            }

            .quick-actions h3 {
                margin-top: 0;
                font-weight: 600;
                border-bottom: 1px solid #e3e6f0;
                padding-bottom: 1rem;
                margin-bottom: 1.5rem;
            }

            .action-btns {
                display: flex;
                flex-wrap: wrap;
                gap: 1rem;
            }

            .btn {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 0.75rem 1.25rem;
                border-radius: 0.5rem;
                text-decoration: none;
                font-weight: 600;
                transition: all 0.3s;
                color: white;
            }

            .btn-primary {
                background: var(--primary-color);
            }

            .btn-success {
                background: var(--success-color);
            }

            .btn-info {
                background: var(--info-color);
            }

            .btn-warning {
                background: var(--warning-color);
            }

            .btn:hover {
                opacity: 0.9;
                transform: scale(1.02);
            }
        </style>
    </head>

    <body>

        <!-- NAVIGATION BAR -->
        <nav class="navbar">
            <a href="admin-dashboard" class="navbar-brand">
                <i class="fas fa-shopping-cart"></i> Admin Panel
            </a>
            <div class="nav-links">
                <a href="/admin-dashboard" class="active"><i class="fas fa-home"></i> Home</a>
                <a href="/manage-inventory"><i class="fas fa-warehouse"></i> Inventory</a>
                <a href="/view-orders"><i class="fas fa-shopping-bag"></i> Orders</a>
                <a href="/manage-customers"><i class="fas fa-users"></i> Customers</a>
                <a href="/logout" class="logout-btn"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </div>
        </nav>

        <!-- CONTENT AREA -->
        <div class="container">
            <div class="header">
                <h1>Dashboard Overview</h1>
            </div>

            <!-- STATS GRID -->
            <div class="dashboard-grid">
                <div class="card card-products">
                    <div class="card-info">
                        <h6>Total Products</h6>
                        <p class="count">${totalProducts}</p>
                    </div>
                    <div class="card-icon">
                        <i class="fas fa-boxes"></i>
                    </div>
                </div>

                <div class="card card-categories">
                    <div class="card-info">
                        <h6>Total Categories</h6>
                        <p class="count">${totalCategories}</p>
                    </div>
                    <div class="card-icon">
                        <i class="fas fa-folder"></i>
                    </div>
                </div>

                <div class="card card-orders">
                    <div class="card-info">
                        <h6>Total Orders</h6>
                        <p class="count">${totalOrders}</p>
                    </div>
                    <div class="card-icon">
                        <i class="fas fa-receipt"></i>
                    </div>
                </div>

                <div class="card card-customers">
                    <div class="card-info">
                        <h6>Total Customers</h6>
                        <p class="count">${totalCustomers}</p>
                    </div>
                    <div class="card-icon">
                        <i class="fas fa-user-friends"></i>
                    </div>
                </div>
            </div>

            <!-- QUICK ACTIONS SECTION -->
            <div class="quick-actions">
                <h3><i class="fas fa-bolt"></i> Quick Management</h3>
                <div class="action-btns">
                    <a href="/manage-inventory" class="btn btn-primary">
                        <i class="fas fa-warehouse"></i> Manage Inventory
                    </a>
                    <a href="/view-orders" class="btn btn-info">
                        <i class="fas fa-list-check"></i> Process Orders
                    </a>
                    <a href="/manage-customers" class="btn btn-warning">
                        <i class="fas fa-user-gear"></i> Manage Users
                    </a>
                </div>
            </div>
        </div>

    </body>

    </html>