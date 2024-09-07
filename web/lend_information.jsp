<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="object.Book" %>
<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 8:32
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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>借书记录</title>
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

<div id="before">
    <a href="javascript: window.history.go(-1)">返回主页</a>
</div>


<table border="1">

    <caption>借书信息</caption>
    <tr>
        <th>书本号</th>
        <th>书名</th>
        <th>作者</th>
        <th>出版商</th>
        <th>借书日期</th>
        <th>还书日期</th>
        <th>操作</th>
    </tr>
    <%
        BookDao dao = new BookDaoImpl();

        List<Book> list = dao.getAllBook(request.getParameter("userid"));
        for(Book book:list){
    %>
    <tr>
        <td><%=book.getBookid()%></td>
        <td><%=book.getBookname()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPublish()%></td>
        <td><%=book.getBorrowDate()%></td>
        <td><%=book.getDeadline()%></td>

        <td><a href="user_return.jsp?readerid=<%=book.getReaderid()%>&bookid=<%=book.getBookid()%>&bookname=<%=book.getBookname()%>&publish=
       <%=book.getPublish()%>&price=<%=book.getPrice()%>&borrowDate=<%=book.getBorrowDate()%>&deadline=<%=book.getDeadline()%>&author=<%=book.getAuthor()%>&haslent=<%=book.isHaslent()%>">还书</a>

    </tr>
    <%
        }
    %>
</table>

</body>
</html>
