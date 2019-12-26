<%--
  Created by IntelliJ IDEA.
  User: 87447
  Date: 2019/12/18
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.Topic" %>
<%@ page import="vo.Reply" %>
<%@ page import="dao.ITopicDao" %>
<html>
<head>
    <title>用户author_id对应的帖子</title>
</head>
<body>
<%
    int author_id=(int)session.getAttribute("author_id");

    ArrayList<Topic> topics=new ArrayList<Topic>();
    ArrayList<Reply> replys=new ArrayList<>();
    topics=(ArrayList<Topic>)session.getAttribute("topics");
    replys=(ArrayList<Reply>)session.getAttribute("replys");
%>
<p>返回id为<%=author_id%>的用户信息成功</p><hr/><br/>
<a href="/bbs/deleteAllT?author_id=<%=author_id%>">一键将用户所有主帖删除</a><br/>
<a href="/bbs/deleteAllR?author_id=<%=author_id%>">一键将用户所有回帖删除</a><br/>
<h3>该用户的主贴</h3>
<form>
    <table border="1px">
        <tr>
            <td>主帖id</td>
            <td>帖子标题</td>
            <td>回复数</td>
            <td>查看数</td>
        </tr>
        <%
            if(topics.size()==0){
        %>
        <p>该用户没有主贴</p><br/>
        <%
            }
            else{
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
                <a href="">删除该帖</a>
            </td>
        </tr>
        <%
            }
            }
        %>

    </table>
</form>
<form>
    <%
        if(replys.size()==0){

    %>
    <p>该用户没有回帖</p><br/>
    <%
    }
    else{
    %>
    <h3>该用户的回帖</h3>
    <table border="1px">
        <tr>
            <td>回帖id</td>
            <td>回帖人id</td>
            <td>回帖时间</td>
            <td>回帖内容</td>
            <td>加精和置顶操作</td>
            <td>修改操作</td>
            <td>删除操作</td>
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
                <a href="/bbs/deleteReply">删除该回帖(删楼)</a>
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
