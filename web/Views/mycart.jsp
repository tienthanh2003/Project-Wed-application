<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Giỏ Hàng</title>
        <style>
            table {
                border-collapse: collapse;
                width: 100%;
            }

            table, th, td {
                border: 1px solid black;
                padding: 8px;
            }

            th {
                background-color: #f2f2f2;
                color: red;
                text-align: left;
            }

            td {
                text-align: center;
            }

            a {
                text-decoration: none;
                color: blue;
                font-size: 16px;
                font-weight: bold;
            }

            .checkout-btn {
                padding: 10px 20px;
                background-color: green;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

            .checkout-form {
                display: none;
            }

            .checkout-form input[type="text"], .checkout-form select {
                margin-bottom: 10px;
                padding: 5px;
                width: 100%;
            }

            .message {
                font-size: 18px;
                font-weight: bold;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="head.jsp"/>
        <div id="wrapper">
            <h1 style="color: red">Giỏ Hàng</h1>
            <table>
                <tr>
                    <th>Số thứ tự</th>
                    <th>Tên sản phẩm</th>
                    <th>Hình ảnh mô tả</th>
                    <th>Số lượng mua</th>
                    <th>Giá 1 sản phẩm</th>
                    <th>Tiền</th>
                    <th>Thao tác</th>
                </tr>
                <c:set var="t" value="0"/>
                <c:forEach items="${sessionScope.cart.items}" var="i">
                    <c:set var="t" value="${t+1}"/>
                    <tr>
                        <td>${t}</td>
                        <td>${i.book.name}</td>
                        <td><img src="${i.book.link}" width="80px" height="80px"/></td>
                        <td>
                            <a href="process?num=-1&id=${i.book.bookID}">-</a>
                            <input type="number" readonly value="${i.quantity}"/>
                            <a href="process?num=1&id=${i.book.bookID}">+</a>
                        </td>
                        <td><fmt:formatNumber pattern="##.#" value="${i.book.price}"/></td>
                        <td><fmt:formatNumber pattern="##.#" value="${i.book.price*i.quantity}"/></td>
                        <td>
                            <form action="process" method="post">
                                <input type="hidden" name="id" value="${i.book.bookID}"/>
                                <input type="submit" value="Return item"/>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <h3 class="message">Tổng Tiền: <fmt:formatNumber pattern="##.#" value="${sessionScope.cart.totalMoney}"/></h3>
            <hr>
            <button class="checkout-btn" onclick="checkout()">Thanh Toán</button>
            <div id="checkform" class="checkout-form">
                <form action="check" method="post">
                    <h1>Điền Thông Tin Đặt Hàng</h1>
                    <input name="address" type="text" placeholder="Nhập Địa chỉ Nhập Hàng"/><br>
                    <input name="phone" type="text" placeholder="Nhập Số điện Thoại"/><br>
                    <h3>Chọn Phương Thức Vận chuyển!</h3>
                    <select name="checkshipper">
                        <c:forEach items="${sessionScope.slist}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select><br>
                    <input type="submit" value="Xác Nhận"/>
                </form>
            </div>
            <h2 class="message" style="color: green">${requestScope.mess1}</h2>
            <h2 class="message" style="color: red">${requestScope.mess2}</h2>
            <h2 class="message" style="color: red">${requestScope.mess3}</h2>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
    <script>
        function checkout() {
            let form = document.querySelector("#checkform");
            if (form.style.display === 'none') {
                form.style.display = 'block';
            } else {
                form.style.display = 'none';
            }
        }
    </script>
</html>


