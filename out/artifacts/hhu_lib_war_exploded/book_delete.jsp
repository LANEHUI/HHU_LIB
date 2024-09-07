<%@ page import="dao.BookDao" %>
<%@ page import="dao.BookDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 19:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>删除图书信息</title>
</head>
<body>
<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    //获取admin-user-manager.jsp页面的userid
    String bookid = request.getParameter("id");


    //引入数据交互层
    BookDao dao = new BookDaoImpl();
    // 获取删除用户的信息

    boolean flag = dao.deleteBook(bookid);
    if (flag) {
        response.sendRedirect("admin_home.jsp");
    } else {
        out.println(0);
    }

%>

</body>
</html>
