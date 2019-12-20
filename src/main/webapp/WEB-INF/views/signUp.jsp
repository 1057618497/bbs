<%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/11
  Time: 21:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form method="post" action="/bbs/checkSignUp">

    用户名<input type="text" name="username"/><br>
    密码<input type="text" name="password" /><br>
    昵称<input type="text" name="nickname"/><br>
    电话号码<input type="text" name="telephone"/><br>
    qq<input type="text" name="qq"/><br>
    工作<input type="text" name="job"/><br>
    性别<input type="radio" name="sex" value="1" checked/>男
    <input type="radio" name="sex" value="0"/>女<br>
    <%
        if(session.getAttribute("ERROR")!=null) {
            String error = (String) session.getAttribute("ERROR");
    %>
    <p><label>错误提示：<%=error%></label></p>
    <%
            session.setAttribute("ERROR",null);
        }
    %>
        <input type="submit" value="注册"/>
        <input type = "reset" value="清空"/>
</form>

<a href="/bbs/account/login">返回登录</a>
</body>
</html>
