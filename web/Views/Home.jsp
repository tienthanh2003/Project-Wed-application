<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="Models.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookStore - Trang chủ</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #fff;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .logo {
            margin-right: 20px;
        }
        .user-info {
            display: flex;
            align-items: center;
        }
        .user-info span {
            margin-right: 20px;
            color: black;
            font-weight: bold;
        }
        .user-info input[type="submit"] {
            cursor: pointer;
            color: white;
            border: 1px solid;
            border-radius: 5px;
            padding: 5px 10px;
            margin-right: 10px;
        }
        .user-info input[type="submit"]:hover {
            background-color: #333;
            border-color: #333;
        }
        .user-info a {
            color: black;
            font-weight: bold;
            text-decoration: none;
        }
        .account-info {
            color: black;
            font-weight: bold;
            padding-left: 250px;
        }
        .cart {
            margin-left: 20px;
            text-decoration: none;
            color: blue;
            font-size: 24px;
        }
        .search-form {
            padding-top: 15px;
        }
        .search-form input[type="text"] {
            padding: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-right: 5px;
        }
        .search-form button {
            background-color: transparent;
            border: none;
            cursor: pointer;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .product {
            list-style-type: none;
            margin: 20px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            max-width: 250px;
        }
        
        .product h3 {
            margin-top: 0;
        }
        .product p {
            margin: 5px 0;
            color: red;
        }
        .product-form {
            display: flex;
            align-items: center;
        }
        .product-form input[type="number"] {
            width: 50px;
            margin-right: 5px;
        }
        .product-form input[type="submit"] {
            background-color: red;
            color: white;
            font-weight: bold;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .product-form input[type="submit"]:hover {
            background-color: darkred;
        }
        .sold-out {
            color: red;
        }
        .purchase-history {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <a href="home"><img src="img/logo.jpg" width="70px" height="70px" alt="home"/></a>
    </div>
    <div class="user-info">
        <%-- Hiển thị thông tin người dùng --%>
        <span>Xin Chào ${sessionScope.account.username} !</span>
        <c:choose>
            <c:when test="${sessionScope.account != null}">
                <input type="submit" onclick="window.location.href = 'logout'" value="Đăng Xuất"/>
            </c:when>
            <c:otherwise>
                <input type="submit" onclick="window.location.href = 'loginuser'" value="Đăng Nhập"/>
                <input type="submit" onclick="window.location.href = 'signup'" value="Đăng Ký"/>
            </c:otherwise>
        </c:choose>
        <%-- Hiển thị nút Admin nếu là quản trị viên --%>
        <c:if test="${sessionScope.account != null && sessionScope.account.role == 0}">
            <input type="submit" onclick="window.location.href = 'admin'" value="Trình quản lí máy chủ"/>
        </c:if>
            <%-- Hiển thị nút lịch sử mua hàng --%>
            <c:if test="${sessionScope.account != null}">
                <input type="submit" onclick="window.location.href = 'history'" value="Lịch sử mua hàng"/>
            </c:if>
        <%-- Hiển thị số tiền trong tài khoản và liên kết đến trang thông tin tài khoản --%>
        <c:if test="${sessionScope.account != null}">
            <span class="account-info">Tiền Trong Tài khoản: ${sessionScope.account.money} VNĐ</span>
            <a href="myaccount">Thông tin tài khoản</a>
        </c:if>
        <%-- Hiển thị giỏ hàng --%>
        <c:if test="${sessionScope.account != null}">
            <a href="show" class="cart">
                <span>${sessionScope.size}</span>
                <img src="img/giohang.png" width="50px" height="50px" alt="cart"/>
            </a>
            
        </c:if>
    </div>
</header>

<div class="topnav">
    <ul>
        <li><a href="home">Trang chủ</a></li>
        <%-- Hiển thị danh sách categories --%>
        <c:forEach var="category" items="${cate}">
            <li><a href="searchnav?caid=${category.categoriesID}">${category.categoriesName}</a></li>
        </c:forEach>
    </ul>
    <form action="search" method="get" class="search-form">
        <input type="text" placeholder="Tìm kiếm sản phẩm" name="key"/>
        <button onclick="this.form.submit()"><img src="img/search.png" width="16px" height="16px" alt="search"/></button>
    </form>
</div>

<a href="detail?bid=6">
    <div style="position: relative;">
        <div style="display: flex; justify-content: center; align-items: center;">
            <img id="mainImage" src="img/sanphammoi.jpg" width="1300px" height="700px" alt="new_product"/>
        </div>
        <div style="position: absolute; top: 10px; right: 10px; background-color: rgba(255, 255, 255, 0.8); padding: 5px; border-radius: 5px;">
            <p style="margin: 0; font-weight: bold;">Sản phẩm mới giảm 50%</p>
        </div>
    </div>
</a>

<div>
    <h2 style="text-align: center;">Sản phẩm</h2>
    <h3 style="text-align: center;color: red">${errolcart}</h3>
    <div class="product-list">
        <c:forEach var="p" items="${books}">
            <ul class="product">
                <li>
                    <a href="detail?bid=${p.bookID}"><h3>${p.name}</h3></a>
                    <img src="${p.link}" alt="${p.name}" height="256px" width="256px"/>
                    <h7>Số lượng: ${p.quantity}</h7>
                    <p>Giá: ${p.price} VND</p>
                    <c:choose>
                        <c:when test="${p.quantity > 0}">
                            <form action="purchase" method="get" class="product-form">
                                <input type="number" value="1" name="num"/>
                                <input type="hidden" value="${p.bookID}" name="id"/>
                                <input type="submit" value="Thêm vào giỏ hàng"/>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <p class="sold-out">Hết hàng</p>
                        </c:otherwise>
                    </c:choose>
                </li>
            </ul>
        </c:forEach>
    </div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>
