<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/5
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ page import="vo.*"%>

<%
    String topicURL="../topic?tid=";
    boolean login=false;
    if(session.getAttribute("AccountId")!=null)
        login=true;
%>


<head>

    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common.css" >
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_forumdisplay.css">

    <script src="js/common.js" type="text/javascript"></script>
    <meta name="application-name" content="Discuz! 官方站">
    <meta name="msapplication-tooltip" content="Discuz! 官方站">
    <meta name="msapplication-task"
          content="name=论坛首页;action-uri=https://www.discuz.net/forum.php;icon-uri=https://www.discuz.net/static/image/common/bbs.ico">
    <link rel="archives" title="Discuz! 官方站" href="css/null_022e53c8454240108cefef3a139ed2c6.">
    <script src="js/forum.js" type="text/javascript"></script>
    <script>
        function search() {
            searchform.submit();

        }
    </script>
</head>

<body id="nv_forum" class="pg_forumdisplay" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="toptb" class="cl">
    <div class="wp">

        <p id="ttt">欢迎来到bbs</p>

    </div>
</div>

<div id="hd">
    <div class="wp">
        <!--未登录-->

        <% if(!login){%>
        <div class="hdc cl">
            <h2><a href="./home" ><img src="images/ncu.png"  height="80" width="80" border="0"></a></h2>
            <script src="js/logging.js" type="text/javascript"></script>
            <form method="post" autocomplete="off" id="lsform"
                  action="/bbs/checkLogin"
                  onsubmit="return lsSubmit();">
                <div class="fastlg cl">
                    <span id="return_ls" style="display:none"></span>
                    <div class="y pns">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td> <span class="ftid"> <select name="fastloginfield" id="ls_fastloginfield" width="40"
                                                                 tabindex="900">
                          <option value="username">用户名</option>

                        </select> </span>
                                    <script type="text/javascript">
                                        simulateSelect('ls_fastloginfield')
                                    </script>
                                </td>
                                <td><input type="text" name="username" id="ls_username" autocomplete="off" class="px vm"
                                           tabindex="901"></td>
                                <td></td>
                                <td>&nbsp;
<%--                                    <a href="javascript:;"--%>
<%--                                             onclick="showWindow('login', 'member.php?mod=logging&amp;action=login&amp;viewlostpw=1')">找回密码</a>--%>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="ls_password" class="z psw_w">密码</label></td>
                                <td><input type="password" name="password" id="ls_password" class="px vm" autocomplete="off"
                                           tabindex="902"></td>
                                <td class="fastlg_l"><button type="submit" class="pn vm" tabindex="904"
                                                             style="width: 75px;"><em>登录</em></button></td>
                                <td>&nbsp;<a href="/bbs/account/signUp" class="xi2 xw1">立即注册</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="quickforward" value="yes">
                        <input type="hidden" name="handlekey" value="ls">
                    </div>
                    <div class="fastlg_fm y" style="margin-right: 10px; padding-right: 10px">
                        <p></p>
                    </div>
                </div>
            </form>
        </div>
        <%}%>
        <!--已登录-->
        <% if(login){%>
            <div class="hdc cl">
                <h2><a href="./home" ><img  src="images/ncu.png"  height="80" width="80"  border="0" /></a>
                </h2>
                <div id="um">
                    <div class="avt y"><a href="home.php?mod=space&amp;uid=3092991"><img
                            src="https://uc.discuz.net/data/avatar/003/09/29/91_avatar_small.jpg"
                            onerror="this.onerror=null;this.src='https://uc.discuz.net/images/noavatar_small.gif'" /></a></div>
                    <p>
                        <strong class="vwmy"><a href="myView" target="_blank"
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
        <%}%>

        <div id="nv">

            <ul>
                <li class="a" id="mn_forum"><a href="home" hidefocus="true" title="BBS">论坛首页<span>BBS</span></a></li>

            </ul>
        </div>


        <div id="scbar" class="cl">
            <form name="searchform" id="scbar_form" method="post" autocomplete="off" onsubmit="searchFocus($('scbar_txt'))"
                  action="search" target="_blank">
                <input type="hidden" name="mod" id="scbar_mod" value="search">
                <input type="hidden" name="formhash" value="eea16a10">
                <input type="hidden" name="srchtype" value="title">
                <input type="hidden" name="srhfid" value="2">
                <input type="hidden" name="srhlocality" value="forum::forumdisplay">
                <table cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="scbar_icon_td"></td>
                        <td class="scbar_txt_td"><input type="text" name="search" id="scbar_txt" value="请输入搜索内容"
                                                        autocomplete="off" x-webkit-speech speech></td>
                        <td class="scbar_type_td"><input type="submit" id="scbar_type" class="xg1" value="搜索"
                                                     hidefocus="true"></td>

                        <td class="scbar_hot_td">
                            <div id="scbar_hot">
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
        </div>
        <ul id="scbar_type_menu" class="p_pop" style="display: none;">
            <li><a href="javascript:;" rel="curforum" fid="2">本版</a></li>
            <li><a href="javascript:;" rel="user">用户</a></li>
        </ul>
        <script type="text/javascript">
            initSearchmenu('scbar', '');
        </script>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="css/comiis_pcflxx.css">
