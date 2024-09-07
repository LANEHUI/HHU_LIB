<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="dao.BookDaoImpl" %>
<%@ page import="object.Book" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.util.Calendar" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>还书</title>
</head>
<body>
<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取借书的人的id
    String readerid = request.getParameter("userid");
    String id = request.getParameter("id");


    //引入数据交互层
    UserDao userDao = new UserDaoImpl();
    BookDao bookDao=new BookDaoImpl();
    Book book=new Book();



    User user=userDao.getUser(readerid);//读者
    user.setBorrowNum(user.getBorrowNum()+1);//借书数+1
    userDao.updateUser(user);//更新


    Calendar now = Calendar.getInstance();
    now.add(Calendar.DAY_OF_MONTH, 30);
    String endDate = new SimpleDateFormat("yyyy-MM-dd").format(now.getTime());



    Book book1=bookDao.getBook(id);//
    book1.setReaderid(readerid);
    book1.setHaslent(true);

    Date date = new Date();


    book1.setBorrowDate(date);
    book1.setDeadline(now.getTime());
    boolean flag= bookDao.updateBook(book1);
   /* book.setBorrowDate(date1);
    book.setHaslent(Integer.parseInt(request.getParameter("haslent")));
    book.setReaderid("0");
    book.setPrice(Double.valueOf(request.getParameter("Price")));
    book.setDeadline(date2);
    book.setPublish(request.getParameter("publish"));
*/



    if (flag) {
        request.setAttribute("user",user);
        request.getRequestDispatcher("user_home.jsp").forward(request, response);

    } else {
        out.println(0);
    }

%>
</body>
</html>