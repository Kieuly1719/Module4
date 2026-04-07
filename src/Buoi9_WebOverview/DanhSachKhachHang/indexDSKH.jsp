<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List, java.util.ArrayList, model.Customer" %>

<%
    List<Customer> customerList = new ArrayList<>();
    customerList.add(new Customer("Mai Văn Hoàn", "1983-08-20", "Hà Nội", "Anh-doraemon1.jpg"));
    customerList.add(new Customer("Nguyễn Văn Nam", "1983-08-21", "Bắc Giang", "Anh-doraemon2.jpg"));
    customerList.add(new Customer("Nguyễn Thái Hòa", "1983-08-22", "Nam Định", "Anh-doraemon3.jpg"));
    customerList.add(new Customer("Trần Đăng Khoa", "1983-08-17", "Hà Tây", "Anh-doraemon4.jpg"));
    request.setAttribute("customers", customerList);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh sách khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .container {
            width: 700px;
            margin: 20px auto;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            padding: 20px;
        }
        h2 { text-align: center; }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        th { font-weight: bold; }
        img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 4px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Danh sách khách hàng</h2>
    <table>
        <thead>
            <tr>
                <th>Tên</th>
                <th>Ngày sinh</th>
                <th>Địa chỉ</th>
                <th>Ảnh</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="customer" items="${customers}">
                <tr>
                    <td>${customer.name}</td>
                    <td>${customer.birthDate}</td>
                    <td>${customer.address}</td>
                    <td><img src="${customer.imagePath}" alt="${customer.name}"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>