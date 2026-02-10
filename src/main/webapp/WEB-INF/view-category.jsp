<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.Category" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Categories</title>

<style>
    body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: #eef2f7;
        margin: 0;
        padding: 25px;
    }

    h2 {
        text-align: center;
        font-size: 28px;
        margin-bottom: 30px;
        color: #222;
    }

    .container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
        gap: 22px;
        padding: 0 20px;
    }

    .category-card {
        background: linear-gradient(135deg, #6c5ce7, #a29bfe);
        color: white;
        border-radius: 12px;
        box-shadow: 0px 4px 15px rgba(0,0,0,0.1);
        overflow: hidden;
        transition: 0.3s ease;
        cursor: pointer;
        text-align: center;
        padding: 40px 20px;
        position: relative;
    }

    .category-card:hover {
        transform: translateY(-6px);
        box-shadow: 0px 8px 20px rgba(0,0,0,0.2);
    }

    .category-icon {
        font-size: 50px;
        margin-bottom: 15px;
        display: block;
    }

    .category-name {
        font-size: 20px;
        font-weight: bold;
        margin-bottom: 20px;
    }

    .view-btn {
        display: inline-block;
        background: rgba(255, 255, 255, 0.2);
        padding: 10px 18px;
        border-radius: 8px;
        text-decoration: none;
        color: white;
        font-size: 15px;
        transition: 0.3s;
    }

    .view-btn:hover {
        background: rgba(255, 255, 255, 0.4);
    }
</style>

</head>
<body>






<h2>All Categories</h2>

<div class="container">

<%
    List<Category> list = (List<Category>) request.getAttribute("viewCategory");

    // optional icons for categories
    String[] icons = { "&#128187;", "&#128230;", "&#128176;", "&#128214;", "&#127918;" };
    int i = 0;

    for (Category c : list) {
        String icon = icons[i % icons.length];
        i++;
%>

    <div class="category-card">

        <!-- Icon -->
        <span class="category-icon"><%= icon %></span>

        <!-- Category Name -->
        <div class="category-name"><%= c.getName() %></div>

        <!-- View Products Button -->
        <a class="view-btn" href="products-by-category?category_id=<%= c.getId() %>">
            View Products
        </a>
    </div>

<%
    }
%>

</div>

</body>
</html>
