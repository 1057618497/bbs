<%@ page import="vo.Account" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/16
  Time: 7:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>BBS论坛用户管理</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_common.css">
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_forum_index.css">
    <link media="all" href="/bbs/css/style.css" type="text/css" rel="stylesheet">
    <style>
        .div1{text-align: center;}
    </style>
</head>

<body>
<!-- head -->
<div id="hd">  <!-- head的style，需要改背景图片 -->

    <%  Account account=(Account) session.getAttribute("adminAccount");
        if(account==null){%>
    <form method="post" autocomplete="off" id="lsform" action="/bbs/checkAdminLogin">
        <div class="fastlg cl"> <!-- 支撑head区域  -->
            <div class="y pns"> <!-- 使得登录栏在右边  -->
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td> <label class="ftid" for="ls_username" id="ls_fastloginfield">用户名</label></td>
                        <td><input type="text" name="username" id="ls_username" autocomplete="off" class="px vm" tabindex="901"></td>
                        <td class="fastlg_l"><label for="ls_cookietime"><input type="checkbox" id="ls_cookietime" class="pc">记住密码</label></td>
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

<!-- 搜索栏  -->
<div id="scbar" class="scbar_narrow cl">
    <form id="scbar_form" method="post" action="./adminViewAccountInfo" >
        <table cellspacing="0" cellpadding="0">
            <tr>
                <td class="">&nbsp;&nbsp;</td>
                <td class="scbar_txt_td"><input type="text" value="0" name="id" id="scbar_txt"></td>
                <td class="scbar_type_td"><label id="scbar_type" class="xg1">用户id</label></td>
                <td class="scbar_btn_td"><button type="submit" id="scbar_btn" sc="1" class="pn pnc"><strong class="xi2">搜索</strong></button></td>
                <td class="scbar_hot_td"> <div id="scbar_hot"></div></td>
            </tr>
        </table>
    </form>
</div>

<!-- 转跳栏  -->
<div id="pt"> <div class="z"> <a href="./adminHome" title="首页">首页</a><em>&raquo;</em><a href="./accountManage">用户管理</a></div> </div>

<!-- 用户管理  -->
<!-- div的宽度 .tab_choice默认100% -->
<style type="text/css">
    .tab_choice{width:100%;}
    .label1{color: #000;}
</style>

<div class="tab_choice">  <!-- div的宽度 -->
    <ul>
        <%
            List<Account> accounts=(List<Account>)session.getAttribute("Accounts");
            if(accounts.size()==0){ %>
        <li>&nbsp;&nbsp;<label class="label1">当前没有用户</label></li>
         <%   }%>
          <%
              for(int i=0;i<accounts.size();i++){
                account=accounts.get(i);
        %>
        <li class="topRank">
            <em><%=account.getId()%></em>&nbsp;&nbsp;<a href="<%="./adminViewAccountInfo?id="+account.getId()%>" title="<%=account.getName()%>" c="1"><%=account.getName()%></a>
        </li>
        <%
            }
        %>
    </ul>
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
