<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Đơn hàng</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }

            h3 {
                text-align: center;
                margin-top: 20px;
                color: #333;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 12px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
                color: #333;
                font-weight: bold;
            }

            td {
                background-color: #fff;
                color: #333;
            }

            .edit-btn {
                background-color: #f1c40f;
                color: #fff;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
            }

            .info-btn {
                background-color: #e74c3c;
                color: #fff;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 8px;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <h3>Danh sách đơn hàng</h3>
        <table>
            <thead>
                <tr>
                    <th>Mã đơn</th>
                    <th>Tên người dùng</th>
                    <th>Phương thức vận chuyển</th>
                    <th>Ngày đặt hàng</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ giao hàng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái đơn hàng</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="od" items="${orders}">
                    <tr>
                        <td>${od.oid}</td>
                        <td>${od.uid.username}</td>
                        <td>${od.sid.name}</td>
                        <td>${od.orderDate}</td>
                        <td>${od.phone}</td>
                        <td>${od.address}</td>
                        <td>${od.totalAmount}</td>
                        <td>
                            <c:choose>
                                <c:when test="${od.status == 0}">Chờ Giao Hàng</c:when>
                                <c:when test="${od.status == 1}">Hoàn thành</c:when>
                                <c:otherwise>Unknown</c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <button class="edit-btn" onclick="location.href = 'editorder?oID=${od.oid}'">Edit</button>
                            <button class="info-btn" onclick="location.href = 'orderdetail?odid=${od.oid}'">Information</button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div>
            <a class="back-link" href="admin">Trình quản lí</a>
            <a class="back-link" href="home">Về trang chủ</a>
        </div>
    </body>
</html>


