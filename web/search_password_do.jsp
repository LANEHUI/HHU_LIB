<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/28
  Time: 15:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="object.User" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="java.util.List" %>
>

<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>处理找回密码</title>
</head>
<body>
<%
    User user=new User();
    //获取searchPassword.jsp页面提交的账号和密码
    String name=request.getParameter("name");
    String email = request.getParameter("email");
    user.setUserid(name);
    UserDao dao = new UserDaoImpl();
    List<User> list = dao.selectUser(name);
    if(list.isEmpty()){
        out.print("<script>alert('该账号不存在');location.href='search_password.jsp'</script>");
    }else if(!email.equals(list.get(0).getEmail())){
        out.print("<script>alert('邮箱不匹配');location.href='search_password.jsp'</script>");
    }else{
        request.setAttribute("list", list);
        request.getRequestDispatcher("search_password_info.jsp").forward(request, response);
    }

%>

</body>
</html>
