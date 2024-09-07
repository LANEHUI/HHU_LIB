<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/26
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>

<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
</head>
<body>
<%
    String name = request.getParameter("username");
    String password = request.getParameter("password");
    if(name.isEmpty()){
        out.print("<script>alert('请输入账号');location.href='login.jsp'</script>");
    }else if(password.isEmpty()){
        out.print("<script>alert('请输入密码');location.href='login.jsp'</script>");
    }else{
        UserDao dao = new UserDaoImpl();
        List<User> list = dao.selectUser(name);
        if(list.isEmpty()){
            out.print("<script>alert('账号不存在，请重新输入');location.href='login.jsp'</script>");
        }else if(!password.equals(list.get(0).getPassword())){
            out.print("<script>alert('密码错误');location.href='login.jsp'</script>");
        }else{
            User user = list.get(0);
            request.setAttribute("user",user);
            if(user.getIsadmin()==1){
                request.getRequestDispatcher("admin_home.jsp").forward(request, response);
            }else {
                request.getRequestDispatcher("user_home.jsp").forward(request, response);
            }
        }

    }
%>
</body>
</html>
