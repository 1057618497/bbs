
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/9
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vo.*"%>
<%
    String s;
    TopicView tv=(TopicView)request.getAttribute("TopicView");
    s=tv.getT().getUpTime();
    s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
            s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
    tv.getT().setUpTime(s);

    for(int i=0;i<tv.getReList().size();i++){
        s=tv.getReList().get(i).getReply().getReTime();
        s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
        tv.getReList().get(i).getReply().setReTime(s);
    }

    int AccountId;
    String tid=request.getParameter("tid");
    boolean login=false;
    if(session.getAttribute("AccountId")!=null) {
        login = true;
        AccountId=(Integer)session.getAttribute("AccountId");
    }

    boolean flag=false;
    if(login){
        Topic t=tv.getT();
        if(t.getId()==(Integer)session.getAttribute("AccountId")&&t.getRequire()==1&&t.getPoints()!=-1)
            flag=true;
    }

%>
<!-- 注意， 只需要引用 JS，无需引用任何 CSS ！！！-->
<script type="text/javascript"charset="utf-8" src="${pageContext.request.contextPath}/wangEditor-3.1.1/release/wangEditor.js"></script>
<script type="text/javascript"charset="utf-8">
    var E = window.wangEditor
    var editor = new E('#editor')

    //开启debug模式
    editor.customConfig.debug = true;
    // 关闭粘贴内容中的样式
    editor.customConfig.pasteFilterStyle = false
    // 忽略粘贴内容中的图片
    editor.customConfig.pasteIgnoreImg = true
    // 使用 base64 保存图片
    //editor.customConfig.uploadImgShowBase64 = true
    // 上传图片到服务器
    editor.customConfig.uploadFileName = 'myFile'; //设置文件上传的参数名称
    editor.customConfig.uploadImgServer = 'upload'; //设置上传文件的服务器路径
    editor.customConfig.uploadImgMaxSize = 10 * 1024 * 1024; // 将图片大小限制为 3M
    editor.customConfig.uploadImgMaxLength = 5;
    editor.customConfig.uploadImgHooks = {
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
            var url =result.data;
            insertImg(url);

            // result 必须是一个 JSON 格式字符串！！！否则报错
        },

        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            //alert("1");
        },
        fail: function (xhr, editor, result) {
            // 图片上传并返回结果，但图片插入错误时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
            //alert("2");
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            //alert("3");
        }
    }
    // 或者 var editor = new E( document.getElementById('editor') )
    //editor.create()

    editor.customConfig.menus =[
        'head',  // 标题
        'bold',  // 粗体
        'fontSize',  // 字号
        'fontName',  // 字体
        'italic',  // 斜体
        'underline',  // 下划线
        'strikeThrough',  // 删除线
        'foreColor',  // 文字颜色
        'backColor',  // 背景颜色
        'link',  // 插入链接
        'list',  // 列表
        'justify',  // 对齐方式
        'quote',  // 引用
        'emoticon',  // 表情
        'image',  // 插入图片
        'table',  // 表格
        'code',  // 插入代码
        'undo',  // 撤销
        'redo'  // 重复
    ]

    function f1() {
        // 读取 html
        var text=document.getElementById("area");
        var content=editor.txt.html();
        //alert(content);
        text.value=content;
        alert(document.getElementById("area").value);
    }

    function f2() {
        // 读取 text
        alert(editor.txt.text())
    }

    function f3() {
        var text=document.getElementById("area");
        var content=editor.txt.html();
        document.form.action="newReplyAction";

        //alert(content);
        text.value=content;

        if(text.value.length<=0){
          alert("回复长度不能为0"  );
        }
        else form.submit();
    }

</script>

<style>
    #postlist .vwthd{position:relative;overflow:visible;padding-right:115px !important;display:block;z-index:99;}
</style>
<link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common_ef418b9764814e92858136696903b4e9.css">
<link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_viewthread.css">
<link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common.css" >
<link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_forumdisplay.css">

<!--顶部-->
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
        <%}%>
    </div>
<div id="nv">

    <ul>
        <li class="a" id="mn_forum"><a href="home" hidefocus="true" title="BBS">论坛首页<span>BBS</span></a></li>

    </ul>
</div>

