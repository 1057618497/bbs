<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除回帖</title>
</head>
<body>
<%
    int rid=(int)session.getAttribute("rid");
%>
删除rid为<%=rid%>的回帖成功<br/><hr/>

<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
