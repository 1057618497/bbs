<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除所有回帖</title>
</head>
<body>
<%
    int id=(int)session.getAttribute("id");
%>
<h3>删除用户id为<%=id%>的回贴成功</h3><hr/>
<a href="/bbs/authoridFind?author_id=<%=id%>">返回</a><br/><hr/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
