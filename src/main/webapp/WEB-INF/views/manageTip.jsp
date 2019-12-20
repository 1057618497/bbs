<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Topic" %>
<%@ page import="dao.ITopicDao" %>
<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/17
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子管理</title>
</head>
<body>
<%
    ArrayList<Topic> topics=new ArrayList<Topic>();
    topics=(ArrayList<Topic>)session.getAttribute("topics");
%>
<form>
    <table border="1px">
        <tr>
            <td>主帖id</td>
            <td>帖子标题</td>
            <td>回复数</td>
            <td>查看数</td>
            <td>加精和置顶操作</td>
            <td>修改操作</td>
            <td>删除操作</td>
        </tr>
        <%
            for(int i=0;i<topics.size();i++){
                Topic topic1=topics.get(i);

        %>
        <tr>
            <td>
             <%=topic1.getTid()%>
            </td>
            <td>
                <%=topic1.getTitle()%>
            </td>
            <td>
                <%=topic1.getReplyNum()%>
            </td>
            <td>
                <%=topic1.getClickNum()%>
            </td>
            <td>
                <a href="/bbs/manageJing?Tid=<%=topic1.getTid()%>">设置加精和置顶</a>
            </td>

            <td>
                <a href="/bbs/Tchange?Tid=<%=topic1.getTid()%>">修改该帖</a>
            </td>
            <td>
                <a href="/bbs/deleteTopic?Tid=<%=topic1.getTid()%>">删除该帖</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</form>
<hr/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