<div id="postlist" class="pl bm">
    <!--顶部-->
    <table cellspacing="0" cellpadding="0">
        <tbody>
        <tr>
            <td class="pls ptn pbn">
                <div class="hm ptn">
                    <span class="xg1">查看:</span>
                    <span class="xi1">${TopicView.t.clickNum}</span>
                    <span class="pipe">|</span>
                    <span class="xg1">回复:</span>
                    <span class="xi1">${TopicView.t.replyNum}</span>
                </div> </td>
        </tr></tbody></table>
    <!--标题-->
    <h1 class="ts">
        [<font color="black"><c:if test="${TopicView.t.require==0}">交流</c:if> <c:if test="${TopicView.t.require==1}">需求</c:if></font>]
        <span id="thread_subject">${TopicView.t.title}</span> </h1> <span class="xg1">
      </span>


    <div class="pg">
        <a href="./home" class="nxt"><b><<<返回列表</b></a>
    </div>

    <!--主贴-->
    <div id="post_29844689">
        <table id="pid29844689" class="plhin" summary="pid29844689" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <td class="pls" rowspan="2">
                    <div id="favatar29844689" class="pls favatar">
                        <a name="lastpost"></a>
                        <div class="pi">
                            <!--作者名-->
                            <div class="authi">
                                <p  class="xw1">${TopicView.name}</p>
                            </div>
                        </div>
                        <div class="p_pop blk bui card_gender_" id="userinfo29844689" style="display: none; margin-top: -11px;">
                            <div class="m z">
                                <div id="userinfo29844689_ma"></div>
                            </div>
                        </div>
                        <div>
                            <div class="avatar">
                               <img src="images/noavatar_middle.gif" >
                            </div>
                        </div>
                    </div> </td>
                <td class="plc">
                    <div class="pi">

                        <div class="pti">
                            <div class="pdbt">
                            </div>
                            <div class="authi">
                                <img class="authicn vm" id="authicon29844689" src="images/online_member.gif">
                                <em id="authorposton29844689">发表于 ${TopicView.t.upTime}</em>
                                <span class="pipe">|楼主</span>

                            </div>
                        </div>
                    </div>
                    <div class="pct">
                        <div class="pcb">
                            <div class="t_fsz">
                                <table cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <!-- 帖子内容-->
                                    <tr>
                                        <td class="t_f" id="postmessage_29844689"> ${TopicView.t.content}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="comment_29844689" class="cm">
                            </div>
                            <div id="post_rate_div_29844689"></div>
                        </div>
                    </div> </td>
            </tr>
            <tr>
                <td class="plc plm"> </td>
            </tr>


            <tr class="ad">
                <td class="pls"> </td>
                <td class="plc"> </td>
            </tr>
            </tbody>
        </table>
    </div>

    <!--回帖-->
    <c:forEach var="unit" items="${TopicView.reList}">
    <div >
        <table id="pid29844689" class="plhin" summary="pid29844689" cellspacing="0" cellpadding="0">
            <tbody>
            <tr>
                <td class="pls" rowspan="2">
                    <div id="favatar29844689" class="pls favatar">
                        <a name="lastpost"></a>
                        <div class="pi">
                            <!--作者名-->
                            <div class="authi">
                                <p  class="xw1">${unit.reName}</p>
                            </div>
                        </div>
                        <div class="p_pop blk bui card_gender_" id="userinfo29844689" style="display: none; margin-top: -11px;">
                            <div class="m z">
                                <div id="userinfo29844689_ma"></div>
                            </div>
                        </div>
                        <div>
                            <div class="avatar">
                                <img src="images/noavatar_middle.gif" >
                            </div>
                        </div>
                    </div> </td>
                <td class="plc">
                    <div class="pi">

                        <div class="pti">
                            <div class="pdbt">
                            </div>
                            <div class="authi">
                                <img class="authicn vm" id="authicon29844689" src="images/online_member.gif">
                                <em >发表于 ${unit.reply.reTime}</em>
                                <span class="pipe">|回复</span>
                                <%if(flag){%><span class="pipe">|<a href="./award?id=${unit.reply.ridOfMan}&tid=${TopicView.t.tid}&points=${TopicView.t.points}">采纳</a></span><%}%>
                            </div>
                        </div>
                    </div>
                    <div class="pct">
                        <div class="pcb">
                            <div class="t_fsz">
                                <table cellspacing="0" cellpadding="0">
                                    <tbody>
                                    <!-- 帖子内容-->
                                    <tr>
                                        <td class="t_f" > ${unit.reply.content}</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="comment_29844689" class="cm">
                            </div>
                            <div id="post_rate_div_29844689"></div>
                        </div>
                    </div> </td>
            </tr>
            <tr>
                <td class="plc plm"> </td>
            </tr>


            <tr class="ad">
                <td class="pls"> </td>
                <td class="plc"> </td>
            </tr>
            </tbody>
        </table>
    </div>
    </c:forEach>

</div>
    <div id="f_pst" class="pl bm bmw">

        <form method="post" name="form" id="fastpostform"   >
            <table cellspacing="0" cellpadding="0">
                <tbody>

                <tr>
                    <td class="pls"> </td>
                    <td class="plc"> <span id="fastpostreturn"></span>

                        <% if(!login){%>
                        <div class="cl">
                            <div id="fastsmiliesdiv" class="y">
                                <div id="fastsmiliesdiv_data">
                                    <div id="fastsmilies"></div>
                                </div>
                            </div>
                            <div class="hasfsl" id="fastposteditor">
                                <div class="tedt mtn">

                                    <div class="area">
                                        <div class="pt hm">
                                            您需要登录后才可以回帖
                                            <a href="/bbs/login" onclick="showWindow('login', this.href)" class="xi2">登录</a> |
                                            <a href="/bbs/account/signUp" class="xi2">立即注册</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                        <% if(login){%>

                            <div id="editor"> <script>editor.create()</script></div>
                        <input type="hidden" id="area" name="html">
                        <input type="hidden" name="ridOfMan" value="${AccountId}">
                        <input type="hidden" name="tid" value="${tid}">
                        <%}%>
                        <div id="seccheck_fastpost">
                        </div>    <p class="ptm pnpost">  <button type="button"  class="pn pnc vm" value="replysubmit" tabindex="5" onclick="f3()"><strong>发表回复</strong></button>   </p> </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>
</body>
