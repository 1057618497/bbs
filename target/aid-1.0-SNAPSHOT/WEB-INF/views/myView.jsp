<%@ page import="java.util.ArrayList" %>
<%@ page import="vo.*"%>
<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/18
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>我的帖子</title>
    <!-- Row Highlight Javascript -->
    <script>
        window.onload = function () {
            var tfrow = document.getElementById('tfhover').rows.length;
            var tbRow = [];
            for (var i = 1; i < tfrow; i++) {
                tbRow[i] = document.getElementById('tfhover').rows[i];
                tbRow[i].onmouseover = function () {
                    this.style.backgroundColor = '#f3f8aa';
                };
                tbRow[i].onmouseout = function () {
                    this.style.backgroundColor = '#ffffff';
                };
            }
        };
    </script>
    <style type="text/css">
        table.tftable {
            font-size: 12px;
            color: #333333;
            width: 100%;
            border-width: 1px;
            border-color: #729ea5;
            border-collapse:
                    collapse;
        }

        table.tftable th {
            font-size: 12px;
            background-color: #acc8cc;
            border-width: 1px;
            padding: 8px;
            border-style:
                    solid;
            border-color: #729ea5;
            text-align: left;
        }

        table.tftable tr {
            background-color: #ffffff;
        }

        table.tftable td {
            font-size: 12px;
            border-width: 1px;
            padding: 8px;
            border-style: solid;
            border-color: #729ea5;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common.css" >
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_forumdisplay.css">
</head>
<body id="nv_forum" class="pg_forumdisplay">
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="toptb" class="cl">
    <div class="wp">

        <p id="ttt">欢迎来到bbs</p>

    </div>
</div>
<div id="hd">
    <div class="wp">
        <div class="hdc cl">
            <h2><a href="./home" ><img  src="images/ncu.png"  height="80" width="80"  border="0" /></a>
            </h2>
            <div id="um">
                <div class="avt y"><a href="home.php?mod=space&amp;uid=3092991"><img
                        src="https://uc.discuz.net/data/avatar/003/09/29/91_avatar_small.jpg"
                        onerror="this.onerror=null;this.src='https://uc.discuz.net/images/noavatar_small.gif'" /></a></div>
                <p>
                    <strong class="vwmy"><a href="home.php?mod=space&amp;uid=3092991" target="_blank"
                                            title="访问我的空间">${userProfile.nickname}</a></strong>




                    <span class="pipe">|</span><a href="myView" id="myitem" class="showmenu"
                >我的帖子</a>
                    <span class="pipe">|</span><a href="home.php?mod=spacecp">设置</a>


                    <span class="pipe">|</span><a href="./account/exit">退出</a>
                </p>
                <p>
                    <a href="home" id="extcreditmenu"
                       class="showmenu">积分:${userProfile.points}</a>

                </p>
            </div>
        </div>
    </div>
</div>
<div id="nv">

    <ul>
        <li class="a" id="mn_forum"><a href="home" hidefocus="true" title="BBS">论坛首页<span>BBS</span></a></li>

    </ul>
</div>
<ul id="thread_types" class="ttp bm cl">
    <li id="ttp_all" class="xw1 a"><a href="./myView?type=topic">主贴[${tNum}]</a></li>
    <li><a href="./myView?type=draft">
        <font color="red">草稿[${dNum}]</font>
    </a></li>
    <li><a href="./myView?type=reply">回帖[${reNum}]</a></li>

</ul>
<div width="80%">
    <c:if test="${type=='topic'}">
    <table id="tfhover" class="tftable" border="1">
        <tr>
            <th>序号</th>
            <th>类型</th>
            <th>标题</th>
            <th>发布时间</th>
            <th>查看/回复</th>
            <th>操作</th>
        </tr>
        <C:forEach var="topic" items="${tList}" varStatus="t">
            <tr>
                <td>${t.count}</td>
                <td >
                    <c:if test="${topic.require==0}"><span  style="color:red">交流</span></c:if>
                    <c:if test="${topic.require==1&&topic.points!=-1}"><span style="color:blue">需求</span></c:if>
                    <c:if test="${topic.require==1&&topic.points==-1}"><span style="color:blue">已解决</span></c:if>
                </td>
                <td><a href="topic?tid=${topic.tid}">${topic.title}</a></td>
                <td>${topic.upTime}</td>
                <td>${topic.clickNum}/${topic.replyNum}</td>
                <td>
                    <a href="topic?tid=${topic.tid}">查看</a>
                    <c:if test="${topic.points!=-1}"><a href="./myView/modifyTopic?id=${topic.tid}">修改</a></c:if>
                    <a href="./myView/deleteTopic?id=${topic.tid}">删除</a>
                </td>
            </tr>
        </C:forEach>
    </table>
    </c:if>

    <c:if test="${type=='draft'}">
        <table id="tfhover" class="tftable" border="1">
            <tr>
                <th>序号</th>
                <th>标题</th>
                <th>保存时间</th>
                <th>操作</th>
            </tr>

            <C:forEach var="draft" items="${dList}" varStatus="t">
                <tr>
                    <td>${t.count}</td>
                    <td><a href="topic?tid=">${draft.title}</a></td>
                    <td>${draft.save_time}</td>
                    <td>
                        <a href="./myView/modifyDraft?id=${draft.did}">修改</a>
                        <a href="./myView/deleteDraft?did=${draft.did}">删除</a>
                    </td>
                </tr>
            </C:forEach>
        </table>
    </c:if>
    <c:if test="${type=='reply'}">
        <table id="tfhover" class="tftable" border="1">
            <tr>
                <th>序号</th>
                <th>回复内容</th>
                <th>回复时间</th>
                <th>操作</th>
            </tr>

            <C:forEach var="reply" items="${reList}" varStatus="t">
                <tr>
                    <td>${t.count}</td>
                    <td>${reply.content}</td>
                    <td>${reply.reTime}</td>
                    <td>
                        <a href="topic?tid=${reply.tid}">查看</a>
                        <a href="./myView/deleteReply?rid=${reply.rid}">删除</a>
                    </td>
                </tr>
            </C:forEach>
        </table>
    </c:if>
</div>
</body>
</html>
