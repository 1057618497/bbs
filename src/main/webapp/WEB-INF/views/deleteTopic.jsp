<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除主贴</title>
</head>
<body>
<%
    int Tid=(int)session.getAttribute("Tid");
%>
删除id为<%=Tid%>的主贴成功<br/><hr/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
