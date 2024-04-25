<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh sửa sản phẩm</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #007bff;
            color: #fff;
            padding: 20px 0;
            text-align: center;
        }

        h1 {
            margin: 0;
            font-size: 24px;
            font-weight: bold;
        }

        h2 {
            margin: 20px 0;
            font-size: 20px;
            text-align: center;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        select {
            width: calc(100% - 10px);
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button[type="submit"],
        button[type="button"],
        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button[type="submit"]:hover,
        button[type="button"]:hover,
        a:hover {
            background-color: #0056b3;
        }

        button[type="button"] {
            background-color: #dc3545;
        }

        button[type="button"]:hover {
            background-color: #bd2130;
        }

        button[type="submit"],
        button[type="button"] {
            margin-right: 10px;
        }

        .button-group {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <header>
        <h1>Trang chỉnh sửa</h1>
    </header>
    <h2>Thông tin sản phẩm</h2>
    <form action="editbook" method="post">
        <input type="hidden" name="bookID" value="${book.bookID}">
        <label for="Tên sản phẩm">Book Name:</label><br>
        <input type="text" id="bookName" name="bookName" value="${book.name}" required><br>
        <label for="imagePath">Image Path:</label><br>
        <input type="text" id="imagePath" name="imagePath" value="${book.link}" required><br>
        <label for="Mô tả nội dung">Description:</label><br>
        <input type="text" id="description" name="description" value="${book.descrip}" required><br>
        <label for="Số lượng">Quantity:</label><br>
        <input type="number" id="quantity" name="quantity" value="${book.quantity}" required><br>
        <label for="Giá">Price:</label><br>
        <input type="number" step="1000.00" id="price" name="price" value="${book.price}" required><br>
        <label for="Danh mục">Category:</label><br>
        <select id="category" name="category">
            <c:forEach items="${categories}" var="category">
                <option value="${category.categoriesID}" ${book.cateid.categoriesID == category.categoriesID ? 'selected' : ''}>${category.categoriesName}</option>
            </c:forEach>
        </select><br>
        <div class="button-group">
            <button type="submit">Lưu</button>
            <button type="button" onclick="location.href = 'admin'">Hủy</button>
            <a href="home">Về trang chủ</a>
        </div>
    </form>
</body>
</html>

