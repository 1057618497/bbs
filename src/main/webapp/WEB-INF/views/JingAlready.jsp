<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 21:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设置加精和置顶完成</title>
</head>
<body>
<%
    int Tid=(int)session.getAttribute("Tid");
%>
<h3>设置id为<%=Tid%>的帖子加精和置顶操作成功</h3><br/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
