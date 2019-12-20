<%@ page import="vo.Account" %>
<%@ page import="vo.Profile" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/16
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员查看用户信息</title>
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_common.css">
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_8_forum_index.css">
    <link media="all" href="/bbs/css/style.css" type="text/css" rel="stylesheet">
    <style>
        table{margin:0 auto;}
        .td1{text-align: center;}
        .input1{margin: 0 10px;}
        p{text-align: center}
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

<!-- 转跳栏  -->
<div id="pt">
    <div class="z"> <a href="./adminHome" title="首页">首页</a><em>&raquo;</em><a href="./accountManage">用户管理</a><em>&raquo;</em>用户信息</div>
</div>

<%
    Account account1=(Account)session.getAttribute("Account");
    if(account1==null){
%>
<p>查询失败，该用户不存在！</p>
<%
    }else{
        Profile profile=(Profile)session.getAttribute("Profile");
%>
<form method="post" action="<%="./adminEditProfile?id="+account1.getId() %>">
    <table>
        <tr>
            <td>用户id:</td><td><label><%=account1.getId()%></label></td>
        </tr>
        <tr>
            <td>用户名:</td><td><input type="text" name="name" value="<%=account1.getName()%>"/></td>
        </tr>
        <tr>
            <td>密码:</td><td><input type="text" name="password" value="<%=account1.getPassword()%>"/></td>
        </tr>
        <tr>
            <td>昵称:</td><td><input type="text" name="nickname" value="<%=profile.getNickname()%>"/></td>
        </tr>
        <tr>
            <td>电话:</td><td><input type="text" name="telephone" value="<%=profile.getTelephone()%>"/></td>
        </tr>
        <tr>
            <td>QQ:</td><td><input type="text" name="qq" value="<%=profile.getQq()%>"/></td>
        </tr>
        <tr>
            <td>工作:</td><td><input type="text" name="job" value="<%=profile.getJob()%>"/></td>
        </tr>
        <tr>
            <td>性别:</td>
            <td>
                <input type="radio" name="sex" value="1" <% if(profile.getSex()==1){ %> checked <%}%> />男
                <input type="radio" name="sex" value="0" <% if(profile.getSex()==0){ %> checked <%}%> />女
            </td>
        </tr>
        <tr>
            <td>积分:</td><td><input type="text" name="points" value="<%=profile.getPoints()%>"/></td>
        </tr>
        <tr>
            <td class="td1" colspan=2><input class="input1" type="submit" value="修改"/><input class="input1" type="reset" value="重置"/></td>
        </tr>
    </table>
</form>
<br>
<p><a href="<%="./adminDeleteAccount?id="+account1.getId() %>">删除该用户</a></p><br>
<%
    }
    session.setAttribute("Account",null);//将account清空
    session.setAttribute("Profile",null);//将account清空
%>
<p><a href="./accountManage">返回用户管理页面</a></p>

<!--页脚-->
<div id="ft">
    <div class="div1">  <!-- 页脚居中 -->
        <p><strong><a href="./adminHome">BBS论坛管理员主页面</a></strong></p>
        <p class="xs0">Copyright &copy; 2019 by 201016.<span id="debuginfo"> </span> </p>
    </div>
</div>
</body>
</html>
