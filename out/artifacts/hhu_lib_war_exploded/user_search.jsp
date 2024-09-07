<%@ page import="dao.UserDao" %>
<%@ page import="dao.UserDaoImpl" %>
<%@ page import="object.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 9:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <title>用户查询</title>
</head>
<body>
<%
    String userid = request.getParameter("userid");
    UserDao dao = new UserDaoImpl();
    List<User> list = dao.selectUser(userid);
    if(list.isEmpty()){
        out.print("<script>alert('查无此用户');location.href='admin_user_manager.jsp'</script>");
    }else{
        User user = list.get(0);
%>
<a href="javascript: window.history.go(-1)">返回主页</a>
<table border="1">
    <caption>用户信息</caption>
    <tr>
    <th>账号</th>
    <th>密码</th>
    <th>邮箱</th>
    <th>借书数量</th>
    <th>是否为管理员</th>
        <th>操作</th>
    </tr>

<tr>
    <td><%=user.getUserid()%></td>
    <td><%=user.getPassword()%></td>
    <td><%=user.getEmail()%></td>
    <td><%=user.getBorrowNum()%></td>
    <td><%=user.getIsadmin()==1%></td>
    <td><a href="user_updata.jsp?name=<%=user.getUserid()%>&password=<%=user.getPassword()%>&email=<%=user.getEmail()%>&borrowNum=<%=user.getBorrowNum()%>&isadmin=<%=user.getIsadmin()%>">修改</a>、
    <a href="user_delete.jsp?name=<%=user.getUserid()%>">删除</a></td>
</tr>
<%
    }
%>
</table>
</body>
</html>
