<%@ page import="object.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDaoImpl" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 15:42
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
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");
    //获取register.jsp页面提交的账号和密码
    String name=request.getParameter("username");
    String password=request.getParameter("password");
    String email=request.getParameter("email");
    String isadmin = (request.getParameter("isadmin").equals("是"))?"1":"0";
    String borrowNum = request.getParameter("borrowNum");
    User user = new User();
    user.setBorrowNum(Integer.parseInt(borrowNum));
    user.setUserid(name);
    user.setPassword(password);
    user.setEmail(email);
    user.setIsadmin(Integer.parseInt(isadmin));
    UserDao dao = new UserDaoImpl();
    dao.updateUser(user);
    out.print("<script>alert('增加成功');location.href='user_add.jsp'</script>");
    response.sendRedirect("admin_home.jsp");

%>
</body>
</html>
