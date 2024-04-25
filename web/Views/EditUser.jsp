<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@page import="Models.User"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chỉnh sửa người dùng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            .container {
                max-width: 500px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            form {
                margin-top: 20px;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            td {
                padding: 10px;
                border-bottom: 1px solid #ddd;
            }

            td:first-child {
                width: 30%;
                font-weight: bold;
            }

            input[type="text"],
            input[type="password"],
            select,
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            select {
                height: 40px;
            }

            button[type="submit"],
            button[type="button"] {
                padding: 10px 20px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            button[type="submit"]:hover,
            button[type="button"]:hover {
                background-color: #0056b3;
            }

            button[type="button"] {
                background-color: #dc3545;
            }

            button[type="button"]:hover {
                background-color: #bd2130;
            }

            button[type="button"],
            .back-to-manager {
                display: block;
                width: 100%;
                margin-top: 20px;
                text-align: center;
                text-decoration: none;
                color: #333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h1>Edit User</h1>
            <form method="post">
                <table>
                    <tr>
                        <td>Tên người dùng</td>
                        <td>
                            <input type="text" name="username" value="${user.username}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Mật khẩu</td>
                        <td>
                            <input type="password" name="password" value="${user.password}" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Quyền</td>
                        <td>
                            <select name="role">
                                <option value="0" ${user.role == 0 ? "selected" : ""}>Quản trị viên</option>
                                <option value="1" ${user.role == 1 ? "selected" : ""}>Khách hàng</option>
                                <option value="2" ${user.role == 2 ? "selected" : ""}">Bị cấm</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Tiền trong tài khoản</td>
                        <td>
                            <input type="number" name="money" value="${user.money}" required>
                        </td>
                    </tr>
                    <tr>
                        <td><button type="submit">Lưu</button></td>
                        <td>
                            <button type="button" onclick="location.href = 'usermanager'">Hủy</button>
                        </td>
                    </tr>
                </table>
            </form>
            <a class="back-to-manager" href="home">Về trang chủ</a>
        </div>
    </body>
</html>

