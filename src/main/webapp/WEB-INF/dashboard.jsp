<%@ page import="com.entity.SignUp" %>
<html>
<head>
    <title>Customer Dashboard</title>

    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            margin: 0;
            background: #eef2f7;
        }

        /* Top Navbar */
        .navbar {
            background: linear-gradient(90deg, #4a90e2, #007bff);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.15);
        }

        .navbar .links a {
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
            padding: 8px 12px;
            border-radius: 6px;
            transition: 0.3s;
        }

        .navbar .links a:hover {
            background: rgba(255,255,255,0.25);
        }

        .container {
            width: 90%;
            margin: 20px auto;
            padding: 10px;
        }

        /* Hero Banner */
        .hero {
            width: 100%;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.15);
            margin-bottom: 25px;
        }

        .hero img {
            width: 100%;
            height: 360px;
            object-fit: cover;
        }

        /* Card Section */
        .card-section {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .card {
            background: white;
            width: 32%;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-body {
            padding: 15px;
        }

        .card-body h3 {
            margin: 0;
            color: #333;
        }

        .card-body p {
            color: #555;
        }

        .btn-primary {
            display: inline-block;
            padding: 10px 18px;
            background: #007bff;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-primary:hover {
            background: #0056d2;
        }
    </style>
</head>

<body>

<%
    SignUp user = (SignUp) session.getAttribute("loggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- NAVBAR -->
<div class="navbar">
<form action="search" method="get">
    <input type="text" name="keyword" placeholder="Search products..." required>
    <button type="submit">Search</button>
</form>

    <div>
        <b style="font-size:18px;">Welcome, <%= user.getUsername() %></b>
    </div>

    <div class="links">
        <a href="dashboard">Dashboard</a>
        <a href="view-category">Category</a>
        <a href="my-orders">My Orders</a>
        <a href="view-cart">Cart</a>
        <a href="add-address">Address</a>
        <a href="profile">Profile</a>
        <a href="logout" style="background:#ff4d4d;">Logout</a>
    </div>
</div>

<!-- MAIN CONTENT -->
<div class="container">

    <!-- HERO BANNER -->
    <div class="hero">
        <img src="https://images.pexels.com/photos/5632402/pexels-photo-5632402.jpeg" alt="Ecommerce Banner">
    </div>

    <!-- CATEGORY CARDS -->
    <div class="card-section">

        <div class="card">
            <img src="https://images.pexels.com/photos/5632396/pexels-photo-5632396.jpeg">
            <div class="card-body">
                <h3>Electronics</h3>
                <p>Latest gadgets and devices.</p>
                <a href="view-category" class="btn-primary">Shop Now</a>
            </div>
        </div>

        <div class="card">
            <img src="https://images.pexels.com/photos/298863/pexels-photo-298863.jpeg">
            <div class="card-body">
                <h3>Fashion</h3>
                <p>Trendy clothes & accessories.</p>
                <a href="view-category" class="btn-primary">Explore</a>
            </div>
        </div>

        <div class="card">
            <img src="https://images.pexels.com/photos/776636/pexels-photo-776636.jpeg">
            <div class="card-body">
                <h3>Home & Living</h3>
                <p>Beautiful home essentials.</p>
                <a href="view-category" class="btn-primary">View Items</a>
            </div>
        </div>

    </div>

</div>

</body>
</html>
