<%@ page import="object.User" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>top</title>
</head>
<body>
<%
    User user = (User) request.getAttribute("user");
%>
<div>
    <h1>欢迎来到图书管理系统</h1>
    <td>欢迎您：<%=user.getUserid()%></td>
    <a href="logout.jsp" target="_top">退出</a>
</div>

<hr>

</body>
</html>