<div id="wp" class="wp">
    <style id="diy_style" type="text/css"></style>
    <!--[diy=diynavtop]-->
    <div id="diynavtop" class="area"></div>
    <!--[/diy]-->

    <div class="wp">
        <!--[diy=diy1]-->
        <div id="diy1" class="area"></div>
        <!--[/diy]-->
    </div>
    <div class="boardnav">
        <div id="ct" class="wp cl">
            <div class="mn">
                <div class="bm bml pbn">
                    <div class="bm_h cl">


                        <h1 class="xs2"> <a href="home">bbs</a> </h1>
                    </div>
                    <div class="bm_c cl pbn">
                        <div id="forum_rules_2" style=";">
                            <div class="ptn xg2">
                                1、用户可以发布帖子和需求
                                <br> 2、积分来源:回帖+3 发帖+5 回复需求被采纳;
                                <br> 3、发布需求可以设积分奖励
                            </div>
                        </div>
                    </div>
                </div>
                <div class="drag">
                    <!--[diy=diy4]-->
                    <div id="diy4" class="area"></div>
                    <!--[/diy]-->
                </div>
                <div id="pgt" class="bm bw0 pgs cl">
            <span id="fd_page_top">
              <div class="pg">
                    <a href="./home" class="nxt">首页</a>

                  <c:if test="${now!=0}">
                      <a href="./home?now=${now-1}&tType=${tType}&sType=3" class="nxt">上一页</a>
                  </c:if>
                  <label><strong>${HomePage.now+1}/${HomePage.totalNum}</strong></label>


                  <c:if test="${now+1<HomePage.totalNum}">
                      <a href="./home?now=${now+1}&tType=${tType}&sType=3" class="nxt">下一页</a>
                  </c:if>
              </div>
            </span>
                    <span class="pgb y"><a href="home">返&nbsp;回</a></span>
                    <a href="newTopic" id="newspecial"
                       onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"
                       onclick="showWindow('newthread', 'forum.php?mod=post&amp;action=newthread&amp;fid=2')" title="发新帖"><img
                            src="images/pn_post.png" alt="发新帖"></a>
                </div>
                <ul id="thread_types" class="ttp bm cl">
                    <li id="ttp_all" class="xw1 a"><a href="./home?tType=2">全部</a></li>
                    <li><a href="./home?tType=1">
                        <font color="red">需求</font>
                    </a></li>
                    <li><a href="./home?tType=0">交流</a></li>

                </ul>
                <script type="text/javascript">
                    showTypes('thread_types');
                </script>
                <div id="threadlist" class="tl bm bmw">
                    <div class="th">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <th colspan="2">
                                    <div class="tf">

                                        <a id="filter_special" href="home" class="showmenu xi2"
                                           onclick="showMenu(this.id)">全部主题</a>&nbsp;
                                        <a href="./home?now=${now}&tType=${tType}&sType=3"
                                           class="xi2">最新</a>&nbsp;
                                        <a href="./home?now=${now}&tType=${tType}&sType=1"
                                           class="xi2">热门</a>&nbsp;
                                        <a href="./home?now=${now}&tType=${tType}&sType=2" class="xi2">热帖</a>&nbsp;
