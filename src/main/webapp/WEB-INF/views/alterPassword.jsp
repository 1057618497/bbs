<%@ page import="vo.Account" %><%--
  Created by IntelliJ IDEA.
  User: 星 尘
  Date: 2019/12/19
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改密码</title>
    <style>
        .td1{text-align: center;}
        table{margin: 0 auto;border: blue 1px solid;}
    </style>
</head>
<body>

<div>
    <%
        if(session.getAttribute("Prompt")!=null) {
            String prompt = (String) session.getAttribute("Prompt");
    %>
    <script type="text/javascript" language="javascript">
        alert("<%=prompt%>");                                            // 弹出错误信息
    </script>
    <%
            session.setAttribute("Prompt",null);
        }
        Account account=(Account)session.getAttribute("alterPasswordAccount"); %>
    <form method="post" action="./alterPassword">
        <table>
            <tr>
                <td>用户id:</td><td><%=account.getId()%></td>
            </tr>

            <tr>
                <td>用户名:</td><td><input type="text" name="name" value="<%=account.getName()%>"/></td>
            </tr>

            <tr>
                <td>密码:</td><td><input type="text" name="password" value="<%=account.getPassword()%>"/></td>
            </tr>

            <tr>
                <td><input type="submit" value="修改"/></td><td><input type="reset" value="还原"/></td>
            </tr>
        </table>
    </form>
    <a href="">返回</a>
</div>
</body>
</html>
