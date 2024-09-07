<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增用户</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        h4 {
            text-align: center;
            color: red;
        }

        body {
            background-color: antiquewhite;
        }

        div {
            text-align: center;
        }

        #before {
            text-align: center;
        }

    </style>
</head>
<body>
<h1>新增用户</h1>
<hr>

<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
</br>

<form action="user_add_do.jsp" method="post" name="registerForm">
    <div>
        <tr>
            <label>账号：</label>
            <input type="text" name="username" id="username" placeholder="用户名" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>密码：</label></td>
            <input type="text" name="password" id="password" placeholder="密码">
        </tr>
    </div>
    <div>
        <tr>
            <label>邮箱：</label>
            <input type="text" name="email" id="email" placeholder="邮箱">
        </tr>
    </div>
    <div>
        <tr>
            <label>是否管理员：</label>
            <input type="text" name="isadmin" id="isadmin" placeholder="是否管理员（1是，0否）">
        </tr>
    </div>

    <div id="submitbtn">
        <tr>
            <button type="submit" onclick="return checkForm()">添加</button>
            <button type="reset">重置</button>

        </tr>
    </div>
</form>

</body>
</html>
