<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Cart" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        width: 80%;
        margin: 30px auto;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    h2 {
        text-align: center;
        margin-bottom: 20px;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #333;
        color: #fff;
        font-size: 16px;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }
    a.delete-btn {
        padding: 6px 12px;
        background: #e63946;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 14px;
    }
    a.delete-btn:hover {
        background: #b91c1c;
    }
</style>
</head>
<body>

<div class="container">
<h2>Your Cart</h2>

<table border="0">
<tr>
    <th>Product</th>
    <th>Price</th>
    <th>Quantity</th>
    <th>Delete</th>
</tr>

<%
List<Cart> cart = (List<Cart>) request.getAttribute("cartItems");
for(Cart c : cart){
%>

<tr>
    <td><%= c.getProduct().getName() %></td>
    <td><%= c.getProduct().getPrice() %></td>
    <td><%= c.getQuantity() %></td>
    <td><a class="delete-btn" href="delete-cart?id=<%= c.getId() %>">Delete</a></td>
</tr>

<% } %>

</table>

</div>
</body>
</html>