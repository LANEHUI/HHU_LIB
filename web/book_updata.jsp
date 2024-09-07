<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 15:10
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
    String bookid = request.getParameter("id");
    String bookname = request.getParameter("name");
    String author = request.getParameter("author");
    String publish = request.getParameter("publish");
    String price = request.getParameter("price");
    String haslent = request.getParameter("haslent");
    String readerid = request.getParameter("readerid");
    String borrowDate = request.getParameter("borrowDate");
    String deadline = request.getParameter("deadline");
%>
<form action="book_updata_do.jsp" method="post">
    <div>
        <tr>
            <label>图书编号：</label>
            <input type="text" name="bookid" value=<%=bookid%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>书名：</label></td>
            <input type="text" name="bookname" value=<%=bookname%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>作者：</label>
            <input type="text" name="author" value=<%=author%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>出版社：</label>
            <input type="text" name="publish" value=<%=publish%> >
        </tr>
    </div>
    <div>
        <tr>
            <label>价格：</label>
            <input type="text" name="price" value=<%=price%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>借阅状况：</label>
            <input type="text" name="haslent" value=<%=haslent%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>读者账号：</label>
            <input type="text" name="readerid" value=<%=readerid%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>借出时间：</label>
            <input type="text" name="borrowDate" value=<%=borrowDate%>>
        </tr>
    </div>
    <div>
        <tr>
            <label>截止时间：</label>
            <input type="text" name="deadline" value=<%=deadline%>>
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
