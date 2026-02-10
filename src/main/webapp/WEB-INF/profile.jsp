<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.SignUp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>My Profile</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f1f5f9;
        padding: 0;
        margin: 0;
    }

    .profile-container {
        width: 60%;
        margin: 40px auto;
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px #cfd2d6;
    }

    .profile-header {
        display: flex;
        align-items: center;
        gap: 20px;
        margin-bottom: 30px;
    }

    .profile-pic {
        width: 80px;
        height: 80px;
        background: #007bff;
        color: white;
        border-radius: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 30px;
        font-weight: bold;
    }

    h2 {
        margin-bottom: 10px;
        color: #333;
    }

    .info-box {
        margin-top: 20px;
    }

    .info-item {
        background: #f7f9fc;
        padding: 15px;
        margin-bottom: 12px;
        border-radius: 6px;
        font-size: 16px;
        border-left: 4px solid #007bff;
    }

    .label {
        font-weight: bold;
        color: #555;
    }

    .edit-btn {
        display: inline-block;
        margin-top: 20px;
        background: #007bff;
        color: white;
        padding: 10px 18px;
        text-decoration: none;
        border-radius: 5px;
        font-size: 15px;
    }

    .edit-btn:hover {
        background: #0056b3;
    }
</style>

</head>
<body>

<%
    SignUp user = (SignUp) request.getAttribute("user");
%>

<div class="profile-container">

    <!-- HEADER -->
    <div class="profile-header">
        <div class="profile-pic">
            <%= user.getUsername().substring(0, 1).toUpperCase() %>
        </div>
        <h2><%= user.getUsername() %></h2>
    </div>

    <!-- DETAILS SECTION -->
    <div class="info-box">

        <div class="info-item">
            <span class="label">Email:</span> <%= user.getGmail() %>
        </div>

        <div class="info-item">
            <span class="label">Phone:</span> <%= user.getContact() %>
        </div>

        <div class="info-item">
            <span class="label">Address:</span> <%= user.getAddress() %>
        </div>

    </div>

    <a href="edit-profile" class="edit-btn">Edit Profile</a>

</div>

</body>
</html>
