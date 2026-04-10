<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Cập nhật sản phẩm</h2>
<p><a href="/products">Quay lại danh sách</a></p>

<form action="/products?action=edit" method="post" style="max-width: 500px;">
    <input type="hidden" name="id" value="${product.id}">

    <div class="mb-3">
        <label class="form-label">Tên sản phẩm</label>
        <input type="text" name="name" class="form-control" value="${product.name}" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Giá</label>
        <input type="number" name="price" class="form-control" step="0.1" value="${product.price}" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Nhà sản xuất</label>
        <input type="text" name="producer" class="form-control" value="${product.producer}" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Mô tả</label>
        <textarea name="description" class="form-control">${product.description}</textarea>
    </div>
    <button type="submit" class="btn btn-success">Cập nhật</button>
</form>
</body>
</html>