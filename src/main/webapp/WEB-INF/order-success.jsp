<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Placed</title>

<style>

    body {
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #eef5ff, #ffffff);
        font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    .container {
        width: 520px;
        margin: 70px auto;
        background: #ffffff;
        padding: 40px 45px;
        border-radius: 18px;
        box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        text-align: center;
        animation: fadeIn 0.8s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(25px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .success-icon {
        font-size: 90px;
        color: #22c55e;
        margin-bottom: 10px;
        animation: pop 0.6s ease-out;
    }

    @keyframes pop {
        0% { transform: scale(0.5); opacity: 0; }
        100% { transform: scale(1); opacity: 1; }
    }

    h2 {
        font-size: 30px;
        font-weight: 800;
        color: #222;
        margin: 5px 0 12px;
    }

    p {
        color: #555;
        font-size: 17px;
        margin-bottom: 15px;
    }

    .details-box {
        margin-top: 30px;
        text-align: left;
        background: #f3f9f4;
        padding: 22px 25px;
        border-radius: 14px;
        border-left: 6px solid #22c55e;
        box-shadow: inset 0 0 8px rgba(0,0,0,0.05);
    }

    .details-box p {
        margin: 10px 0;
        font-size: 17px;
        color: #333;
    }

    .details-box b {
        color: #111;
        font-weight: 600;
    }

    .btn {
        margin-top: 30px;
        background: #007bff;
        color: #ffffff;
        border: none;
        padding: 14px 20px;
        font-size: 18px;
        border-radius: 10px;
        cursor: pointer;
        width: 100%;
        transition: 0.25s;
        font-weight: 600;
        letter-spacing: 0.3px;
        box-shadow: 0 4px 15px rgba(0,123,255,0.3);
    }

    .btn:hover {
        background: #0056b3;
        transform: translateY(-2px);
    }

    .back-link {
        display: inline-block;
        margin-top: 18px;
        font-weight: 600;
        text-decoration: none;
        font-size: 16px;
        color: #007bff;
        transition: 0.3s;
    }

    .back-link:hover {
        color: #0053b0;
        text-decoration: underline;
    }

</style>


</head>
<body>

<div class="container">

    <div class="success-icon">✔</div>

    <h2>Order Placed Successfully!</h2>
    <p>Your order has been placed. Thank you for shopping with us!</p>

    <%
        com.entity.Product product = (com.entity.Product) request.getAttribute("product");
        com.entity.Order order = (com.entity.Order) request.getAttribute("order");
    %>

    <div class="details-box">
        <p><b>Product:</b> <%= (product != null) ? product.getName() : "N/A" %></p>
        <p><b>Quantity:</b> <%= (order != null) ? order.getQuantity() : "N/A" %></p>
        <p><b>Total Price:</b> <%= (order != null) ? order.getTotalPrice() : "N/A" %></p>
        <p><b>Status:</b> <%= (order != null) ? order.getStatus() : "N/A" %></p>
    </div>

    <form action="loginsuccess" method="post">
        <button type="submit" class="btn">Back to Dashboard</button>
    </form>

<a class="back-link" href="add-to-buy?productId=75">← Back to Product</a>

</div>

</body>
</html>
