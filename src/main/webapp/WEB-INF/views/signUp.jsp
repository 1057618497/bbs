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
    <meta http-equiv="Content-Type"; content="multipart/form-data; charset=utf-8"/>
    <meta charset="UTF-8">
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/login.css"/>
    <script type="text/javascript" src="/bbs/js/login.js"></script>
    <style>
        #btn_login {width: 100px;}
        #btn_clear {width: 100px;}
        login_frame{height: 300px}
        #login_frame{text-align: left;height: 360px;width: 380px}
    </style>
</head>
<body>
<div id="login_frame">
    <form method="post" action="/bbs/checkSignUp">
        <p><label class="label_input">用户名</label><input type="text" name="username" class="text_field"/></p>
        <p><label class="label_input">密码</label><input type="password" name="password" class="text_field"/></p>
        <p><label class="label_input">昵称</label><input type="text" name="nickname" class="text_field"/></p>
        <p><label class="label_input">电话号码</label><input type="text" name="telephone" class="text_field"/></p>
        <p><label class="label_input">QQ</label><input type="text" name="qq" class="text_field"/></p>
        <p><label class="label_input">工作</label><input type="text" name="job" class="text_field"/></p>
        <p><label class="label_input">性别</label><input type="radio" name="sex" value="1" checked/>男
            <input type="radio" name="sex" value="0"/>女</p>
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
            <button type="submit" id="btn_login">注册</button>
            <button type="reset" id="btn_clear" >清空</button>
            <label id="btn_clear"><a href="/bbs/account/login">登录</a></label>
        </div>
    </form>
</div>
</body>
</html>
