<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product list by category</title>
</head>
<body>
    <h1>Category list</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>categoryId</th>
                <th>productName</th>
                <th>price</th>
                <th>description</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${products}">
                <tr>
                    <td>${item.productId}</td>
                    <td>${item.categoryId}</td>
                    <td>${item.productName}</td>
                    <td>${item.price}</td>
                    <td>${item.description}</td>
                    <td><a href="/product/changeCategory/${item.productId}">Change category</a></td>
                    <td><a href="/product/delete/${item.productId}">Delete product</a></td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
    <a href="${pageContext.request.contextPath}/category">Back</a>
</body>
</html>