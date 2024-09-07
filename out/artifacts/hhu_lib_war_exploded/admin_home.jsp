<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员主页</title>
    <style type="text/css">

        body {
            background-color: cornsilk;
            text-align: center;
        }

    </style>

</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    if(user != null){
        session.setAttribute("admin_home",user);
    }
    user = (User) session.getAttribute("admin_home");
%>
<div>
    <h1>欢迎来到图书管理系统</h1>
    <td>欢迎您：<%=user.getUserid()%></td>
    <a href="logout.jsp" target="_top">退出</a>
</div>

<hr>
<h4>管理员操作</h4>

<a href="admin_user_manager.jsp">管理用户</a>
<br>
<a href="admin_book_manager.jsp">管理图书</a>
</body>
</html>
