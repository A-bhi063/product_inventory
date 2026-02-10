<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buy Product</title>

<style>
    body {
        margin: 0;
        padding: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #eef1f6;
    }

    .container {
        width: 450px;
        margin: 60px auto;
        background: #fff;
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 18px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    .product-box {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
        padding-bottom: 15px;
        border-bottom: 1px solid #ddd;
    }

    .product-box span {
        font-size: 18px;
        font-weight: 600;
        color: #222;
    }

    label {
        font-size: 15px;
        font-weight: 600;
        color: #555;
    }

    input[type="number"], input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-top: 6px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 15px;
    }

    button {
        width: 100%;
        margin-top: 25px;
        background: #007bff;
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        border-radius: 8px;
        cursor: pointer;
        transition: 0.3s;
    }

    button:hover {
        background: #0056d3;
    }

    .error {
        background: #ffe5e5;
        color: #d10000;
        padding: 10px;
        text-align: center;
        border-radius: 8px;
        margin-bottom: 15px;
        font-weight: bold;
    }
    .back-link {
    display: inline-block;
    margin-top: 20px;
    padding: 12px 18px;
    background: #f0f4ff;
    color: #007bff;
    font-size: 16px;
    font-weight: 600;
    border-radius: 10px;
    text-decoration: none;
    transition: 0.3s ease;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
}

.back-link:hover {
    background: #dce8ff;
    color: #0056b3;
    transform: translateY(-2px);
}
    
</style>

</head>
<body>

<div class="container">

    <h2>Buy Product</h2>

    <!-- ERROR MESSAGE -->
    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <!-- PRODUCT DETAILS -->
    <div class="product-box">
        <div>
            <span>${product.name}</span><br>
            <small>Category: ${product.category.name}</small>
        </div>

        <div style="text-align:right;">
            <span>₹${product.price}</span><br>
            <small>Available: ${product.quantity}</small>
        </div>
    </div>

    <!-- ORDER FORM -->
    <form action="${pageContext.request.contextPath}/place-order" method="post">

        <input type="hidden" name="productId" value="${product.id}">

        <label>Quantity:</label>
        <input type="number" name="quantity" value="1" min="1" required>

        <label>Shipping Address:</label>
        <input type="text" name="address" placeholder="Enter full address" required>

        <button type="submit">Place Order</button>
        <a class="back-link"  href="products-by-category?category_id=69">back to products</a>
        
        
    </form>

</div>

</body>
</html>
