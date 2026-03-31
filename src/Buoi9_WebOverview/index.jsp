<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; }
        .form-group { margin-bottom: 15px; }
        label { display: inline-block; width: 150px; }
        input { padding: 5px; }
        button { padding: 5px 15px; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Product Discount Calculator</h2>
    <form action="display-discount" method="POST">
        <div class="form-group">
            <label for="description">Product Description:</label>
            <input type="text" id="description" name="description" placeholder="Mô tả sản phẩm" required>
        </div>

        <div class="form-group">
            <label for="price">List Price:</label>
            <input type="number" id="price" name="price" step="0.01" placeholder="Giá niêm yết" required>
        </div>

        <div class="form-group">
            <label for="discount">Discount Percent:</label>
            <input type="number" id="discount" name="discount" step="0.1" placeholder="Tỷ lệ chiết khấu (%)" required>
        </div>

        <button type="submit">Calculate Discount</button>
    </form>
</body>
</html>