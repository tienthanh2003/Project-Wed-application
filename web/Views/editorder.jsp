<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Chỉnh sửa trạng thái đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                padding: 20px;
            }

            h1 {
                text-align: center;
                color: #333;
            }

            form {
                width: 50%;
                margin: 0 auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
                color: #333;
            }

            select, button {
                width: 100%;
                padding: 10px;
                margin-top: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            button {
                background-color: #3498db;
                color: #fff;
                font-weight: bold;
                cursor: pointer;
            }

            button:hover {
                background-color: #2980b9;
            }

            a {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #333;
                text-decoration: none;
            }
        </style>
    </head>
    <body>
        <h1>Chỉnh sửa trạng thái đơn hàng</h1>

        <form action="editorder" method="post">
            <input type="text" name="oID" value="${order.oid}" readonly>
            <label for="status">New Status:</label>
            <select id="status" name="status">
                <option value="0" ${order.status == 0 ? 'selected' : ''}>Chờ giao hàng</option>
                <option value="1" ${order.status == 1 ? 'selected' : ''}>Hoàn thành</option>
            </select>

            <br><br>
            <button type="submit">Lưu</button>
            <button onclick="location.href = 'order'">Hủy</button>
            <a href="home">Về trang chủ</a>
        </form>
    </body>
</html>

