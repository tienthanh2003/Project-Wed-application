<%-- 
    Document   : changePassword
    Created on : Apr 9, 2024, 8:04:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
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
                width: 300px;
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
            <h2 class="login-title">Thay Lại mật khẩu</h2>
            <form class="login-form" action="change" method="post">
                <input type="text" placeholder="Nhập TK cần đổi MK" name="user">
                <input type="password" placeholder="Nhập Mk cũ!" name="pass">
                <input type="password" placeholder="Nhập Mk mới!" name="pass1">
                <input type="password" placeholder="Nhập lại MK mới!" name="pass2">
                <h3 style="color: red">${requestScope.errol1} ${requestScope.errol2} ${requestScope.errol3} ${requestScope.errol4}</h3>
                <h3 style="color: greenyellow"> ${requestScope.success}<h3>
                        <button type="submit">Đổi Mật Khẩu</button>
                        <p class="signup-text"> <a href="loginuser">Quay về trang đăng nhập</a></p>
                        </form>
                        </div>
                        </body>
                        </html>

