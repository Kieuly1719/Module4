<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Xoá sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-4">
<h2>Bạn có chắc chắn muốn xoá sản phẩm này?</h2>
<p><a href="/products">Huỷ và quay lại danh sách</a></p>

<div class="card" style="width: 18rem; margin-bottom: 20px;">
    <div class="card-body">
        <h5 class="card-title">${product.name}</h5>
        <h6 class="card-subtitle mb-2 text-muted">Giá: ${product.price}</h6>
        <p class="card-text">Hãng: ${product.producer}</p>
    </div>
</div>

<form action="/products?action=delete" method="post">
    <input type="hidden" name="id" value="${product.id}">
    <button type="submit" class="btn btn-danger">Xác nhận xoá</button>
</form>
</body>
</html>