<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Topic" %>
<%@ page import="vo.Reply" %>
<%@ page import="dao.ITopicDao" %>
<html>
<head>
    <title>帖子修改</title>
</head>
<body>
<%
    ArrayList<Reply> replys=new ArrayList<Reply>();
    replys=(ArrayList<Reply>)session.getAttribute("replys");
    Topic topic =new Topic();
    topic =(Topic)session.getAttribute("topic");
%>
<form>
    <table border="1px">
        <tr>
            <td>主帖id</td>
            <td>帖子标题</td>
            <td>回复数</td>
            <td>查看数</td>
            <td>加精和置顶操作</td>
            <td>删除操作</td>
        </tr>
        <%
                Topic topic1=topic;

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
                <a href="/bbs/deleteTopic?Tid=<%=topic1.getTid()%>">删除该帖</a>
            </td>
        </tr>
    </table>
</form>
<form>
    <h3>该主贴下的所有回帖</h3><br/>
    <%
        if(replys.size()==0){
    %>
    <h3>该主贴下没有回帖!</h3>
    <%
        }
        else{
    %>
    <table border="1px">
        <tr>
            <td>回帖id</td>
            <td>回帖人id</td>
            <td>回帖时间</td>
            <td>回帖内容</td>
        </tr>
        <%
            for(int i=0;i<replys.size();i++){
            Reply reply1=replys.get(i);

        %>
        <tr>
            <td>
                <%=reply1.getRid()%>
            </td>
            <td>
                <%=reply1.getRidOfMan()%>
            </td>
            <td>
                <%=reply1.getReTime()%>
            </td>
            <td>
                <%=reply1.getContent()%>
            </td>
            <td>
                <a href="/bbs/deleteReply?rid=<%=reply1.getRid()%>">删除该回帖(删楼)</a>
            </td>
        </tr>
        <%
            }
            }
        %>
    </table>
</form>
</body>
</html>
