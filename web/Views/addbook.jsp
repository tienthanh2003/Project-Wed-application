<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thêm Sản Phẩm Mới</title>
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

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        select {
            height: 40px;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        .cancel-button {
            margin-top: 10px;
            background-color: #dc3545;
        }

        .cancel-button:hover {
            background-color: #bd2130;
        }

        .back-to-main {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }

        .back-to-main:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Thêm Sản Phẩm Mới</h1>
        <form action="addbook" method="post">
            <label for="bookName">Tên Sách:</label>
            <input type="text" id="bookName" name="bookName" required><br>
            <label for="imagePath">Đường Dẫn Hình Ảnh:</label>
            <input type="text" id="imagePath" name="imagePath" required><br>
            <label for="description">Mô Tả:</label>
            <input type="text" id="description" name="description" required><br>
            <label for="quantity">Số Lượng:</label>
            <input type="number" id="quantity" name="quantity" required><br>
            <label for="price">Giá:</label>
            <input type="number" step="0.01" id="price" name="price" required><br>
            <label for="category">Danh Mục:</label>
            <select id="category" name="category">
                <c:forEach items="${categories}" var="category">
                    <option value="${category.categoriesID}" ${book.cateid.categoriesID == category.categoriesID ? 'selected' : ''}>${category.categoriesName}</option>
                </c:forEach>
            </select><br>
            <button type="submit">Thêm</button>
            <button type="button" class="cancel-button" onclick="location.href = 'admin'">Hủy</button>
        </form>
        <a class="back-to-main" href="home">Quay lại trang chính</a>
    </div>
</body>
</html>

