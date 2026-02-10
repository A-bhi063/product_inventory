<%@ page import="java.util.List" %>
    <%@ page import="com.entity.Product" %>
        <%@ page import="com.entity.Category" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="ISO-8859-1">
                <title>All Products</title>
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
                        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
                    }

                    th,
                    td {
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

                    .search-form {
                        margin-bottom: 20px;
                        text-align: center;
                    }

                    .search-form input {
                        padding: 8px;
                        width: 250px;
                    }

                    .search-form button {
                        padding: 8px 15px;
                    }
                </style>
            </head>

            <body>

                <a href="<%= request.getContextPath() %>/manage-inventory">
                    Back to Inventory
                </a>


                <h2>All Products</h2>



                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Category</th>
                        <th>Actions</th>
                    </tr>

                    <% List<Product> list = (List<Product>) request.getAttribute("products");
                            if(list != null && !list.isEmpty()){
                            for(Product p : list){
                            %>
                            <tr>
                                <td>
                                    <%= p.getId() %>
                                </td>
                                <td>
                                    <%= p.getName() %>
                                </td>
                                <td>
                                    <%= p.getPrice() %>
                                </td>
                                <td>
                                    <%= p.getCategory().getName() %>
                                </td>
                                <td class="action-links">
                                    <a href="edit-product?product_id=<%= p.getId() %>">Edit</a>
                                    <a href="<%= request.getContextPath() %>/deleteProduct/<%= p.getId() %>">
                                        Delete
                                    </a>
                                <td>


                                </td>

                                </td>
                            </tr>
                            <% } } else { %>
                                <tr>
                                    <td colspan="5" style="text-align:center;">No products found</td>
                                </tr>
                                <% } %>
                </table>

            </body>

            </html>