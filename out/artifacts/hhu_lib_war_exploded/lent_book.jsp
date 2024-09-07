<%--
  Created by IntelliJ IDEA.
  User: 董自淇
  Date: 2023/6/29
  Time: 20:58
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
    <title>借书界面</title>
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
</div><table border="1">
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
        String readerid=request.getParameter("readerid");
        String sql = "select * from book where haslent = false";
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
<%--        <td><%=book.isHaslent()%></td>--%>
<%--        <td><%=book.getReaderid()%></td>--%>
<%--        <td><%=book.getBorrowDate()%></td>--%>
<%--        <td><%=book.getDeadline()%></td>--%>
        <td><a href="lend.jsp?id=<%=book.getBookid()%>&userid=<%=readerid%>&name=<%=book.getBookname()%>&author=<%=book.getAuthor()%>&publish=<%=book.getPublish()%>&price=<%=book.getPrice()%>&haslent=<%=book.isHaslent()%>&readerid=<%=book.getReaderid()%>&borrowDate=<%=book.getBorrowDate()%>&deadline=<%=book.getDeadline()%>">借阅</a>

    </tr>
        <%
        }
    %>
</body>
</html>
