<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="object.User" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 16:16
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
    <title>用户管理</title>
    <style type="text/css">
        body {
            background-color: cornsilk;
            text-align: center;
        }
        table{
            width: 100%;
            border-collapse: collapse;
        }

        table caption{
            font-size: 2em;
            font-weight: bold;
            margin: 1em 0;
        }

        th,td{
            border: 1px solid #999;
            text-align: center;
            padding: 20px 0;
        }

        table thead tr{
            background-color: #008c8c;
            color: #fff;
        }

        table tbody tr:nth-child(odd){
            background-color: #eee;
        }

        table tbody tr:hover{
            background-color: #ccc;
        }

        table tbody tr td:first-child{
            color: #f40;
        }

        table tfoot tr td{
            text-align: right;
            padding-right: 20px;
        }
    </style>
</head>
<body>


<form action="user_search.jsp" method="post">
    <td>用户查询:<input type="text" name="userid" placeholder="请输入用户账号">
        <input type="submit" value="查询">
    </td>
</form>
<td><a href="user_add.jsp">增加用户</a>,<a href="javascript: window.history.go(-1)">返回主页</a> </td>
<table border="1">
    <caption>用户信息</caption>
    <tr>
        <th>账号</th>
        <th>密码</th>
        <th>邮箱</th>
        <th>借书数量</th>
        <th>是否为管理员</th>
        <th>操作</th>
    </tr>

    <%
        UserDao dao = new UserDaoImpl();
        List<User> list = dao.getAllUser();
        for(User user:list){
       %>
    <tr>
        <td><%=user.getUserid()%></td>
        <td><%=user.getPassword()%></td>
        <td><%=user.getEmail()%></td>
        <td><%=user.getBorrowNum()%></td>
        <td><%=(user.getIsadmin()==1)?"是":"否"%></td>
        <td><a href="user_updata.jsp?name=<%=user.getUserid()%>&password=<%=user.getPassword()%>&email=<%=user.getEmail()%>&borrowNum=<%=user.getBorrowNum()%>&isadmin=<%=user.getIsadmin()%>">修改</a>、
            <a href="user_delete.jsp?name=<%=user.getUserid()%>">删除</a></td>
<%--        <td>--%>
<%--            <button type="submit" onclick='request.getRequestDispatcher("user_updata.jsp").forward(request,response)'>修改</button>--%>
<%--        </td>--%>
    </tr>
    <%
        }
       %>
</table>
</body>
</html>
