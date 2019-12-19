<%@ page import="vo.Profile" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/19
  Time: 22:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查看个人资料</title>
</head>
<body>
<% Profile profile=(Profile) session.getAttribute("alterProfile"); %>
<form method="post" action="./alterAccountInfo">
    <table>
        <tr>
            <td>昵称:</td><td><input type="text" name="nickname" value="<%=profile.getNickname()%>"/></td>
        </tr>
        <tr>
            <td>电话:</td><td><input type="text" name="telephone" value="<%=profile.getTelephone()%>"/></td>
        </tr>
        <tr>
            <td>QQ:</td><td><input type="text" name="qq" value="<%=profile.getQq()%>"/></td>
        </tr>
        <tr>
            <td>工作:</td><td><input type="text" name="job" value="<%=profile.getJob()%>"/></td>
        </tr>
        <tr>
            <td>性别:</td>
            <td>
                <input type="radio" name="sex" value="1" <% if(profile.getSex()==1){ %> checked <%}%> />男
                <input type="radio" name="sex" value="0" <% if(profile.getSex()==0){ %> checked <%}%> />女
            </td>
        </tr>
        <tr>
            <td>积分:</td><td><input type="text" name="points" value="<%=profile.getPoints()%>"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="修改"/></td><td><input type="reset" value="还原"/></td>
        </tr>
    </table>
</form>

<a href="">返回</a>
</body>
</html>
