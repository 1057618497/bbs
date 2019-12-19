<%@ page import="vo.Account" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/15
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BBS论坛管理员主页</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_common.css">
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_forum_index.css">
    <style>
        .div1{text-align: center;}
    </style>
</head>

<body>
<!-- head  -->
<div id="hd">
<%  Account account=(Account) session.getAttribute("adminAccount");
    if(account==null){%>
    <form method="post" autocomplete="off" id="lsform" action="/bbs/checkAdminLogin">
        <div class="fastlg cl"> <!-- 支撑head区域  -->
            <div class="y pns"> <!-- 使得登录栏在右边  -->
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td> <label class="ftid" for="ls_username" id="ls_fastloginfield">用户名</label></td>
                        <td><input type="text" name="username" id="ls_username" autocomplete="off" class="px vm" tabindex="901"></td>
                        <td class="fastlg_l"><label for="ls_cookietime"><input type="checkbox" id="ls_cookietime" class="pc" tabindex="903">记住密码</label></td>
                    </tr>
                    <tr>
                        <td><label for="ls_password" class="z psw_w">密码</label></td>
                        <td><input type="password" name="password" id="ls_password" class="px vm" autocomplete="off" tabindex="902"></td>
                        <td class="fastlg_l"><button type="submit" class="pn vm" tabindex="904" style="width: 80px;"><em>登录</em></button></td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
<% }else{ %>
    <div class="fastlg cl"> <!-- 支撑head区域  -->
        <div class="y pns"> <!-- 使得登录栏在右边  -->
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td><label class="ftid" for="ls_username" id="ls_fastloginfield">管理员:</label></td>
                    <td><label class="ftid" for="ls_username" id="ls_fastloginfield"><%=account.getName()%></label></td>
                    <td><a href="./adminExit" class="pn vm" tabindex="904" style="width: 75px;"><em>退出</em></a></td>
                </tr>
            </table>
        </div>
    </div>
    <% } %>
</div>

<!-- 转跳栏  -->
<div id="pt" class="bm cl"> <div class="z"> <a href="./adminHome" title="管理员首页">首页</a></div> </div>

<!-- 站务管理  -->
<div class="fl bm">
    <div class="bm bmw  cl">
        <div class="bm_h cl"> <h2><a href="">站务管理</a></h2> </div>
        <div id="category_61" class="bm_c">
            <table cellspacing="0" cellpadding="0" class="fl_tb">
                <tr>
                    <td class="fl_icn"><a href="./accountManage"><img src="images/forum.gif" alt="用户管理"></a></td>
                    <td> <h2><a href="./accountManage">用户管理</a></h2> </td>
                </tr>

                <tr class="fl_row">
                    <td class="fl_icn"><a href=""><img src="images/forum_new.gif" alt="帖子管理"></a></td>
                    <td> <h2><a href="">帖子管理</a></h2> </td>
                </tr>
            </table>
        </div>
    </div>
</div>

<!--页脚-->
<div id="ft">
    <div class="div1">  <!-- 页脚居中 -->
        <p><strong><a href="./adminHome">BBS论坛管理员主页面</a></strong></p>
        <p class="xs0">Copyright &copy; 2019 by 201016.<span id="debuginfo"> </span> </p>
    </div>
</div>

</body>
</html>
