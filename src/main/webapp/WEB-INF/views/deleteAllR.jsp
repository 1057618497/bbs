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

    <style>
        *{padding: 0px;
            margin: 0px;}
        .header{
            width:100%;
            height:200px;
            background:url("http://localhost:8080/bbs/images/timg.jpg");
            background-size:cover;
        }
        .headertext{
            font-size:50px; font-family:'微软雅黑'; text-align: center;
        }
        .thistable{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="header">
    <img src="images/ncu.png"  height="80" width="80" border="0">
    <h3 class="headertext">管 理 员 界 面</h3>
</div>
<%
    int id=(int)session.getAttribute("id");
%>
<h3>删除用户id为<%=id%>的回贴成功</h3><hr/>
<a href="/bbs/authoridFind?author_id=<%=id%>">返回</a><br/><hr/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
