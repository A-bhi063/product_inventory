<%@ page import="java.util.List" %>
<%@ page import="com.entity.Order" %>

<h2>Customer Purchased Products</h2>

<table border="1" cellpadding="10" cellspacing="0">
    <tr>
        <th>Order ID</th>
        <th>Product Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Amount</th>
        
    </tr>

    <%
        List<Order> list = (List<Order>) request.getAttribute("orders");

        if (list != null && !list.isEmpty()) {
            for (Order o : list) {
    %>
    <tr>
        <td><%= o.getId() %></td>
        <td><%= o.getProduct().getName() %></td>
        <td><%= o.getProduct().getPrice() %></td>
        <td><%= o.getQuantity() %></td>
        <td><%= o.getTotalPrice() %></td>
        
    </tr>

    <% 
            }
        } else {
    %>

    <tr>
        <td colspan="6" style="text-align:center;">No orders found for this customer</td>
    </tr>

    <% } %>

</table>
