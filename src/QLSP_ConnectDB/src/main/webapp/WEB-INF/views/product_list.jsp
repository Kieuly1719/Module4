<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách sản phẩm</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách sản phẩm</h2>
    <div>
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/categories">Quản lts category</a>
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/products?action=create">+ Thêm sản phẩm</a>
    </div>
  </div>
  <form action = "${pageContext.request.contextPath}/products" method="get" class="row g-2 mb-4">
    <div class="col-md-5">
      <input type="text" name="keyword" class="form-control" placeholder="Nhập tên sản phẩm..." value="${keyword}">
    </div>
    <div class="col-md-4">
      <select name="categoryId" class="form-select">
        <option value="">-- Tất cả category --</option>
        <c:forEach var="c" items="${categories}">
          <option value="${c.id}"
                  <c:if test="${selectedCategoryId != null && selectedCategoryId == c.id}">selected</c:if>>
              ${c.name}
          </option>
        </c:forEach>
      </select>
    </div>
    <div class="col-md-3 d-flex gap-2">
      <button type="submit" class="btn btn-success">Tìm kiếm</button>
      <a href="${pageContext.request.contextPath}/products" class="btn btn-outline-secondary">Reset</a>
    </div>
  </form>

  <table class="table table-bordered table-hover align-middle">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Tên sản phẩm</th>
      <th>Giá</th>
      <th>Số lượng</th>
      <th width="180">Thao tác</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty product}">
        <c:forEach var="p" items="${products}">
          <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>
              <fmt:formatNumber value="${p.price}" type="number" groupingUsed="true"/>
            </td>
            <td>${p.quantity}</td>
            <td>
              <a class="btn btn-warning btn-sm"
                 href="${pageContext.request.contextPath}/products?action=edit&id=${p.id}">
                Sửa
              </a>
              <a class="btn btn-danger btn-sm"
                 href="${pageContext.request.contextPath}/products?action=delete&id=${p.id}"
                 onclick="return confirm('Bạn có chắc muốn xóa sản phẩm này?');">
                Xóa
              </a>
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="6" class="text-center">Không có dữ liệu</td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>
