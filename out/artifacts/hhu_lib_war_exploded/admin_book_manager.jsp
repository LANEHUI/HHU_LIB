<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="object.Book" %>
<%@ page import="java.util.List" %><%--
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
    <title>图书管理</title>
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
<form action="book_search.jsp" method="post">
    <td>书本查询:<input type="text" name="book" placeholder="请输入书本编号或书名或作者">
        <input type="submit" value="查询">
    </td>
</form>
<td><a href="book_add.jsp">增加书本</a>,<a href="javascript: window.history.go(-1)">返回主页</a> </td>
<table border="1" align="center" cellspacing="0">
    <caption>书本信息</caption>
    <tr>
        <th>图书编号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版社</th>
        <th>价格</th>
        <th>借阅状态</th>
        <th>读者账号</th>
        <th>借出时间</th>
        <th>截止时间</th>
        <th>操作</th>
    </tr>
    <%
        BookDao dao = new BookDaoImpl();
        String sql = "select * from book";
        List<Book> list = dao.select(sql,null);
        for(Book book:list){
    %>
    <tr>
        <td><%=book.getBookid()%></td>
        <td><%=book.getBookname()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPublish()%></td>
        <td><%=book.getPrice()%></td>
        <td><%=(book.isHaslent())?"是":"否"%></td>
        <td><%=(book.getReaderid()==null)?"无":book.getReaderid()%></td>
        <td><%=(book.getBorrowDate()==null)?"无":book.getBorrowDate()%></td>
        <td><%=(book.getDeadline()==null)?"无":book.getDeadline()%></td>
        <td><a href="book_updata.jsp?id=<%=book.getBookid()%>&name=<%=book.getBookname()%>&author=<%=book.getAuthor()%>&publish=<%=book.getPublish()%>&price=<%=book.getPrice()%>&haslent=<%=book.isHaslent()%>&readerid=<%=book.getReaderid()%>&borrowDate=<%=book.getBorrowDate()%>&deadline=<%=book.getDeadline()%>">修改</a>、
            <a href="book_delete.jsp?id=<%=book.getBookid()%>">删除</a></td>
<%--        <td><a href="book_updata.jsp" onclick=<jsp:useBean id="" />></a></td>--%>
    </tr>
    <%
        }
    %>
</table>


</body>
</html>
