<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.Order"%>
<%@ page import="com.entity.Product"%>

<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<h2>My Orders</h2>

<table border="1" cellpadding="5">
    <tr>
        <th>Order ID</th>
        <th>Product Name</th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Status</th>
    </tr>
<%
    if (orders != null && !orders.isEmpty()) {
        for(Order o : orders) {
            Product p = o.getProduct();
%>
    <tr>
        <td><%= o.getId() %></td>
        <td><%= p != null ? p.getName() : "N/A" %></td>
        <td><%= o.getQuantity() %></td>
        <td><%= o.getTotalPrice() %></td>
        <td><%= o.getStatus() %></td>
    </tr>
<%
        }
    } else {
%>
    <tr>
        <td colspan="5">No orders found!</td>
    </tr>
<%
    }
%>
</table>
