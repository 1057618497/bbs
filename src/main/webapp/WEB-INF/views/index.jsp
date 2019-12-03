<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/2
  Time: 11:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>查询所有的账户</h2>
<c:forEach items="${list}" var="account">
    ${account.name}
</c:forEach>
</body>
</html>
