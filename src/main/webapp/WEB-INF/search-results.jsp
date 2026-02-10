<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Search Results for "<%= request.getAttribute("keyword") %>"</h2>

<c:forEach var="p" items="${products}">
    <div>
        <h3>${p.name}</h3>
        <p>${p.description}</p>
        <p>Price: ${p.price}</p>
<a href="product-details?id=${p.id}">View</a>
    </div>
</c:forEach>

<c:if test="${empty products}">
    <p>No products found.</p>
</c:if>

</body>
</html>