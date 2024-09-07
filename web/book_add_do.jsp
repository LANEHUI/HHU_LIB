<%@ page import="object.Book" %>
<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增图书</title>
</head>
<body>
<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    //获取register.jsp页面提交的账号和密码
    String bookid=request.getParameter("bookid");
    String bookname=request.getParameter("bookname");
    String author=request.getParameter("author");
    String publish = request.getParameter("publish");
    String price = request.getParameter("price");
    if(bookid.isEmpty()||bookname.isEmpty()||author.isEmpty()||publish.isEmpty()||price.isEmpty()){
        out.print("<script>alert('输入不可为空');location.href='book_add.jsp'</script>");
    }else{
        Book book = new Book();
        book.setBookid(bookid);
        book.setBookname(bookname);
        book.setAuthor(author);
        book.setPublish(publish);
        book.setPrice(Double.parseDouble(price));
        BookDao dao = new BookDaoImpl();
        Book book1 = dao.getBook(bookid);
        if(book1!=null){
            out.print("<script>alert('图书编号已存在请重新设定');location.href='book_add.jsp'</script>");
        }else{
            dao.addBook(book);
            out.print("<script>alert('增加成功');location.href='book_add.jsp'</script>");
            response.sendRedirect("admin_home.jsp");
        }

    }

%>
</body>
</html>
