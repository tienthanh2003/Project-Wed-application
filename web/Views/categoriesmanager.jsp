<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh mục sách</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: white;
                padding: 20px;
            }

            h3 {
                text-align: center;
                color: #333;
            }

            table {
                width: 90%;
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

            #addCategoryForm {
                margin-top: 20px;
                display: none;
            }

            #showFormButton {
                display: block;
                margin: 20px auto;
                padding: 10px 20px;
                background-color: #3498db;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }

            #errorMessage {
                text-align: center;
                color: red;
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <h3>Danh mục sách</h3>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên danh mục</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="c" items="${categories}">
                    <tr>
                        <td>${c.categoriesID}</td>
                        <td>${c.categoriesName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div id="addCategoryForm">
            <form id="category" action="addcategories" method="post">
                Category Name:
                <input type="text" id="categoryName" name="categoryName" required>
                <input type="submit" value="Thêm">
            </form>
        </div>
        <button id="showFormButton">Thêm mới</button>
        <a class="back-link" href="admin">Trình quản lí</a>
        <a class="back-link" href="home">Trang chính</a>
        <p id="errorMessage">${error}</p>
    </body>
    <script>
        document.getElementById('showFormButton').addEventListener('click', function () {
            var formDiv = document.getElementById('addCategoryForm');
            if (formDiv.style.display === 'none') {
                formDiv.style.display = 'block';
            } else {
                formDiv.style.display = 'none';
            }
        });
    </script>
</html>


