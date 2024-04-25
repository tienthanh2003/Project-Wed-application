<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng kí</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #007BFF;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            .login-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
                width: 800px;
            }
            .login-title {
                text-align: center;
                margin-bottom: 20px;
            }
            .login-form input[type="text"],
            .login-form input[type="password"] {
                width: 100%;
                padding: 7px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .login-form button {
                width: 100%;
                padding: 10px;
                background-color: #007BFF;
                color: white;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .login-form button:hover {
                background-color: #0056b3;
            }
            .login-form .checkbox-container {
                margin-bottom: 10px;
            }
            .login-form .signup-text {
                text-align: center;
                margin-top: 10px;
            }
            .login-form .forgot-password {
                text-align: center;
                display: block;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2 class="login-title">Tạo Tài Khoản</h2>
            <form class="login-form" action="signup" method="post">
                <input type="text" placeholder="Nhập Tên Tài Khoản:" name="user">
                <input type="password" placeholder="Nhập Mật Khẩu" name="pass1">
                <input type="password" placeholder="Nhập Lại Mật Khẩu" name="pass2">
                <h3 style="color: red">${requestScope.erol} ${requestScope.erol1} ${requestScope.erol2}</h3>
                <h3 style="color: greenyellow"> ${requestScope.success}<h3>
                        <button type="submit">Tạo Tài Khoản</button>
                        <p class="signup-text"> <a href="loginuser">Quay về trang đăng nhập</a></p>
                        </form>
                        </div>
                        </body>
                        </html>