<%--                                        <a href="./home?now=${now}&tType=${tType}&sType=4"--%>
<%--                                           class="xi2">精华</a>&nbsp;--%>
<%--                                        <a id="filter_dateline" href="javascript:;" class="showmenu xi2"--%>
<%--                                           onclick="showMenu(this.id)">更多</a>&nbsp;--%>
                                        <span id="clearstickthread" style="display: none;"> <span class="pipe">|</span> <a
                                                href="javascript:;" onclick="clearStickThread()" class="xi2" title="显示置顶">显示置顶</a> </span>
                                    </div>
                                </th>
                                <td class="by">作者</td>
                                <td class="num">回复/查看</td>
                                <td class="by">最后发表</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="bm_c">
                        <script type="text/javascript">
                            var lasttime = 1575455149;
                            var listcolspan = '5';
                        </script>
                        <div id="forumnew" style="display:none"></div>
                        <form method="post" autocomplete="off" name="moderate" id="moderate"
                              action="forum.php?mod=topicadmin&amp;action=moderate&amp;fid=2&amp;infloat=yes&amp;nopost=yes">
                            <input type="hidden" name="formhash" value="eea16a10">
                            <input type="hidden" name="listextra" value="page%3D1">
                            <table summary="forum_2" cellspacing="0" cellpadding="0" id="threadlisttableid">

                                <c:forEach var="topic" items="${HomePage.topList}">
                                    <tr>
                                        <!--图标-->
                                        <td class="icn"> <img
                                                src="/bbs/images/pin_1.gif" alt="本版置顶">  </td>
                                        <!--标题-->
                                        <th class="common">
                                            <!--帖子类型-->
                                             <em>[<a
                                                    href="home">
                                                <font color="green">置顶</font>
                                            </a>]</em>
                                            <!--标题-->
                                            <a href="./topic?tid=${topic.id}" style="font-weight: bold;color: #EE1B2E;"
                                                          onclick="atarget(this)" class="s xst">${topic.title}</a>
                                            <c:if test="${topic.jing==1}"> <img src="/bbs/images/agree.gif" >[加精]</c:if></th>
                                        <!--作者  点击数  回复人-->
                                        <td class="by"> <cite> <a href="home" c="1"
                                                                  style="color: #6633FF;">${topic.author}</a></cite> <em><span>${topic.t}</span></em> </td>
                                        <td class="num"><a href="home" class="xi2">${topic.replyNum}</a><em>${topic.clickNum}</em></td>
                                        <td class="by"> <cite><a href="home.php?mod=space&amp;username=www.laedt.com"
                                                                 c="1">${topic.recentReName}</a></cite> <em><a
                                                href="home"><span
                                                >${topic.rt}</span></a></em> </td>
                                    </tr>
                                </c:forEach>

                                <tbody id="separatorline">
                                <tr class="ts">
                                    <td>&nbsp;</td>
                                    <th><a href="javascript:;" onclick="checkForumnew_btn('2')" title="查看更新"
                                           class="forumrefresh">版块主题</a></th>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                </tbody>
                                <script type="text/javascript">
                                    hideStickThread();
                                </script>

                                <c:forEach var="topic" items="${HomePage.list}">
                                    <table>
                                       <tr>
                                           <!--图标-->
                                           <td class="icn">  <img
                                                   src="/bbs/images/folder_new.gif">  </td>
                                           <!--标题-->
                                           <th class="new"> <a href="javascript:;" id="" class="showcontent y" title="更多操作"
                                                               onclick="CONTENT_TID='3847708';CONTENT_ID='normalthread_3847708';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                               <em>[<a
                                                       href="">
                                                                <c:if test="${topic.type==0}"><font color="red">交 流</c:if>
                                                                <c:if test="${topic.type==1 && topic.points>-1}"><font color="blue"> 需 求: ${topic.points}积分</c:if>
                                                                <c:if test="${topic.type==1 && topic.points==-1}"> <font color="blue">已解决</font></c:if>
                                               </a>]</em> <a href="./topic?tid=${topic.id}"
                                                             class="s xst">${topic.title}</a>
                                               <c:if test="${topic.jing==1}"> <img src="/bbs/images/agree.gif" >[加精]</c:if>
                                           </th>
                                           <!--作者 发布时间-->
                                           <td class="by"> <cite> <a href="" >${topic.author}</a></cite>
                                               <em><span class="xi1"><span title="2019-12-4">${topic.t}</span></span></em> </td>
                                           <!--回复数 点击数-->
                                           <td class="num"><a href="" class="xi2">${topic.replyNum}</a><em>${topic.clickNum}</em></td>
                                           <!--最后回复 回复时间-->
                                           <td class="by"> <cite><a href=""
                                                                    c="1">${topic.recentReName}</a></cite> <em><a
                                                   href=""><span
                                                   title="2019-12-4 17:18">${topic.rt}</span></a></em> </td>
                                       </tr>
                                    </table>

                                </c:forEach>



                            </table>
                            <!-- end of table "forum_G[fid]" branch 1/3 -->
                        </form>
                    </div>
                </div>
                <div id="filter_special_menu" class="p_pop" style="display:none"
                     change="location.href='forum.php?mod=forumdisplay&amp;fid=2&amp;filter='+$('filter_special').value">
                    <ul>
                        <li><a href="forum-2-1.html">全部主题</a></li>
                    </ul>
                </div>
                <div id="filter_reward_menu" class="p_pop" style="display:none"
                     change="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=specialtype&amp;specialtype=reward&amp;rewardtype='+$('filter_reward').value">
                    <ul>
                        <li><a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=specialtype&amp;specialtype=reward">全部悬赏</a>
                        </li>
                    </ul>
                </div>
                <div id="filter_dateline_menu" class="p_pop" style="display:none">
                    <ul class="pop_moremenu">
                        <li>排序: <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=author&amp;orderby=dateline">发帖时间</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=reply&amp;orderby=replies">回复/查看</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=reply&amp;orderby=views">查看</a> </li>
                        <li>时间: <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline"
                                   class="xw1">全部时间</a><span class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=86400">一天</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=172800">两天</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=604800">一周</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=2592000">一个月</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=7948800">三个月</a>
                        </li>
                    </ul>
                </div>

                <script src="js/autoloadpage.js" type="text/javascript"></script>
                <div class="bm bw0 pgs cl">
            <span id="fd_page_bottom">
              <div class="pg">
                  <a href="./home" class="nxt">首页</a>

                  <c:if test="${now!=0}">
                      <a href="./home?now=${now-1}&tType=${tType}&sType=3" class="nxt">上一页</a>
                  </c:if>
                  <label><strong>${HomePage.now+1}/${HomePage.totalNum}</strong></label>


                  <c:if test="${now+1<HomePage.totalNum}">
                      <a href="./home?now=${now+1}&tType=${tType}&sType=3" class="nxt">下一页</a>
                  </c:if>
              </div>
            </span>
                    <span class="pgb y"><a href="./home">返&nbsp;回</a></span>

                </div>
                <!--[diy=diyfastposttop]-->
                <div id="diyfastposttop" class="area"></div>
                <!--[/diy]-->
                <script type="text/javascript">
                    var postminchars = parseInt('6');
                    var postmaxchars = parseInt('50000');
                    var disablepostctrl = parseInt('0');
                    var fid = parseInt('2');
                </script>

            </div>
            <!--[diy=diyforumdisplaybottom]-->
            <div id="diyforumdisplaybottom" class="area"></div>
            <!--[/diy]-->
        </div>
    </div>
