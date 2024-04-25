<%-- 
    Document   : usermanager
    Created on : Mar 13, 2024, 9:18:24 PM
    Author     : PC
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách người dùng</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        button {
            padding: 8px 16px;
            border: none;
            cursor: pointer;
            border-radius: 4px;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        button.edit {
            background-color: #4CAF50;
            color: white;
        }
        button.delete {
            background-color: #f44336;
            color: white;
        }
        button:hover {
            opacity: 0.8;
        }
        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border-radius: 4px;
            transition: background-color 0.3s;
        }
        a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3>Danh sách các tài khoản</h3>
        <table>
            <tr>
                <th>Mã người dùng</th>
                <th>Tên người dùng </th>
                <th>Mật khẩu</th>
                <th>Quyền</th>
                <th>Tiền trong tài khoản</th>
                <th>Thao tác</th>
            </tr>
            <c:forEach var="u" items="${user}">
                <tr>
                    <td>${u.user_id}</td>
                    <td>${u.username}</td>
                    <td><input type="password" value="${u.password}" readonly></td>
                    <td>
                        <c:choose>
                            <c:when test="${u.role eq 0}">Quản trị viên</c:when>
                            <c:when test="${u.role eq 1}">Khách hàng</c:when>
                            <c:when test="${u.role eq 2}">Bị cấm</c:when>
                        </c:choose>
                    </td>
                    <td>${u.money}</td>
                    <td>
                        <button class="edit" onclick="location.href = 'edit?eid=${u.user_id}'">Edit</button>
                        <button class="delete" onclick="location.href = 'delete?did=${u.user_id}'">Delete</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="admin">Trình quản lí</a>
        <a href="home">Về Trang chủ</a>
    </div>
</body>
</html>



