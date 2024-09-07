<%@ page import="object.User" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="java.util.List" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>

<html>
<head>
    <%
        List<User> list = (List<User>) request.getAttribute("list");
        String password = list.get(0).getPassword();
    %>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>弹出信息</title>
    <script type="text/javascript">
        alert("您的密码是：<%=password%>");
    </script>
    <style type="text/css">
        h1{
            text-align: center;
        }
        div{
            text-align: center;
        }
    </style>
</head>
<body>
<h1>您的密码是：<%=password%></h1>

<div>
    <td><a href="login.jsp">返回登录</a></td>
</div>
</body>
</html>
