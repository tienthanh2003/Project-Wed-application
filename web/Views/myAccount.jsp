<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin tài khoản</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        #wrapper {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: green;
            font-size: 1.2rem;
            margin: 10px 0;
        }

        h3.error {
            color: red;
        }

        table {
            width: 100%;
        }

        table td {
            padding: 10px 0;
        }

        input[type="text"] {
            width: calc(100% - 10px);
            padding: 10px;
            margin: 5px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 1rem;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        hr {
            margin: 20px 0;
            border: none;
            border-top: 1px solid #ccc;
        }

        #checkform2 {
            display: none;
            text-align: center;
        }

        #checkform2 img {
            width: 30%;
            height: auto;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
    <div>
    <jsp:include page="head.jsp"/>
    <c:set value="${requestScope.user}" var="u"/>
    </div>
    <div id="wrapper">
        <h3>${requestScope.succ} ${requestScope.succ1} </h3>
        <h3 class="error">${requestScope.fail} ${requestScope.err1}</h3>
        <table>
            <tr>
                <td><h3>Tên khách hàng:</h3></td>
                <td><input type="text" readonly value="${u.username}"/></td>
            </tr>
            <tr>
                <td><h3>Tiền trong tài khoản:</h3></td>
                <td><input type="text" readonly value="${u.money}"/></td>
            </tr>
            <tr>
                <td colspan="2"><button onclick="checkout2()">Nạp tiền vào tài khoản</button></td>
            </tr>
        </table>
        <hr>
        <form action="AmountUser" id="checkform2">
            <img src="img/quetma.jpg" alt="Scan QR code" id="qr-code-img">
            <h3>Vui lòng chuyển khoản theo mẫu: Tên người dùng + nạp + số tiền + vào tài khoản mua sách</h3> 
        </form>
        <hr>
    </div>
    <jsp:include page="footer.jsp"/>
</body>
<script>
    function checkout2() {
        let form = document.querySelector("#checkform2");
        form.style.display = (form.style.display === 'none') ? 'block' : 'none';
    }
</script>
</html>

