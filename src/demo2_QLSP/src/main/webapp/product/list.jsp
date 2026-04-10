<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Quản lý Sản phẩm</h2>
<div class="d-flex justify-content-between mb-3">
    <a href="${pageContext.request.contextPath}/products?action=create" class="btn btn-success">Thêm sản phẩm mới</a>

    <form action="/products" method="get" class="d-flex">
        <input type="hidden" name="action" value="search">
        <input type="text" name="searchName" class="form-control me-2" placeholder="Nhập tên sản phẩm...">
        <button type="submit" class="btn btn-outline-primary">Tìm</button>
    </form>
</div>

<table class="table table-bordered table-striped">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Nhà sản xuất</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td><a href="${pageContext.request.contextPath}/products?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.producer}</td>
            <td>
                <a href="${pageContext.request.contextPath}/products?action=edit&id=${product.id}" class="btn btn-sm btn-warning">Sửa</a>
                <a href="${pageContext.request.contextPath}/products?action=delete&id=${product.id}" class="btn btn-sm btn-danger">Xoá</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>