</div>
<script type="text/javascript">
    document.onkeyup = function (e) {
        keyPageScroll(e, 0, 1, 'forum.php?mod=forumdisplay&fid=2&filter=&orderby=lastpost&', 1);
    }
</script>
<script type="text/javascript">
    checkForumnew_handle = setTimeout(function () {
        checkForumnew(2, lasttime);
    }, checkForumtimeout);
</script>
<div class="wp mtn">
    <!--[diy=diy3]-->
    <div id="diy3" class="area"></div>
    <!--[/diy]-->
</div>
<script>
    fixed_top_nv();
</script>
</div>

<script type="text/javascript">
    var cookieLogin = Ajax("TEXT");
    cookieLogin.get("connect.php?mod=check&op=cookie", function () {});
</script>
<div id="ft" class="wp cl">

    <div id="frt">
        <p>Powered by <strong>NCU</strong> </p>

    </div>
</div>
<script src="/home.php" type="text/javascript"></script>
<div id="scrolltop">
    <span hidefocus="true"><a title="返回顶部" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>返回顶部</b></a></span>
    <span> <a href="forum.php" hidefocus="true" class="returnboard" title="返回版块"><b>返回版块</b></a> </span>
</div>
<script type="text/javascript">
    _attachEvent(window, 'scroll', function () {
        showTopLink();
    });
    checkBlind();
</script>
<div id="discuz_tips" style="display:none;"></div>
<script type="text/javascript">
    var tipsinfo = '1000|X3.3|0.6||0||0|7|1575455149|8abb2fe79110ccaaca4d8fa2f4430ddb|2';
</script>
<!--<script src="http://discuz.gtimg.cn/cloud/scripts/discuz_tips.js?v=1" type="text/javascript" charset="UTF-8"></script>-->
</body>

</html>