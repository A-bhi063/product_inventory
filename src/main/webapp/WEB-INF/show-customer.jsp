<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.SignUp" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>All Customers</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f0f4f8;
        padding: 40px;
    }

    h2 {
        text-align: center;
        color: #2d3748;
        margin-bottom: 30px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background-color: #ffffff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
    }

    th {
        background-color: #38b2ac;
        color: white;
    }

    tr:nth-child(even) {
        background-color: #e6fffa;
    }

    tr:hover {
        background-color: #c6f6d5;
    }

    a {
        text-decoration: none;
        color: #3182ce;
        font-weight: 500;
    }

    a:hover {
        text-decoration: underline;
        color: #2b6cb0;
    }

    .action-links a {
        margin-right: 15px;
    }
</style>
</head>
<body>

<h2>All Customers</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Gmail</th>
        <th>Gender</th>
        <th>Contact</th>
        <th>Address</th>
        <th>Actions</th>
    </tr>

<%
List<SignUp> signUpList = (List<SignUp>) request.getAttribute("lists");

if(signUpList != null && !signUpList.isEmpty()){
    for(SignUp c : signUpList){
%>
    <tr>
        <td><%= c.getId() %></td>
        <td><%= c.getUsername() %></td>
        <td><%= c.getGmail() %></td>
        <td><%= c.getGender() %></td>
        <td><%= c.getContact() %></td>
        <td><%= c.getAddress() %></td>
        <td class="action-links">
            <a href="order-customer?userId=<%= c.getId() %>">Ordered Product</a>
            <a href="delete-customer?customer_id=<%= c.getId() %>">Delete</a>
        </td>
    </tr>
<%
    }
} else {
%>
    <tr>
        <td colspan="6" style="text-align:center;">No customers found</td>
    </tr>
<%
}
%>
</table>

</body>
</html>
