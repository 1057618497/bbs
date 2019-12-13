<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>登录页面</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/login.css"/>
    <script type="text/javascript" src="/bbs/js/login.js"></script>
</head>
<body>
<div id="login_frame">

    <form method="post" action="/bbs/checkLogin">

        <p><label class="label_input">用户名</label><input type="text" name="username" class="text_field"/></p>
        <p><label class="label_input">密码</label><input type="text" name="password" class="text_field"/></p>

        <div id="login_control">
          <input type="submit" id="btn_login" value="登录"/>
            <input type = "reset" id="btn_clear" value="清空"/>
        </div>
    </form>
</div>
</body>
</html>
 
