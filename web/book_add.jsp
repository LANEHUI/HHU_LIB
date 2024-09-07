<%--
  Created by IntelliJ IDEA.
  User: 26396
  Date: 2023/6/29
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增图书</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        h4 {
            text-align: center;
            color: red;
        }

        body {
            background-color: cornsilk;
        }

        div {
            text-align: center;
        }

        #before {
            text-align: center;
        }

    </style>
</head>
<body>
<h1>新增图书</h1>
<hr>

<div id="before">
    <a href="javascript: window.history.go(-1)">返回上一级</a>
</div>
</br>

<form action="book_add_do.jsp" method="post" >
    <div>
        <tr>
            <label>图书编号：</label>
            <input type="text" name="bookid" >
        </tr>
    </div>
    <div>
        <tr>
            <label>书名：</label></td>
            <input type="text" name="bookname" >
        </tr>
    </div>
    <div>
        <tr>
            <label>作者：</label>
            <input type="text" name="author" >
        </tr>
    </div>
    <div>
        <tr>
            <label>出版社：</label>
            <input type="text" name="publish" >
        </tr>
    </div>
    <div>
        <tr>
            <label>价格：</label>
            <input type="text" name="price" >
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
