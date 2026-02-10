<%@ page import="java.util.List" %>
<%@ page import="com.entity.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Our Products</title>

<style>
    /* Body & Typography */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6f8;
        margin: 0;
        padding: 40px 20px;
        color: #333;
    }

    h2 {
        text-align: center;
        font-size: 32px;
        font-weight: 700;
        margin-bottom: 50px;
        color: #222;
    }

    /* Product Grid */
    .product-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }

    /* Product Card */
    .product-card {
        background: linear-gradient(135deg, #ffffff, #e9f0ff);
        border-left: 6px solid #007bff;
        border-radius: 12px;
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        padding: 20px;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    .product-card:hover {
        transform: translateY(-6px);
        box-shadow: 0 12px 25px rgba(0,0,0,0.2);
    }

    /* Product Details */
    .name {
        font-size: 20px;
        font-weight: 600;
        margin-bottom: 10px;
        color: #007bff;
        min-height: 50px;
    }

    .price {
        font-size: 18px;
        font-weight: bold;
        color: #28a745;
        margin-bottom: 8px;
    }

    .quantity {
        font-size: 14px;
        font-weight: 500;
        color: #555;
        margin-bottom: 15px;
    }

    /* Badges */
    .badge {
        display: inline-block;
        padding: 4px 10px;
        font-size: 12px;
        font-weight: bold;
        border-radius: 12px;
        margin-bottom: 10px;
        background-color: #ffc107;
        color: #fff;
    }

    /* Buttons */
    .btn {
        display: inline-block;
        padding: 10px 18px;
        margin: 5px 2px;
        font-size: 14px;
        font-weight: 500;
        border-radius: 8px;
        text-decoration: none;
        transition: all 0.3s;
    }

    .btn-cart {
        background-color: #17a2b8;
        color: #fff;
    }
    .btn-cart:hover {
        background-color: #117a8b;
        transform: translateY(-2px);
    }

    .btn-buy {
        background-color: #007bff;
        color: #fff;
    }
    .btn-buy:hover {
        background-color: #0056b3;
        transform: translateY(-2px);
    }

    /* Responsive text alignment */
    .product-info {
        display: flex;
        flex-direction: column;
        justify-content: space-between;
        flex: 1;
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
        <a class="back-link"  href="view-category">back to categories</a>

<body>

<h2>Our Products</h2>

<div class="product-grid">
<%
    List<Product> list = (List<Product>) request.getAttribute("products");
    if(list != null && !list.isEmpty()){
        for(Product p : list){
%>
    <div class="product-card">
        <div class="product-info">
            <span class="badge">New</span>
            <div class="name"><%= p.getName() %></div>
            <div class="price">₹<%= p.getPrice() %></div>
            <div class="quantity">Available: <%= p.getQuantity() %></div>
        </div>
        <div>
            <a href="add-to-cart?productId=<%= p.getId() %>" class="btn btn-cart">Add to Cart</a>
            <a href="add-to-buy?productId=<%= p.getId() %>" class="btn btn-buy">Buy Now</a>
        </div>
    </div>
<%
        }
    } else {
%>
    <p style="text-align:center; color:#777; font-size:16px;">No products available at the moment.</p>
<%
    }
%>


</div>

</body>
</html>
