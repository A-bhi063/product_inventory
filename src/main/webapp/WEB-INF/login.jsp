<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f5f5;
        padding: 30px;
    }
    .login-container {
        background: white;
        padding: 25px;
        width: 350px;
        margin: auto;
        border-radius: 10px;
        box-shadow: 0 0 12px rgba(0,0,0,0.2);
        text-align: center;
    }
    input {
        width: 90%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 15px;
    }
    .btn {
        width: 95%;
        padding: 10px;
        margin-top: 15px;
        background: #007bff;
        border: none;
        color: white;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
    }
    .error {
        color: red;
        margin-top: 10px;
    }
    .register-link {
        margin-top: 15px;
        display: block;
        text-decoration: none;
        color: #28a745;
        font-size: 14px;
    }
</style>

</head>
<body>

<div class="login-container">
    <h2>Login</h2>

    <form action="loginsuccess" method="post">

        <input type="text" name="gmail" placeholder="Enter Email" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit" class="btn">Login</button>

        <% 
            String message = (String) request.getAttribute("msg");
            if (message != null) {
        %>
            <p class="error"><%= message %></p>
        <%
            }
        %>
    </form>

    <!-- Direct link to registration page -->
    
<%
String path=(String)request.getContextPath();
%>
<a href="<%= path %>/">Don't have an account? Sign Up</a>

</div>

</body>
</html>
