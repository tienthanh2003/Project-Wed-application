<%-- 
    Document   : Login
    Created on : Mar 9, 2024, 12:07:33 PM
    Author     : PC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Đăng Nhập</title>
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
  <h2 class="login-title">Đăng Nhập</h2>
  <c:set var="cookie" value="${pageContext.request.cookies}"/>
  <form class="login-form" action="<%=request.getContextPath() %>/loginuser" method="post">
      <input type="text" placeholder="Nhập tài khoản" value="${cookie.uuser.value}"
             name="user">
    <input type="password" placeholder="Nhập mật khẩu" value="${cookie.upass.value}"
           name="pass">
    <div class="checkbox-container">
    </div>
    <a href="change" class="forgot-password">Đổi Mật Khẩu?</a>
    <h3 style="color: red">${requestScope.errol}</h3>
    <button type="submit">Đăng Nhập</button>
    <p class="signup-text">Tạo Tài Khoản Mới? <a href="signup">Tạo Tài Khoản!</a></p>
  </form>
</div>

</body>
</html>
