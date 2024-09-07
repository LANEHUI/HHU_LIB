<%@ page import="object.Book" %>
<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 19:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改用户信息</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String bookid = request.getParameter("bookid");
    String bookname = request.getParameter("bookname");
    String author = request.getParameter("author");
    String publish = request.getParameter("publish");
    String price = request.getParameter("price");
    String haslent = request.getParameter("haslent");
    String readerid = request.getParameter("readerid");
    String borrowDate = request.getParameter("borrowDate");
    String deadline = request.getParameter("deadline");
    if (bookid.isEmpty()||bookname.isEmpty()||author.isEmpty()||publish.isEmpty()
        ||price.isEmpty()||haslent.isEmpty()){
        out.print("<script>alert('输入不可为空');location.href='book_updata.jsp'</script>");
    }else{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Book book = new Book();
        book.setBookid(bookid);
        book.setBookname(bookname);
        book.setAuthor(author);
        book.setPublish(publish);
        book.setPrice(Double.parseDouble(price));
        book.setHaslent(Boolean.parseBoolean(haslent));
        book.setReaderid(readerid);
        try {
            if(borrowDate.equals("null")){
                book.setBorrowDate(null);
            }else{
                book.setBorrowDate(dateFormat.parse(borrowDate));
            }
            if(borrowDate.equals("null")){
                book.setDeadline(null);
            }else{
                book.setDeadline(dateFormat.parse(deadline));
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        BookDao dao = new BookDaoImpl();
        dao.updateBook(book);
        response.sendRedirect("admin_home.jsp");
    }


%>
</body>
</html>
