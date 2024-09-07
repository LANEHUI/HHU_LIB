<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理注册</title>
</head>
<body>
<%
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");
        //获取register.jsp页面提交的账号和密码
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String relpassword = request.getParameter("relpassword");
        String email=request.getParameter("email");
        if(name.isEmpty()||password.isEmpty()||relpassword.isEmpty()||email.isEmpty()){
            out.print("<script>alert('输入不能为空');location.href='register.jsp'</script>");
        }
        else if(!password.equals(relpassword)){
            out.print("<script>alert('注册失败,两次密码不一致');location.href='register.jsp'</script>");
        }else {
            User user = new User();
            user.setBorrowNum(0);
            user.setUserid(name);
            user.setPassword(password);
            user.setEmail(email);
            user.setIsadmin(0);
            UserDao dao = new UserDaoImpl();
            List<User> list = dao.selectUser(name);
            if(!list.isEmpty()){
                out.print("<script>alert('账号已注册，请重新输入');location.href='register.jsp'</script>");
            }else{
                dao.register(user);
                response.sendRedirect("login.jsp");
                out.print("<script>alert('注册成功');location.href='login.jsp'</script>");
            }
        }

%>
</body>
</html>
