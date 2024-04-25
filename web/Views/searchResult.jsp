<%-- 
    Document   : searchResult
    Created on : Mar 13, 2024, 9:13:35 PM
    Author     : PC
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="head.jsp"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kết Quả Tìm kiếm</title>
        <link rel="stylesheet" href="css/style.css">
        <style>


            /* CSS bổ sung */
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .search-results {
                max-width: 800px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .search-results h1 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .product-list {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
            }

            .product {
                width: 250px;
                margin: 20px;
                padding: 10px;
                background-color: #fff;
                border: 1px solid #ccc;
                border-radius: 8px;
                box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s;
            }

            .product:hover {
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            .product img {
                width: 100%;
                height: auto;
                border-radius: 8px;
            }

            .product h3 {
                margin-top: 10px;
                text-align: center;
                color: #333;
            }

            .product p {
                margin-top: 10px;
                text-align: center;
                color: #666;
            }

            .out-of-stock {
                color: red;
                font-weight: bold;
            }

            .add-to-cart-form {
                text-align: center;
                margin-top: 10px;
            }

            .add-to-cart-form input[type="number"] {
                width: 100px;
                height: 30px;
                text-align: center;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .add-to-cart-button {
                width: 200px;
                height: 40px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .add-to-cart-button:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="search-results">
            <h1>Kết Quả Tìm kiếm</h1>
            <div class="product-list">
                <c:choose>
                    <c:when test="${not empty books}">
                        <c:forEach var="p" items="${books}">
                            <div class="product">
                                <a href="detail?bid=${p.bookID}">
                                    <img src="${p.link}" alt="${p.name}">
                                    <h3>${p.name}</h3>
                                </a>
                                <p>Số lượng: ${p.quantity}</p>
                                <p>Giá: ${p.price} VND</p>
                                <c:if test="${p.quantity <= 0}">
                                    <p class="out-of-stock">Hết hàng</p>
                                </c:if>
                                <c:if test="${p.quantity > 0}">
                                    <div class="add-to-cart-form">
                                        <form action="purchase" method="get">
                                            <input type="number" value="1" name="num" min="1">
                                            <input type="hidden" value="${p.bookID}" name="id">
                                            <button class="add-to-cart-button" type="submit">Thêm vào giỏ hàng</button>
                                        </form>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p>Không tìm thấy sách với tiêu chí đã cho.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
    <jsp:include page="footer.jsp"/>
</html>




