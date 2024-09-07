<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 16:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.Book" %>
<%@ page import="object.User" %>
<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户主页</title>
    <style type="text/css">

        body {
            background-color: cornsilk;
            text-align: center;
        }

    </style>

</head>
<body>
<%
    User us = (User) request.getAttribute("user");
%>
<div>
    <h1>欢迎来到图书管理系统</h1>
    <td>欢迎您：<%=us.getUserid()%></td>
    <a href="logout.jsp" target="_top">退出</a>
</div>

<hr>
<h4>读者操作</h4>



<a href="lent_book.jsp?readerid=<%=us.getUserid()%>">查询图书</a>
<br>
<a href="lend_information.jsp?userid=<%=us.getUserid()%>">查询借书记录</a>
</body>

</html>
