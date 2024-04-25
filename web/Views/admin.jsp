<%-- 
    Document   : admin
    Created on : Mar 13, 2024, 6:14:07 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trình quản lí</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f5f5f5;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 20px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            th, td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            th {
                background-color: #f2f2f2;
            }
            button {
                padding: 10px 20px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                margin-right: 10px;
                font-size: 16px;
                transition: background-color 0.3s;
            }
            button:hover {
                background-color: #555;
                color: white;
            }
            .add-button {
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="head.jsp"/>
        <div class="container">
            <h1>Admin Page</h1>
            <div class="add-button">
                <button onclick="location.href = 'usermanager'">Quản lí người dùng</button>

                <!-- Button to navigate to order management page -->
                <button onclick="location.href = 'order'">Quản lí đơn hàng</button>

                <!-- Button to navigate to categories management page -->
                <button onclick="location.href = 'categories'">Quản lí danh mục sách</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Mô tả nội dung</th>
                        <th>Số Lượng</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="b" items="${product}">
                        <tr>
                            <td>${b.bookID}</td>
                            <td>${b.name}</td>
                            <td><img src="${b.link}" width="150px"></td>
                            <td>${b.descrip}</td>
                            <td>${b.quantity}</td>
                            <td>${b.price}</td>
                            <td>${b.cateid.categoriesName}</td>
                            <td>
                                <button onclick="location.href = 'editbook?beid=${b.bookID}'">Edit</button>
                                <button onclick="location.href = 'deletebook?bdid=${b.bookID}'" style="background-color: red; color: white;">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="add-button">
                <button onclick="location.href = 'addbook'">Thêm Sản Phẩm</button>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp"/>
</html>

