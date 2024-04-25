<%-- 
    Document   : orderdetail
    Created on : Mar 16, 2024, 5:10:51 PM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chi tiết đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }

            h3 {
                text-align: center;
                color: #333;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: white;
            }

            th, td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
            }

            button, a {
                display: inline-block;
                padding: 10px 20px;
                background-color: #3498db;
                color: white;
                text-decoration: none;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-top: 20px;
            }

            button:hover, a:hover {
                background-color: #2980b9;
            }
        </style>
    </head>
    <body>
        <h3>Chi tiết đơn hàng</h3>
        <table>
            <thead>
                <tr>
                    <th>Mã Đơn</th>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng đặt</th>
                    <th>Giá mỗi sản phẩm</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="od" items="${orderDetails}">
                    <tr>
                        <td>${od.orderid.oid}</td>
                        <td>${od.bookid.name}</td>
                        <td>${od.quantity}</td>
                        <td>${od.price}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <button onclick="location.href = 'order'">Trình quản lí</button>
        <a href="home">Về trang chủ</a>
    </body>
</html>

