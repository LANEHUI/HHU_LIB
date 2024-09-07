<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改用户信息</title>
</head>
<body>
<a href="javascript: window.history.go(-1)">返回主页</a>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String borrowNum = request.getParameter("borrowNum");
    String isadmin = request.getParameter("isadmin");
%>
<form action="user_updata_do.jsp" method="post">
    <div>
        <tr>
            <label>账号：</label>
            <input type="text" name="username" value=<%=name%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>密码：</label></td>
            <input type="text" name="password" value=<%=password%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>邮箱：</label>
            <input type="text" name="email" value=<%=email%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>借书数目：</label>
            <input type="text" name="borrowNum" value=<%=borrowNum%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>是否管理员：</label>
            <input type="text" name="isadmin" value=<%=isadmin%>>
        </tr>
    </div>

    <div id="submitbtn">
        <tr>
            <button type="submit" onclick="return checkForm()">确认</button>
            <button type="reset">重置</button>

        </tr>
    </div>
</form>
</body>
</html>
