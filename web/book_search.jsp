<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="object.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 14:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查询图书信息</title>
</head>
<body>
<a href="javascript: window.history.go(-1)">返回上一级</a>
<%
    request.setCharacterEncoding("UTF-8");
    Object[] book_inf = new Object[1];
    book_inf[0] = request.getParameter("book");
    BookDao dao = new BookDaoImpl();
    String sql_bookid = "select * from book where bookid = ?";
    String sql_bookname = "select * from book where bookname = ?";
    String sql_author = "select * from book where author = ?";
    List<Book> list_bookid = dao.select(sql_bookid,book_inf);
    List<Book> list_bookname= dao.select(sql_bookname,book_inf);
    List<Book> list_author = dao.select(sql_author,book_inf);
    if(list_author.isEmpty()&&list_bookid.isEmpty()&&list_bookname.isEmpty()){
        out.print("<script>alert('查无此类书');location.href='admin_book_manager.jsp'</script>");
    }else{

%>
<table border="1">
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
        List<Book> list = new ArrayList<>();
        list.addAll(list_author);
        list.addAll(list_bookid);
        list.addAll(list_bookname);
        for (Book book:list){
    %>
    <tr>
        <td><%=book.getBookid()%></td>
        <td><%=book.getBookname()%></td>
        <td><%=book.getAuthor()%></td>
        <td><%=book.getPublish()%></td>
        <td><%=book.getPrice()%></td>
        <td><%=book.isHaslent()%></td>
        <td><%=book.getReaderid()%></td>
        <td><%=book.getBorrowDate()%></td>
        <td><%=book.getDeadline()%></td>
        <td><a href="book_updata.jsp?id=<%=book.getBookid()%>&name=<%=book.getBookname()%>&author=<%=book.getAuthor()%>&publish=<%=book.getPublish()%>&price=<%=book.getPrice()%>&haslent=<%=book.isHaslent()%>&readerid=<%=book.getReaderid()%>&borrowDate=<%=book.getBorrowDate()%>&deadline=<%=book.getDeadline()%>">修改</a>、
            <a href="book_delete.jsp?id=<%=book.getBookid()%>">删除</a></td>
        <%--        <td><a href="book_updata.jsp" onclick=<jsp:useBean id="" />></a></td>--%>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
