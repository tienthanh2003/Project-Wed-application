<%-- 
    Document   : detail
    Created on : Mar 12, 2024, 7:53:07 AM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang Chi Tiết</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            
            .product-ad {
                font-family: Arial, sans-serif;
                max-width: 60%;
                border: 1px solid #000;
                padding: 10px;
                margin-top: 50px;
                margin-left: auto;
                margin-right: auto;
                display: flex; /* Sử dụng flexbox để chia màn hình */
            }

            .product-image {
                flex: 1; /* Chiếm một nửa không gian */
                text-align: center;
                margin-bottom: 10px;
            }

            .product-image img {
                max-width: 100%;
            }

            .product-details {
                flex: 1; /* Chiếm nửa còn lại của không gian */
                padding: 0 20px; /* Thêm một số padding để cách lề tốt hơn */
            }

            .product-header {
                background-color: #EEE;
                padding: 5px;
                text-align: center;
                margin-bottom: 10px;
                font-weight: bold;
            }

            .product-price {
                text-align: center;
                margin-bottom: 10px;
                font-weight: bold;
            }

            .product-description {
                font-size: 0.9em;
            }

            /* CSS bổ sung cho tính đáp ứng */
            @media screen and (max-width: 768px) {
                .product-ad {
                    flex-direction: column; /* Xếp các mục theo chiều dọc trên các màn hình nhỏ hơn */
                }

                .product-details {
                    padding: 20px; /* Đặt lại padding để cách lề tốt hơn */
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="head.jsp"></jsp:include>
        <div id="wrapper">
            <div class="product-ad">
                <div class="product-image">
                    <c:if test="${not empty requestScope.detail}">
                        <div class="product-header">${requestScope.detail.name}</div>
                        <img src="${requestScope.detail.link}" style="width: 800px; height: 500px">
                    </c:if>
                </div>
                <div class="product-details">
                    <c:if test="${not empty requestScope.detail}">
                        <c:choose>
                            <c:when test="${requestScope.detail.quantity <= 0}">
                                <div style="text-align: center; font-weight: bold; color: red">Hết hàng</div>
                                <div class="product-description">
                                    <p style="font-size: 25px; font-weight: bold">Mô tả Sản Phẩm: </p>
                                    <p>${requestScope.detail.descrip}</p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div style="text-align: center; font-weight: bold; color: blue">Số Lượng Trong Kho: ${requestScope.detail.quantity}</div>
                                <div class="product-price">Giá:<span> ${requestScope.detail.price}</span>VND</div>
                                <form action="purchase" method="get">
                                    <input style="margin-left: 25%; width: 300px; height: 30px" type="number" value="1" name ="num">
                                    <input type="hidden" value="${requestScope.detail.bookID}" name="id">
                                    <br/>
                                    <input style="background-color: red; color: white; font-weight:bold; margin-left: 35%; margin-top: 20px; width: 200px" type="submit" value="Thêm vào giỏ hàng">
                                </form>
                                <c:if test="${not empty requestScope.detail.descrip}">
                                    <div class="product-description">
                                        <p style="font-size: 25px; font-weight: bold">Mô tả Sản Phẩm: </p>
                                        <p>${requestScope.detail.descrip}</p>
                                    </div>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                    </c:if>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>



