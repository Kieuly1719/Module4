<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${formAction == 'edit' ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm'}</title>
  <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2>${formAction == 'edit' ? 'Cập nhật sản phẩm' : 'Thêm sản phẩm'}</h2>

  <c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
  </c:if>

  <form action="${pageContext.request.contextPath}/products?action=${formAction}" method="post">
    <c:if test="${formAction == 'edit'}">
      <input type="hidden" name="id" value="${product.id}">
    </c:if>

    <div class="mb-3">
      <label class="form-label">Tên sản phẩm</label>
      <input type="text" name="name" class="form-control" value="${product.name}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Giá</label>
      <input type="number" step="0.01" min="0" name="price" class="form-control" value="${product.price}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Số lượng</label>
      <input type="number" min="0" name="quantity" class="form-control" value="${product.quantity}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Category</label>
      <select name="categoryId" class="form-select" required>
        <option value="">-- Chọn category --</option>
        <c:forEach var="c" items="${categories}">
          <option value="${c.id}"
                  <c:if test="${product.category_id == c.id}">selected</c:if>>
              ${c.name}
          </option>
        </c:forEach>
      </select>
    </div>

    <button type="submit" class="btn btn-primary">
      ${formAction == 'edit' ? 'Cập nhật' : 'Thêm mới'}
    </button>
    <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Quay lại</a>
  </form>
</div>
</body>
</html>