<%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/15
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录页面</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/login.css"/>
    <script type="text/javascript" src="/bbs/js/login.js"></script>
</head>
<body>
<div id="login_frame">

    <form method="post" action="/bbs/checkAdminLogin">

        <p><label class="label_input">用户名</label><input type="text" name="username" class="text_field"/></p>
        <p><label class="label_input">密码</label><input type="password" name="password" class="text_field"/></p>
        <%
            if(session.getAttribute("ERROR")!=null) {
                String error = (String) session.getAttribute("ERROR");
        %>
        <p><label>错误提示：<%=error%></label></p>
        <%
                session.setAttribute("ERROR",null);
            }
        %>
        <div id="login_control">
            <input type="submit" id="btn_login" value="登录"/>
            <input type = "reset" id="btn_clear" value="清空"/>
        </div>
    </form>
</div>
</body>
</html>
