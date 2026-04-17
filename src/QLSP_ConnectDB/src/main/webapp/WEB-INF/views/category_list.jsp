<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Danh sách category</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h2>Danh sách category</h2>
    <div>
      <a class="btn btn-secondary" href="${pageContext.request.contextPath}/products">Quản lý sản phẩm</a>
      <a class="btn btn-primary" href="${pageContext.request.contextPath}/categories?action=create">+ Thêm category</a>
    </div>
  </div>

  <table class="table table-bordered table-hover align-middle">
    <thead class="table-dark">
    <tr>
      <th>ID</th>
      <th>Tên category</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
      <c:when test="${not empty categories}">
        <c:forEach var="c" items="${categories}">
          <tr>
            <td>${c.id}</td>
            <td>${c.name}</td>
            <td>
              <a class="btn btn-info btn-sm"
                 href="${pageContext.request.contextPath}/categories?action=viewProducts&id=${c.id}">
                Xem sản phẩm
              </a>
            </td>
          </tr>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <tr>
          <td colspan="3" class="text-center">Không có dữ liệu</td>
        </tr>
      </c:otherwise>
    </c:choose>
    </tbody>
  </table>
</div>
</body>
</html>