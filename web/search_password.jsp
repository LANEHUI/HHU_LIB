<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/26
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
    <style type="text/css">
        h1{
            text-align: center;
        }
        div{
            text-align: center;
        }
        body{
            background-color:antiquewhite;
        }
    </style>
</head>
<body>
<h1>找回密码</h1>
<hr>
<div>
    <a href="login.jsp">返回上一级</a>
</div>
<br>
<form action="search_password_do.jsp" method="post">
    <table align="center">
        <tr>
            <td>请输入账号：</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>请输入邮箱：</td>
            <td><input type="text" name="email"/></td>
        </tr>
        <tr>
            <td colspan="1"></td>
            <td>
                <input type="submit" value="提交">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
