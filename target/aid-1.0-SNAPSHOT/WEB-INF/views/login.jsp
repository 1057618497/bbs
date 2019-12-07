<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/4
  Time: 14:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<body>
    <table>
        <form action="loginAction" method="post">
            <tr>
                <td>登录名:</td>
                <td><input type="text" name="name" value="test"></td>
            </tr>
            <tr>
                <td>密码:</td>
                <td><input type="password" name="password" value="test"></td>
            </tr>
            <tr>

                <td colspan="2"><input type="submit"  value="登录"></td>
            </tr>
        </form>

    </table>
</body>
</html>
