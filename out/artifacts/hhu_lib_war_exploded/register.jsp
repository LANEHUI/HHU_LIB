<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/26
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户注册</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        h4{
            text-align: center;color: red;
        }
        body{
            background-color: antiquewhite;
        }
        div{
            text-align: center;
        }

    </style>
</head>
<body>
<h1>用户注册</h1>
<hr/>
<form action="register_do.jsp" method="post" name="registerForm">
    <div>
        <tr>
            <label>您的账号：</label>
            <input type="text" name="name" id="name" placeholder="请输入用户名">
        </tr>
    </div>
    <div>
        <tr>
            <label>您的密码：</label>
            <input type="password" name="password" id="password" placeholder="请输入密码">
        </tr>
    </div>
    <div>
        <tr>
            <label>确认密码：</label>
            <input type="password" name="relpassword" id="relpassword" placeholder="请确认密码">
        </tr>
    </div>
    <div>
        <tr>
            <label>电子邮件：</label>
            <input type="text" name="email" id="email" placeholder="请输入电子邮件">
        </tr>

    </div>
    <div>
        <tr>
            <button type="submit" >注册</button>
            <button type="reset">重置</button>
            <a href="login.jsp" target="_blank">登录</a>
        </tr>
    </div>
</form>


</body>
</html>
