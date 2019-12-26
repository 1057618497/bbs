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
    <link type="text/css" rel="stylesheet" href="/bbs/css/manage.css"/>
    <title>帖子管理</title>
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
    ArrayList<Topic> topics=new ArrayList<Topic>();
    topics=(ArrayList<Topic>)session.getAttribute("topics");
%>
<div class="table_div">
    <div class="div_clear">
          <div class="left_top"></div>
          <div class="center_top">
          <div style="float:left">
          <img src="images/pin_1.gif" width="16px" height="16px" style="vertical-align:middle"/>
          <span style="font-weight:bold">你当前的位置</span>：[管理员]-[所有帖子]
          </div>
          <div style="float:right;padding-right:6px">
          <img width='16' height='16' src="images/add.gif" style="vertical-align:middle"/>
        <a href="#">新增</a>&nbsp;
          <img width='16' height='16' src="images/update.gif" style="vertical-align:middle"/>
        <a href="#">修改</a>&nbsp;
          <img width='16' height='16' src="images/delete.gif" style="vertical-align:middle"/>
        <a href="#">删除</a>
          </div>
          </div>
          <div class="right_top"></div>
          </div>
      <div class="div_clear">
      <div class="left_center"></div>
      <div class="center_center">
      <div class="table_content">
      <table cellspacing="0px" cellpadding="0px">
      <thead >
  <tr>
      <th width="20%">帖子标题</th>
      <th width="10%">回复数</th>
      <th width="10%">查看数</th>
      <th width="10%">更新时间</th>
      <th width="15%">帖子ID</th>
      <th wdith="35%" style="border-right:none">操作</th>
      </tr>
  </thead>
  <tbody>
<%
    for(int i=0;i<topics.size();i++){
        Topic topic1=topics.get(i);

%>
  <tr>
      <td width="20%"><%=topic1.getTitle()%></td>
      <td width="10%"><%=topic1.getReplyNum()%></td>
      <td width="10%"><%=topic1.getClickNum()%></td>
      <td width="10%"><%=topic1.getUpTime()%></td>
      <td width="15%"><%=topic1.getTid()%></td>
      <td width="35%" style="border-right:none">
      <img width='16' height='16' src="images/updateItem.gif" style="vertical-align:middle"/>
    <a href="/bbs/Tchange?Tid=<%=topic1.getTid()%>">修改</a>&nbsp;
      <img width='16' height='16' src="images/deleteItem.gif" style="vertical-align:middle"/>
    <a href="/bbs/deleteTopic?Tid=<%=topic1.getTid()%>">删除</a>&nbsp;
    <img width='16' height='16' src="images/updateItem.gif" style="vertical-align:middle"/>
    <a href="/bbs/manageJing?Tid=<%=topic1.getTid()%>">加精/置顶</a>
      </td>
      </tr>
<%
    }

%>
  </tbody>
      </table>
      </div>
      </div>
      <div class="right_center"></div>
      </div>
      <div class="div_clear">
      <div class="left_bottom"></div>
      <div class="center_bottom">
       <span>&nbsp;&nbsp;共有 <%=topics.size()%> 条记录，当前第 1/1 页</span>
       <div style="float:right;padding-right:30px">
       <input type="button" value="首页"/>
       <input type="button" value="上页"/>
       <input type="button" value="下页"/>
       <input type="button" value="尾页"/>
       <span>跳转到</span>
       <input type="text" size="1"/>
       <input type="button" value="跳转"/>
       </div>
      </div>
      <div class="right_bottom"></div>
      </div>
     </div>


<hr/>
<a href="/bbs/managehome">返回主页面</a>
</body>
</html>
