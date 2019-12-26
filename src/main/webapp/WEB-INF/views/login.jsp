<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/login.css"/>
    <script type="text/javascript" src="/bbs/js/login.js"></script>
    <style>
        #btn_login {width: 100px;}
        #btn_clear {width: 100px;}
    </style>
</head>
<body>
<div id="login_frame">

    <form method="post" action="/bbs/checkLogin">
        <p><label class="label_input">用户名</label><input type="text" name="username" class="text_field"/></p>
        <p><label class="label_input">密码</label><input type="password" name="password" class="text_field"/></p>
        <%
            if(session.getAttribute("ERROR")!=null) {
                String error = (String) session.getAttribute("ERROR");
        %>
        <script>alert("<%=error%>");</script>
        <%
                session.setAttribute("ERROR",null);
            }
        %>
        <div id="login_control">
            <button type="submit" id="btn_login">登录</button>
            <button type="reset" id="btn_clear" >清空</button>
            <label id="btn_clear"><a href="/bbs/account/signUp">注册</a></label>
        </div>
    </form>
</div>
</body>
</html>
 
