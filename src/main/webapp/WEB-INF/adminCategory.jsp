<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.Category" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Category Management</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        form {
            margin-bottom: 30px;
        }

        input[type="text"] {
            padding: 8px 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 200px;
        }

        button {
            padding: 8px 15px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        a {
            text-decoration: none;
            color: #007bff;
            font-weight: 500;
        }

        a:hover {
            text-decoration: underline;
        }

        .action-links a {
            margin-right: 15px;
        }
    </style>
</head>
<body>

<a href="<%= request.getContextPath() %>/loginsuccess">
    Back to Dashboard
</a>


<h2>Add New Category</h2>
<form action="save-category" method="post">
    <input type="text" name="name" placeholder="Category Name" required />
    <button type="submit">Save</button>
</form>

<h2>All Categories</h2>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th colspan="2">Actions</th>
    </tr>

<%
    List<Category> categories = (List<Category>) request.getAttribute("categoryList");

    if (categories != null && !categories.isEmpty()) {
        for (Category c : categories) {
%>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getName() %></td>
        <td class="action-links">
            <a href="add-product?category_id=<%= c.getId() %>">Add Product</a>
            <a href="showProduct/<%= c.getId() %>">Show Products</a>
        </td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="4" style="text-align:center;">No categories found</td>
    </tr>
<%
    }
%>
</table>

</body>
</html>
