<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>设置加精和置顶</title>

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
<form name="Jing" action="/bbs/JingAlready",method="post">
    加精: <input type="radio" name="jing" value="1" checked="checked">是
    <input type="radio" name="jing" value="0">否
    <hr/>
    置顶: <input type="radio" name="add_top" value="1" checked="checked">是
    <input type="radio" name="add_top" value="0">否
    <br/>
    <input type="submit" value="提交">
</form>
</body>
</html>
