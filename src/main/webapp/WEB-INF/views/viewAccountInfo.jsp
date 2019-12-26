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
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common.css" >
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_forumdisplay.css">
    <title>查看个人资料</title>
    <style>
        table{margin: 0 auto;border: blue 1px solid;}
    </style>
</head>
<body  id="nv_forum" class="pg_forumdisplay">
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
    Profile profile=(Profile) session.getAttribute("alterProfile"); %>
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
            <td>积分:</td>
            <td> <input type="text"  disabled="true" value="<%=profile.getPoints()%>"/>
            <input type="hidden" name="points" value="<%=profile.getPoints()%>"/></td>
        </tr>
        <tr>
            <td><input type="submit" value="修改"/></td><td><input type="reset" value="还原"/></td>
        </tr>
    </table>
</form>

<div id="ft" class="wp cl">

    <div id="frt">
        <p>Powered by <strong>NCU</strong> </p>
    </div>
</div>
</body>
</html>
