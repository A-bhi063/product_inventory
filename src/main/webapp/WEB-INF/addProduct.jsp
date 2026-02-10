<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f4f8; /* Light soft blue background */
        padding: 40px;
    }

    h2 {
        color: #4a5568; /* Soft dark grey */
        text-align: center;
        margin-bottom: 25px;
    }

    form {
        background-color: #ffffff; /* White card */
        padding: 30px;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
        max-width: 500px;
        margin: 0 auto;
    }

    label {
        display: block;
        margin-bottom: 6px;
        font-weight: 500;
        color: #4a5568;
    }

    input[type="text"],
    input[type="number"] {
        width: 100%;
        padding: 10px 12px;
        margin-bottom: 20px;
        border: 1px solid #cbd5e1; /* Light border */
        border-radius: 8px;
        font-size: 14px;
        background-color: #f9fafb; /* Very light input background */
    }

    input[type="text"]:focus,
    input[type="number"]:focus {
        border-color: #63b3ed; /* Soft blue on focus */
        outline: none;
        background-color: #ffffff;
    }

    button {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        color: white;
        background: linear-gradient(90deg, #6ee7b7, #3b82f6); /* Light green-blue gradient */
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-weight: 600;
        transition: background 0.3s ease;
    }

    button:hover {
        background: linear-gradient(90deg, #3b82f6, #6ee7b7);
    }
</style>
</head>
<body>

<h2>Add New Product</h2>

<form action="save-product" method="post">
    <!-- hidden field to send categoryId -->
    <input type="hidden" name="category_id" value="<%= request.getParameter("category_id") %>" />

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" placeholder="Enter product name" required />

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" placeholder="Enter product price" required />

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" placeholder="Enter quantity" required />

    <button type="submit">Save Product</button>
</form>

</body>
</html>
