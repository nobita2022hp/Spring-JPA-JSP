<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Change Category</title>
    <style>
        .red{
            color: red;
        }
    </style>
</head>
<body>
    <h1>Insert product</h1>
    <c:if test="${!empty error}">
        <p>${error}</p>
    </c:if>

    <sform:form method="post" action="/product/insert" modelAttribute="product">
        <sform:input path="productId" type="text" placeholder="Enter Id" />
        <sform:errors path="productId" cssClass="red" />
        <br />
        <sform:input path="productName" type="text" placeholder="Enter name" />
        <sform:errors path="productName" cssClass="red" />
        <br />
        <sform:input path="price" type="number"  placeholder="Enter price" />
        <br />
        <sform:textarea rows="3" path="description"
                        type="text"  placeholder="Enter description" />
        <br />
        <sform:select path="categoryId">
            <c:forEach items="${categories}" var="item">
                <option value="${item.categoryId}">${item.categoryName}</option>
            </c:forEach>
        </sform:select>
        <br />
        <input type="submit" value="Save" />
    </sform:form>
</body>
</html>