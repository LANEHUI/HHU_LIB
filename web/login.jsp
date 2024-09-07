<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/26
  Time: 14:48
  To change this template use File | Settings | File Templates.
  用户登录界面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
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
    <title>登录界面</title>
    <style type="text/css">
        h1{
            text-align: center;
            font-size: large;
            font-style: oblique;
        }
        h4{
            text-align: center;color: red;
        }
        body {
            /* 加载背景图 */
            background-image: url(images/login.jpg);
            /* 背景图垂直、水平均居中 */
            background-position: center center;
            /* 背景图不平铺 */
            background-repeat: no-repeat;
            /* 当内容高度大于图片高度时，背景图像的位置相对于viewport固定 */
            background-attachment: fixed;
            /* 让背景图基于容器大小伸缩 */
            background-size: cover;
            /* 设置背景颜色，背景图加载过程中会显示背景色 */
            background-color: #464646;
        }
        a{
            text-decoration: none;font-size: 20px;color: black;
        }
        a:hover{
            text-decoration: underline;font-size: 24px;color: red;
        }
    </style>
</head>
<body>
    <form action="login_do.jsp" method="post">
        <h1>用户登录</h1>
        <hr/>
        <table align="center">
            <tr>
                <td>账号：</td>
                <td>
                    <input type="text" name="username" id="username" placeholder="请输入您的账号" autofocus="autofocus">
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <input type="password" name="password" id="password" placeholder="请输入您的密码">
                </td>
                <td><a href="search_password.jsp">找回密码</a></td>
            </tr>
            <tr>
                <td colspan="1">
                </td>
                <td>
                    <input type="submit" value="登录"/>
                    <input type="reset" value="重置"/>
                    <a href="register.jsp" target="_blank">注册</a>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
