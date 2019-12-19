<%@ page import="vo.Account" %>
<%@ page import="vo.Profile" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/16
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员查看用户信息</title>
</head>
<body>
<%
    Account account=(Account)session.getAttribute("Account");
    if(account==null){
%>
<p>查询失败，该用户不存在！</p>
<%
    }else{
        Profile profile=(Profile)session.getAttribute("Profile");
%>
<form method="post" action="<%="./adminEditProfile?id="+account.getId() %>">
    用户名:<input type="text" name="name" value="<%=account.getName()%>"/><br>
    密码:<input type="text" name="password" value="<%=account.getPassword()%>"/><br>
    昵称:<input type="text" name="nickname" value="<%=profile.getNickname()%>"/><br>
    电话:<input type="text" name="telephone" value="<%=profile.getTelephone()%>"/><br>
    QQ:<input type="text" name="qq" value="<%=profile.getQq()%>"/><br>
    工作:<input type="text" name="job" value="<%=profile.getJob()%>"/><br>
    性别:<input type="radio" name="sex" value="1" <% if(profile.getSex()==1){ %> checked <%}%> />男
    <input type="radio" name="sex" value="0" <% if(profile.getSex()==0){ %> checked <%}%> />女<br>
    积分:<input type="text" name="points" value="<%=profile.getPoints()%>"/><br>
    <input type="submit" value="修改"/>
    <input type="reset" value="重置"/>
</form>
<a href="<%="./adminDeleteAccount?id="+account.getId() %>">删除该用户</a><br>
<%
    }
    session.setAttribute("Account",null);//将account清空
    session.setAttribute("Profile",null);//将account清空
%>
<a href="./accountManage">返回用户管理页面</a>
</body>
</html>
