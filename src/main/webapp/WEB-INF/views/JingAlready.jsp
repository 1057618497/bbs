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
    int Tid=(int)session.getAttribute("Tid");
%>
<h3>设置id为<%=Tid%>的帖子加精和置顶操作成功</h3><br/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
