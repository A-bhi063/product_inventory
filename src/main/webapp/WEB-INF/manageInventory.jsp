<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <%@ page import="com.entity.Category" %>
        <%@ page import="com.entity.Product" %>
            <%@ page import="java.util.List" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="ISO-8859-1">
                    <title>Manage Inventory | Admin</title>
                    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                        rel="stylesheet">
                    <link rel="stylesheet"
                        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
                    <style>
                        :root {
                            --primary: #4e73df;
                            --success: #1cc88a;
                            --info: #36b9cc;
                            --warning: #f6c23e;
                            --danger: #e74a3b;
                            --dark: #5a5c69;
                            --light: #f8f9fc;
                            --white: #ffffff;
                            --shadow: 0 0.15rem 1.75rem 0 rgba(58, 59, 69, 0.15);
                        }

                        body {
                            font-family: 'Poppins', sans-serif;
                            background-color: #f4f7f6;
                            margin: 0;
                            padding: 0;
                            color: #333;
                        }

                        /* NAVIGATION */
                        .navbar {
                            background: var(--white);
                            padding: 1rem 2rem;
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            box-shadow: var(--shadow);
                            position: sticky;
                            top: 0;
                            z-index: 1000;
                        }

                        .navbar-brand {
                            font-weight: 700;
                            color: var(--primary);
                            text-decoration: none;
                            font-size: 1.5rem;
                        }

                        .nav-links {
                            display: flex;
                            gap: 20px;
                        }

                        .nav-links a {
                            color: var(--dark);
                            text-decoration: none;
                            font-weight: 500;
                            padding: 8px 15px;
                            border-radius: 8px;
                            transition: all 0.3s;
                        }

                        .nav-links a:hover,
                        .nav-links a.active {
                            color: var(--primary);
                            background: rgba(78, 115, 223, 0.1);
                        }

                        /* CONTAINER */
                        .container {
                            max-width: 1200px;
                            margin: 2.5rem auto;
                            padding: 0 1.5rem;
                        }

                        .page-header {
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-bottom: 2rem;
                        }

                        .page-header h1 {
                            font-size: 1.8rem;
                            font-weight: 700;
                            color: var(--primary);
                            margin: 0;
                        }

                        /* ADD CATEGORY FORM */
                        .add-category-card {
                            background: var(--white);
                            border-radius: 12px;
                            padding: 1.5rem;
                            box-shadow: var(--shadow);
                            margin-bottom: 3rem;
                        }

                        .add-category-card h3 {
                            margin-top: 0;
                            font-size: 1.2rem;
                            margin-bottom: 1.2rem;
                            display: flex;
                            align-items: center;
                            gap: 10px;
                        }

                        .inline-form {
                            display: flex;
                            gap: 15px;
                        }

                        .inline-form input {
                            flex-grow: 1;
                            padding: 10px 15px;
                            border: 1px solid #d1d3e2;
                            border-radius: 8px;
                            font-size: 14px;
                        }

                        .btn {
                            padding: 10px 20px;
                            border-radius: 8px;
                            border: none;
                            font-weight: 600;
                            cursor: pointer;
                            transition: all 0.3s;
                            display: inline-flex;
                            align-items: center;
                            gap: 8px;
                            text-decoration: none;
                        }

                        .btn-primary {
                            background: var(--primary);
                            color: var(--white);
                        }

                        .btn-primary:hover {
                            background: #2e59d9;
                        }

                        /* INVENTORY LIST */
                        .inventory-list {
                            display: flex;
                            flex-direction: column;
                            gap: 2rem;
                        }

                        .category-group {
                            background: var(--white);
                            border-radius: 12px;
                            overflow: hidden;
                            box-shadow: var(--shadow);
                            border: 1px solid #e3e6f0;
                        }

                        .category-header {
                            background: #f8f9fc;
                            padding: 1.2rem 1.5rem;
                            border-bottom: 1px solid #e3e6f0;
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                        }

                        .category-name {
                            font-weight: 700;
                            font-size: 1.1rem;
                            color: #4e73df;
                            display: flex;
                            align-items: center;
                            gap: 10px;
                        }

                        .category-actions {
                            display: flex;
                            gap: 10px;
                        }

                        .badge {
                            background: var(--info);
                            color: white;
                            padding: 4px 10px;
                            border-radius: 20px;
                            font-size: 12px;
                            font-weight: 600;
                        }

                        /* PRODUCT TABLE */
                        .product-table-wrapper {
                            padding: 1.5rem;
                        }

                        table {
                            width: 100%;
                            border-collapse: collapse;
                            font-size: 14px;
                        }

                        th {
                            text-align: left;
                            padding: 12px 15px;
                            background: #f8f9fc;
                            color: var(--dark);
                            font-weight: 600;
                            border-bottom: 2px solid #e3e6f0;
                        }

                        td {
                            padding: 12px 15px;
                            border-bottom: 1px solid #e3e6f0;
                            vertical-align: middle;
                        }

                        .product-name {
                            font-weight: 500;
                            font-size: 15px;
                        }

                        .price-tag {
                            color: var(--success);
                            font-weight: 600;
                        }

                        .qty-badge {
                            font-weight: 600;
                            color: var(--dark);
                        }

                        .low-stock {
                            color: var(--danger);
                        }

                        .action-btns {
                            display: flex;
                            gap: 10px;
                        }

                        .btn-circle {
                            width: 30px;
                            height: 30px;
                            padding: 0;
                            display: inline-flex;
                            justify-content: center;
                            align-items: center;
                            border-radius: 50%;
                            font-size: 12px;
                        }

                        .btn-danger {
                            background: var(--danger);
                            color: white;
                        }

                        .btn-danger:hover {
                            background: #be2617;
                        }

                        /* ADD PRODUCT FORM IN CATEGORY */
                        .add-product-inline {
                            background: #fdfdfe;
                            padding: 1.5rem;
                            border-top: 1px dashed #e3e6f0;
                        }

                        .add-product-inline h4 {
                            margin-top: 0;
                            font-size: 1rem;
                            margin-bottom: 1rem;
                            color: var(--dark);
                        }

                        .product-grid-form {
                            display: grid;
                            grid-template-columns: 2fr 1fr 1fr 100px;
                            gap: 15px;
                        }

                        .product-grid-form input {
                            padding: 8px 12px;
                            border: 1px solid #d1d3e2;
                            border-radius: 6px;
                            font-size: 13px;
                        }

                        /* RESPONSIVE */
                        @media (max-width: 768px) {
                            .product-grid-form {
                                grid-template-columns: 1fr;
                            }

                            .inline-form {
                                flex-direction: column;
                            }
                        }
                    </style>
                </head>

                <body>

                    <nav class="navbar">
                        <a href="/admin-dashboard" class="navbar-brand">PANEL</a>
                        <div class="nav-links">
                            <a href="/admin-dashboard"><i class="fas fa-home"></i> Home</a>
                            <a href="/manage-inventory" class="active"><i class="fas fa-boxes"></i> Inventory</a>
                            <a href="/view-orders"><i class="fas fa-receipt"></i> Orders</a>
                            <a href="/manage-customers"><i class="fas fa-users"></i> Users</a>
                            <a href="/logout" style="color:var(--danger)"><i class="fas fa-sign-out-alt"></i></a>
                        </div>
                    </nav>

                    <div class="container">
                        <div class="page-header">
                            <h1><i class="fas fa-warehouse"></i> Inventory Management</h1>
                        </div>

                        <!-- Section: Add New Category -->
                        <div class="add-category-card">
                            <h3><i class="fas fa-folder-plus text-primary"></i> Quick Add Category</h3>
                            <form action="/save-category" method="post" class="inline-form">
                                <input type="text" name="name"
                                    placeholder="Enter Category Name (e.g. Electronics, Fashion...)" required />
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-plus"></i> Create Category
                                </button>
                            </form>
                        </div>

                        <!-- Section: Unified Categories and Products -->
                        <div class="inventory-list">
                            <% List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    if (categories != null && !categories.isEmpty()) {
                                    for (Category cat : categories) {
                                    List<Product> products = cat.getProduct();
                                        %>
                                        <div class="category-group">
                                            <div class="category-header">
                                                <div class="category-name">
                                                    <i class="fas fa-tag"></i>
                                                    <%= cat.getName() %>
                                                        <span class="badge">
                                                            <%= (products !=null) ? products.size() : 0 %> Products
                                                        </span>
                                                </div>
                                                <div class="category-actions">
                                                    <!-- Any category actions could go here -->
                                                </div>
                                            </div>

                                            <!-- Product Table -->
                                            <div class="product-table-wrapper">
                                                <% if (products !=null && !products.isEmpty()) { %>
                                                    <table>
                                                        <thead>
                                                            <tr>
                                                                <th>ID</th>
                                                                <th>Product Details</th>
                                                                <th>Price</th>
                                                                <th>Stock</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <% for (Product p : products) { %>
                                                                <tr>
                                                                    <td style="color:#858796">#<%= p.getId() %>
                                                                    </td>
                                                                    <td>
                                                                        <div class="product-name">
                                                                            <%= p.getName() %>
                                                                        </div>
                                                                    </td>
                                                                    <td class="price-tag">$<%= p.getPrice() %>
                                                                    </td>
                                                                    <td>
                                                                        <span
                                                                            class="qty-badge <%= (p.getQuantity() < 5) ? \"
                                                                            low-stock\" : \"\" %>">
                                                                            <%= p.getQuantity() %> units
                                                                                <% if (p.getQuantity() < 5) { %><i
                                                                                        class="fas fa-exclamation-triangle"
                                                                                        title="Low stock"></i>
                                                                                    <% } %>
                                                                        </span>
                                                                    </td>
                                                                    <td>
                                                                        <div class="action-btns">
                                                                            <a href="/deleteProduct/<%= p.getId() %>"
                                                                                class="btn btn-circle btn-danger"
                                                                                onclick="return confirm('Delete this product?')">
                                                                                <i class="fas fa-trash"></i>
                                                                            </a>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                                <% } %>
                                                        </tbody>
                                                    </table>
                                                    <% } else { %>
                                                        <div style="text-align:center; color:#858796; padding:1rem;">
                                                            No products in this category yet.
                                                        </div>
                                                        <% } %>
                                            </div>

                                            <!-- Inline form to add product to this category -->
                                            <div class="add-product-inline">
                                                <h4><i class="fas fa-plus-circle"></i> Add Product to <%= cat.getName()
                                                        %>
                                                </h4>
                                                <form action="/save-product" method="post" class="product-grid-form">
                                                    <input type="hidden" name="category_id"
                                                        value="<%= cat.getId() %>" />
                                                    <input type="text" name="name" placeholder="Product Name"
                                                        required />
                                                    <input type="number" name="price" placeholder="Price" step="0.01"
                                                        required />
                                                    <input type="number" name="quantity" placeholder="Quantity"
                                                        required />
                                                    <button type="submit" class="btn btn-primary" style="padding:8px">
                                                        <i class="fas fa-save"></i> Save
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                        <% } } else { %>
                                            <div class="category-group" style="padding:3rem; text-align:center;">
                                                <i class="fas fa-inbox fa-3x"
                                                    style="color:#d1d3e2; margin-bottom:1rem;"></i>
                                                <p style="color:#858796">No inventory data available. Start by creating
                                                    a category above.</p>
                                            </div>
                                            <% } %>
                        </div>
                    </div>

                </body>

                </html>