<%-- 
    Document   : History
    Created on : Apr 23, 2024, 7:52:49 PM
    Author     : PC
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lịch sử mua hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th, td {
                padding: 8px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
            th {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #f5f5f5;
            }
            a {
                text-decoration: none;
                color: blue;
            }
        </style>
    </head>
    <body>
        <h1>Lịch Sử mua hàng</h1>
        <table>
            <tr>
                <th>Mã Đơn</th>
                <th>Ngày Đặt</th>
                <th>Số điện thoại</th>
                <th>Địa chỉ giao hàng</th>
                <th>Tổng số tiền</th>
                <th>Trạng thái đơn hàng</th>
            </tr>
            <c:forEach var="order" items="${orders}">
                <tr>
                    <td>${order.oid}</td>
                    <td>${order.orderDate}</td>
                    <td>${order.phone}</td>
                    <td>${order.address}</td>
                    <td>${order.totalAmount}</td>
                    <td>
                        <c:choose>
                            <c:when test="${order.status == 0}">Chờ giao hàng</c:when>
                            <c:when test="${order.status == 1}">Hoàn Thành</c:when>
                            <c:otherwise>Unknown</c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <a href="home">Về trang chủ</a>
    </body>
</html>


