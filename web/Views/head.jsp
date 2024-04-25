<%-- 
    Document   : start
    Created on : Mar 14, 2024, 12:31:19 AM
    Author     : PC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.User"%>
<body>
    <link rel="stylesheet" href="css/style.css">

    <header style="background-color: #007BFF; display: flex; justify-content: space-between; align-items: center;">
        <div>
            <a href="home"><img src="img/logo.jpg" width="70px" style="border-radius: 50%" height="70px" alt="home"/></a>
                <%-- lay session unameuser voi logout o home --%>
            <span style="margin: 20px; color: black; font-weight: bold">
                Xin Chào ${sessionScope.account.username} !
                <c:if test="${sessionScope.account!=null}">
                    <input type="submit" onclick="window.location.href = 'logout'" value="Đăng xuất" style="text-decoration: none; color: white; background-color: red; border: 1px solid red; border-radius: 5px; cursor: pointer;">         
                </c:if>

                <c:if test="${sessionScope.account != null}">
                    <input type="submit" onclick="window.location.href = 'history'" value="Lịch sử mua hàng"/>
                </c:if>
                <%-- neu chua co session account --%>
                <c:if test="${sessionScope.account == null}">
                    <input type="submit" onclick="window.location.href = 'loginuser'" value="Đăng nhập" style="text-decoration: none; color: white; background-color: green; border: 1px solid green; border-radius: 5px; cursor: pointer;">
                    <input type="submit" onclick="window.location.href = 'signup'" value="Đăng kí" style="text-decoration: none; color: white; background-color: red; border: 1px solid red; border-radius: 5px; cursor: pointer;">
                </c:if>

                <%-- neu quyen bang 0 thi moi hien thi admin --%>
                <c:if test="${sessionScope.account.role == 0}">
                    <input type="submit" onclick="window.location.href = 'admin'" value="Trình quản lí máy chủ" style="text-decoration: none; color: white; background-color: green; border: 1px solid green; border-radius: 5px; cursor: pointer;">
                </c:if>
            </span>

            <%-- Hiển thị thông tin tài khoản và số tiền --%>
            <c:if test="${sessionScope.account!= null}" >   
                <span style="color: black; font-weight: bold; padding-left: 250px;">Tiền Trong Tài khoản: ${sessionScope.account.money} VNĐ</span>
                <a href="myaccount" style="margin-left: 10px; color: black; font-weight: bold;">Thông tin tài khoản</a>

            </c:if>
        </div>

        <%-- Hiển thị giỏ hàng --%>
        <c:if test="${sessionScope.account!=null}">
            <a href="show" style="text-decoration: none;">
                <span style="color: blue; font-size: 24px;">${sessionScope.size}</span>
                <img src="img/giohang.png" width="50px" style="border-radius: 50%;" height="50px"/>
            </a>    
        </c:if>
    </header>
    <div class="topnav" style="display: flex;justify-content: center">
        <ul>
            <li><a href="home" style="font-weight: bold;">Trang chủ</a></li>
                <%-- Hiển thị danh sách categories --%>
                <c:forEach var="category" items="${cate}">
                <li><a href="searchnav?caid=${category.categoriesID}" style="font-weight: bold;">${category.categoriesName}</a></li>
                </c:forEach>
        </ul>
        <form action="search" method="get" style="display: flex; align-items: center; padding-top: 15px;">
            <input type="text" placeholder="Tìm kiếm sản phẩm" name="key" style="flex: 1; margin-right: 5px;">
            <button type="submit" style="border: none; background: none; cursor: pointer;">
                <img src="img/search.png" width="16px" height="16px" alt="Tìm kiếm">
            </button>
        </form>
    </div>
