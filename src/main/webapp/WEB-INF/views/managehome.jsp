<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员页面</title>

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
<h3>欢迎来到管理者页面</h3>
<a href="/bbs/manageTip">查看所有主贴</a><hr/><br/>
<form name="idFind" action="/bbs/authoridFind" method="post">
    查找用户id:<input type="number" name="author_id"><br/>
    <input type="submit" value="查找">

</form>
</body>
</html>
