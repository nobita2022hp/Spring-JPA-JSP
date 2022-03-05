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
    <title>Category list</title>
</head>
<body>
    <h1>Category list</h1>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${categories}">
                <tr>
                    <td>${item.categoryId}</td>
                    <td>${item.categoryName}</td>
                    <td>${item.description}</td>
                    <td><a href="/product/getProductByCategoryId/${item.categoryId}">View</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br />
    <a href="/product/insert">Insert product</a>
</body>
</html>