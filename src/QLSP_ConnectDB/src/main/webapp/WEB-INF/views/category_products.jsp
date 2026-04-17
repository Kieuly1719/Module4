<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sản phẩm theo category</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2>Category: ${category.name}</h2>

  <div class="mb-3">
    <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Quay lại category</a>
    <a href="${pageContext.request.contextPath}/products" class="btn btn-primary">Quản lý sản phẩm</a>
  </div>

  <table class="table table-bordered table-hover align-middle">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Tên sản phẩm</th>
      <th>Giá</th>
      <th>Số lượng</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty products}">
        <c:forEach var="p" items="${products}">
          <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>
              <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/>
            </td>
            <td>${p.quantity}</td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="4" class="text-center">Category này chưa có sản phẩm</td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>