<%--
  Created by IntelliJ IDEA.
  User: ����
  Date: 2019/12/5
  Time: 8:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>



<head>

    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common.css" >
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_forum_forumdisplay.css">
    <script type="text/javascript">
        var STYLEID = '1',
            STATICURL = 'static/',
            IMGDIR = 'static/image/common',
            VERHASH = 'A48',
            charset = 'gbk',
            discuz_uid = '0',
            cookiepre = 't7asq_4ad6_',
            cookiedomain = '.discuz.net',
            cookiepath = '/',
            showusercard = '1',
            attackevasive = '0',
            disallowfloat = 'newthread|tradeorder|activity|debate',
            creditnotice = '1|����|,2|���|ö,4|����|��,5|����|,6|����|,7|΢��|ö',
            defaultstyle = '',
            REPORTURL = 'aHR0cDovL3d3dy5kaXNjdXoubmV0L2ZvcnVtLTItMS5odG1s',
            SITEURL = '//www.discuz.net/',
            JSPATH = 'data/cache/',
            CSSPATH = 'data/cache/style_',
            DYNAMICURL = '';
    </script>
    <script src="js/common.js" type="text/javascript"></script>
    <meta name="application-name" content="Discuz! �ٷ�վ">
    <meta name="msapplication-tooltip" content="Discuz! �ٷ�վ">
    <meta name="msapplication-task"
          content="name=��̳��ҳ;action-uri=https://www.discuz.net/forum.php;icon-uri=https://www.discuz.net/static/image/common/bbs.ico">
    <link rel="archives" title="Discuz! �ٷ�վ" href="css/null_022e53c8454240108cefef3a139ed2c6.">
    <script src="js/forum.js" type="text/javascript"></script>
</head>

<body id="nv_forum" class="pg_forumdisplay" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="toptb" class="cl">
    <div class="wp">

        <p id="ttt">this is css</p>

    </div>
</div>

<div id="hd">
    <div class="wp">
        <div class="hdc cl">
            <h2><a href="./" title="Discuz! �ٷ�վ"><img src="images/logo.png" alt="Discuz! �ٷ�վ" border="0"></a></h2>
            <script src="js/logging.js" type="text/javascript"></script>
            <form method="post" autocomplete="off" id="lsform"
                  action="member.php?mod=logging&amp;action=login&amp;loginsubmit=yes&amp;infloat=yes&amp;lssubmit=yes"
                  onsubmit="return lsSubmit();">
                <div class="fastlg cl">
                    <span id="return_ls" style="display:none"></span>
                    <div class="y pns">
                        <table cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td> <span class="ftid"> <select name="fastloginfield" id="ls_fastloginfield" width="40"
                                                                 tabindex="900">
                          <option value="username">�û���</option>

                        </select> </span>
                                    <script type="text/javascript">
                                        simulateSelect('ls_fastloginfield')
                                    </script>
                                </td>
                                <td><input type="text" name="username" id="ls_username" autocomplete="off" class="px vm"
                                           tabindex="901"></td>
                                <td></td>
                                <td>&nbsp;<a href="javascript:;"
                                             onclick="showWindow('login', 'member.php?mod=logging&amp;action=login&amp;viewlostpw=1')">�һ�����</a>
                                </td>
                            </tr>
                            <tr>
                                <td><label for="ls_password" class="z psw_w">����</label></td>
                                <td><input type="password" name="password" id="ls_password" class="px vm" autocomplete="off"
                                           tabindex="902"></td>
                                <td class="fastlg_l"><button type="submit" class="pn vm" tabindex="904"
                                                             style="width: 75px;"><em>��¼</em></button></td>
                                <td>&nbsp;<a href="member.php?mod=zhuce" class="xi2 xw1">����ע��</a></td>
                            </tr>
                            </tbody>
                        </table>
                        <input type="hidden" name="quickforward" value="yes">
                        <input type="hidden" name="handlekey" value="ls">
                    </div>
                    <div class="fastlg_fm y" style="margin-right: 10px; padding-right: 10px">
                        <p>ppp</p>
                    </div>
                </div>
            </form>
        </div>
        <div id="nv">

            <ul>
                <li class="a" id="mn_forum"><a href="forum.php" hidefocus="true" title="BBS">��̳��ҳ<span>BBS</span></a></li>

            </ul>
        </div>


        <div id="scbar" class="cl">
            <form id="scbar_form" method="post" autocomplete="off" onsubmit="searchFocus($('scbar_txt'))"
                  action="search.php?searchsubmit=yes" target="_blank">
                <input type="hidden" name="mod" id="scbar_mod" value="search">
                <input type="hidden" name="formhash" value="eea16a10">
                <input type="hidden" name="srchtype" value="title">
                <input type="hidden" name="srhfid" value="2">
                <input type="hidden" name="srhlocality" value="forum::forumdisplay">
                <table cellspacing="0" cellpadding="0">
                    <tbody>
                    <tr>
                        <td class="scbar_icon_td"></td>
                        <td class="scbar_txt_td"><input type="text" name="srchtxt" id="scbar_txt" value="��������������"
                                                        autocomplete="off" x-webkit-speech speech></td>
                        <td class="scbar_type_td"><a href="javascript:;" id="scbar_type" class="xg1" onclick="showMenu(this.id)"
                                                     hidefocus="true">����</a></td>
                        <td class="scbar_btn_td"><button type="submit" name="searchsubmit" id="scbar_btn" sc="1" class="pn pnc"
                                                         value="true"><strong class="xi2">����</strong></button></td>
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
            <li><a href="javascript:;" rel="curforum" fid="2">����</a></li>
            <li><a href="javascript:;" rel="user">�û�</a></li>
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


                        <h1 class="xs2"> <a href="forum-2-1.html">bbs</a> <span class="xs1 xw0 i">����: <strong
                                class="xi1">38</strong><b class="ico_fall">&nbsp;</b><span class="pipe">|</span>����: <strong
                                class="xi1">930631</strong><span class="pipe">|</span>����: <strong class="xi1"
                                                                                                  title="�ϴ�����:1">1</strong><b class="ico_increase">&nbsp;</b></span></h1>
                    </div>
                    <div class="bm_c cl pbn">
                        <div id="forum_rules_2" style=";">
                            <div class="ptn xg2">
                                1��������Ҫ��������ʹ�� Discuz! �Ĺ������������Ĳ����ϵ����⣬���ǻ��ڵ�һʱ�����Ҵ�;
                                <br> 2��Ҳ��ӭ��Ҽ��뵽�������Ķ����У�ΪӪ��һ�����ཻ������Ѱ����ͷ���Ļ��������ն���ͬŬ��;
                                <br> 3��������Ҫ�������Ч�Ľ��һЩ���⻶ӭ����
                                <a href="https://www.discuz.net/forum-flea-1.html" target="_blank"><strong>վ����</strong></a>����鸶����ѯ
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
                <strong>1</strong>
                <a href="forum-2-2.html">2</a>
                <a href="forum-2-3.html">3</a>
                <a href="forum-2-4.html">4</a>
                <a href="forum-2-5.html">5</a>
                <a href="forum-2-6.html">6</a>
                <a href="forum-2-7.html">7</a>
                <a href="forum-2-8.html">8</a>
                <a href="forum-2-9.html">9</a>
                <a href="forum-2-10.html">10</a>
                <a href="forum-2-500.html" class="last">... 23266</a>
                <label><input type="text" name="custompage" class="px" size="2" title="����ҳ�룬���س�������ת" value="1"
                              onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=forumdisplay&amp;fid=2&amp;page='+this.value;; doane(event);}"><span
                        title="�� 500 ҳ"> / 500 ҳ</span></label>
                <a href="forum-2-2.html" class="nxt">��һҳ</a>
              </div>
            </span>
                    <span class="pgb y"><a href="forum.php">��&nbsp;��</a></span>
                    <a href="javascript:;" id="newspecial"
                       onmouseover="$('newspecial').id = 'newspecialtmp';this.id = 'newspecial';showMenu({'ctrlid':this.id})"
                       onclick="showWindow('newthread', 'forum.php?mod=post&amp;action=newthread&amp;fid=2')" title="������"><img
                            src="images/pn_post.png" alt="������"></a>
                </div>
                <ul id="thread_types" class="ttp bm cl">
                    <li id="ttp_all" class="xw1 a"><a href="forum-2-1.html">ȫ��</a></li>
                    <li><a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=1">
                        <font color="red">����</font><span class="xg1 num">108871</span>
                    </a></li>
                    <li><a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=2">����<span
                            class="xg1 num">94</span></a></li>

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

                                        <a id="filter_special" href="javascript:;" class="showmenu xi2"
                                           onclick="showMenu(this.id)">ȫ������</a>&nbsp;
                                        <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=lastpost&amp;orderby=lastpost"
                                           class="xi2">����</a>&nbsp;
                                        <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=heat&amp;orderby=heats"
                                           class="xi2">����</a>&nbsp;
                                        <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=hot" class="xi2">����</a>&nbsp;
                                        <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=digest&amp;digest=1"
                                           class="xi2">����</a>&nbsp;
                                        <a id="filter_dateline" href="javascript:;" class="showmenu xi2"
                                           onclick="showMenu(this.id)">����</a>&nbsp;
                                        <span id="clearstickthread" style="display: none;"> <span class="pipe">|</span> <a
                                                href="javascript:;" onclick="clearStickThread()" class="xi2" title="��ʾ�ö�">��ʾ�ö�</a> </span>
                                    </div>
                                </th>
                                <td class="by">����</td>
                                <td class="num">�ظ�/�鿴</td>
                                <td class="by">��󷢱�</td>
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
                                <tbody>
                                <tr>
                                    <td class="icn"><img src="images/ann_icon.gif" alt="����"></td>
                                    <th><strong class="xst">����: <a href="https://www.discuz.net/thread-3847247-1-1.html"
                                                                   target="_blank"><b>Discuz! ������</b></a></strong></th>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;uid=3" c="1">oldhu</a></cite>
                                        <em>2019-11-13</em> </td>
                                    <td class="num">&nbsp;</td>
                                    <td class="by">&nbsp;</td>
                                </tr>
                                </tbody>
                                <tbody id="stickthread_3842481">
                                <tr>
                                    <td class="icn"> <a href="thread-3842481-1-1.html" title="�����ö����� - �´��ڴ�" target="_blank"> <img
                                            src="images/pin_1.gif" alt="�����ö�"> </a> </td>
                                    <th class="common"> <a href="javascript:;" id="content_3842481" class="showcontent y" title="�������"
                                                           onclick="CONTENT_TID='3842481';CONTENT_ID='stickthread_3842481';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <a href="javascript:void(0);" onclick="hideStickThread('3842481')" class="showhide y"
                                           title="�����ö���">�����ö���</a> <a class="tdpre y" href="javascript:void(0);"
                                                                      onclick="previewThread('3842481', 'stickthread_3842481');">Ԥ��</a> <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=5">
                                            <font color="green">�ѽ��</font>
                                        </a>]</em> <a href="thread-3842481-1-1.html" style="font-weight: bold;color: #EE1B2E;"
                                                      onclick="atarget(this)" class="s xst">Discuz!X3.4Ӧ�����İ�װ����Ĳ������ģ����ʾ�������޷�ʶ���뷵�ء��Ľ���취</a> <img
                                                src="images/image_s.gif" alt="attach_img" title="ͼƬ����" align="absmiddle"> <span
                                                class="tps">&nbsp;...<a href="thread-3842481-2-1.html">2</a></span> </th>
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=2810018" c="1"
                                                              style="color: #6633FF;">������</a></cite> <em><span>2018-8-5</span></em> </td>
                                    <td class="num"><a href="thread-3842481-1-1.html" class="xi2">11</a><em>73786</em></td>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=www.laedt.com"
                                                             c="1">www.laedt.com</a></cite> <em><a
                                            href="forum.php?mod=redirect&amp;tid=3842481&amp;goto=lastpost#lastpost"><span
                                            title="2019-12-2 01:04">ǰ��&nbsp;01:04</span></a></em> </td>
                                </tr>
                                </tbody>
                                <tbody id="separatorline">
                                <tr class="ts">
                                    <td>&nbsp;</td>
                                    <th><a href="javascript:;" onclick="checkForumnew_btn('2')" title="�鿴����"
                                           class="forumrefresh">�������</a></th>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                </tbody>
                                <script type="text/javascript">
                                    hideStickThread();
                                </script>
                                <tbody id="normalthread_3847708">
                                <tr>
                                    <!--ͼ��-->
                                    <td class="icn"> <a href="thread-3847708-1-1.html"  target="_blank"> <img
                                            src="images/folder_new.gif"> </a> </td>
                                    <!--����-->
                                    <th class="new"> <a href="javascript:;" id="content_3847708" class="showcontent y" title="�������"
                                                        onclick="CONTENT_TID='3847708';CONTENT_ID='normalthread_3847708';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=1">
                                            <font color="red">����</font>
                                        </a>]</em> <a href="thread-3847708-1-1.html" onclick="atarget(this)"
                                                      class="s xst">hello,this is test</a>
                                    </th>
                                    <!--���� ����ʱ��-->
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=1883620" c="1">���ƥ�С��</a></cite>
                                        <em><span class="xi1"><span title="2019-12-4">1&nbsp;Сʱǰ</span></span></em> </td>
                                    <!--�ظ��� �����-->
                                    <td class="num"><a href="thread-3847708-1-1.html" class="xi2">0</a><em>33</em></td>
                                    <!--���ظ� �ظ�ʱ��-->
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=%CD%F5%C5%C6%A5%E4%D0%A1%C8%FD"
                                                             c="1">���ƥ�С��</a></cite> <em><a
                                            href="forum.php?mod=redirect&amp;tid=3847708&amp;goto=lastpost#lastpost"><span
                                            title="2019-12-4 17:18">1&nbsp;Сʱǰ</span></a></em> </td>
                                </tr>
                                </tbody>
                                <tbody id="normalthread_3847580">
                                <tr>
                                    <td class="icn"> <a href="thread-3847580-1-1.html" title="���»ظ� - �´��ڴ�" target="_blank"> <img
                                            src="images/folder_new.gif"> </a> </td>
                                    <th class="new"> <a href="javascript:;" id="content_3847580" class="showcontent y" title="�������"
                                                        onclick="CONTENT_TID='3847580';CONTENT_ID='normalthread_3847580';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <a class="tdpre y" href="javascript:void(0);"
                                           onclick="previewThread('3847580', 'normalthread_3847580');">Ԥ��</a> <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=5">
                                            <font color="green">�ѽ��</font>
                                        </a>]</em> <a href="thread-3847580-1-1.html" onclick="atarget(this)"
                                                      class="s xst">��������û�˻ᰲװģ����?</a> <a
                                                href="forum.php?mod=redirect&amp;tid=3847580&amp;goto=lastpost#lastpost" class="xi1">New</a>
                                    </th>
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=1883620" c="1">���ƥ�С��</a></cite>
                                        <em><span><span title="2019-11-29">5&nbsp;��ǰ</span></span></em> </td>
                                    <td class="num"><a href="thread-3847580-1-1.html" class="xi2">8</a><em>391</em></td>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=%CD%F5%C5%C6%A5%E4%D0%A1%C8%FD"
                                                             c="1">���ƥ�С��</a></cite> <em><a
                                            href="forum.php?mod=redirect&amp;tid=3847580&amp;goto=lastpost#lastpost"><span
                                            title="2019-12-4 17:16">1&nbsp;Сʱǰ</span></a></em> </td>
                                </tr>
                                </tbody>
                                <tbody id="normalthread_3847706">
                                <tr>
                                    <td class="icn"> <a href="thread-3847706-1-1.html" title="���»ظ� - �´��ڴ�" target="_blank"> <img
                                            src="images/folder_new.gif"> </a> </td>
                                    <th class="new"> <a href="javascript:;" id="content_3847706" class="showcontent y" title="�������"
                                                        onclick="CONTENT_TID='3847706';CONTENT_ID='normalthread_3847706';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <a class="tdpre y" href="javascript:void(0);"
                                           onclick="previewThread('3847706', 'normalthread_3847706');">Ԥ��</a> <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=1">
                                            <font color="red">����</font>
                                        </a>]</em> <a href="thread-3847706-1-1.html" onclick="atarget(this)"
                                                      class="s xst">Discuz!�ֻ���΢�ŷ�����ʾ����ͼ�Ľ������</a> <a
                                                href="forum.php?mod=redirect&amp;tid=3847706&amp;goto=lastpost#lastpost" class="xi1">New</a>
                                    </th>
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=3092648" c="1">wdshici</a></cite>
                                        <em><span class="xi1"><span title="2019-12-4">1&nbsp;Сʱǰ</span></span></em> </td>
                                    <td class="num"><a href="thread-3847706-1-1.html" class="xi2">3</a><em>33</em></td>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=%C3%F1%C9%F3%B4%F3%B4%F3"
                                                             c="1">������</a></cite> <em><a
                                            href="forum.php?mod=redirect&amp;tid=3847706&amp;goto=lastpost#lastpost"><span
                                            title="2019-12-4 17:04">1&nbsp;Сʱǰ</span></a></em> </td>
                                </tr>
                                </tbody>
                                <tbody id="normalthread_3847705">
                                <tr>
                                    <td class="icn"> <a href="thread-3847705-1-1.html" title="���»ظ� - �´��ڴ�" target="_blank"> <img
                                            src="images/folder_new.gif"> </a> </td>
                                    <th class="new"> <a href="javascript:;" id="content_3847705" class="showcontent y" title="�������"
                                                        onclick="CONTENT_TID='3847705';CONTENT_ID='normalthread_3847705';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <a class="tdpre y" href="javascript:void(0);"
                                           onclick="previewThread('3847705', 'normalthread_3847705');">Ԥ��</a> <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=1">
                                            <font color="red">����</font>
                                        </a>]</em> <a href="thread-3847705-1-1.html" onclick="atarget(this)"
                                                      class="s xst">����Ա�˺��������</a> <img src="images/011.small.gif" alt="������" align="absmiddle"> <a
                                                href="forum.php?mod=redirect&amp;tid=3847705&amp;goto=lastpost#lastpost" class="xi1">New</a>
                                    </th>
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=3093270" c="1">������.</a></cite>
                                        <em><span class="xi1"><span title="2019-12-4">3&nbsp;Сʱǰ</span></span></em> </td>
                                    <td class="num"><a href="thread-3847705-1-1.html" class="xi2">4</a><em>46</em></td>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=%B5%DA%CB%C4%C0%E0%C9%CB%BA%DB"
                                                             c="1">�������˺�</a></cite> <em><a
                                            href="forum.php?mod=redirect&amp;tid=3847705&amp;goto=lastpost#lastpost"><span
                                            title="2019-12-4 16:33">1&nbsp;Сʱǰ</span></a></em> </td>
                                </tr>
                                </tbody>


                                <tbody id="normalthread_3784390">
                                <tr>
                                    <td class="icn"> <a href="thread-3784390-1-1.html" title="���»ظ� - �´��ڴ�" target="_blank"> <img
                                            src="images/folder_new.gif"> </a> </td>
                                    <th class="new"> <a href="javascript:;" id="content_3784390" class="showcontent y" title="�������"
                                                        onclick="CONTENT_TID='3784390';CONTENT_ID='normalthread_3784390';showMenu({'ctrlid':this.id,'menuid':'content_menu'})"></a>
                                        <a class="tdpre y" href="javascript:void(0);"
                                           onclick="previewThread('3784390', 'normalthread_3784390');">Ԥ��</a> <em>[<a
                                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=typeid&amp;typeid=1">
                                            <font color="red">����</font>
                                        </a>]</em> <a href="thread-3784390-1-1.html" onclick="atarget(this)"
                                                      class="s xst">���á��οͻظ�����Ч</a> <img src="images/image_s.gif" alt="attach_img" title="ͼƬ����"
                                                                                        align="absmiddle"> </th>
                                    <td class="by"> <cite> <a href="home.php?mod=space&amp;uid=2989435" c="1">һֽ�</a></cite>
                                        <em><span>2016-10-6</span></em> </td>
                                    <td class="num"><a href="thread-3784390-1-1.html" class="xi2">2</a><em>896</em></td>
                                    <td class="by"> <cite><a href="home.php?mod=space&amp;username=cocs00" c="1">cocs00</a></cite>
                                        <em><a href="forum.php?mod=redirect&amp;tid=3784390&amp;goto=lastpost#lastpost"><span
                                                title="2019-12-2 11:10">ǰ��&nbsp;11:10</span></a></em> </td>
                                </tr>
                                </tbody>
                            </table>
                            <!-- end of table "forum_G[fid]" branch 1/3 -->
                        </form>
                    </div>
                </div>
                <div id="filter_special_menu" class="p_pop" style="display:none"
                     change="location.href='forum.php?mod=forumdisplay&amp;fid=2&amp;filter='+$('filter_special').value">
                    <ul>
                        <li><a href="forum-2-1.html">ȫ������</a></li>
                    </ul>
                </div>
                <div id="filter_reward_menu" class="p_pop" style="display:none"
                     change="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=specialtype&amp;specialtype=reward&amp;rewardtype='+$('filter_reward').value">
                    <ul>
                        <li><a href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=specialtype&amp;specialtype=reward">ȫ������</a>
                        </li>
                    </ul>
                </div>
                <div id="filter_dateline_menu" class="p_pop" style="display:none">
                    <ul class="pop_moremenu">
                        <li>����: <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=author&amp;orderby=dateline">����ʱ��</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=reply&amp;orderby=replies">�ظ�/�鿴</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;filter=reply&amp;orderby=views">�鿴</a> </li>
                        <li>ʱ��: <a href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline"
                                   class="xw1">ȫ��ʱ��</a><span class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=86400">һ��</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=172800">����</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=604800">һ��</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=2592000">һ����</a><span
                                class="pipe">|</span> <a
                                href="forum.php?mod=forumdisplay&amp;fid=2&amp;orderby=lastpost&amp;filter=dateline&amp;dateline=7948800">������</a>
                        </li>
                    </ul>
                </div>
                <a class="bm_h" href="javascript:;" rel="forum.php?mod=forumdisplay&amp;fid=2&amp;page=2" curpage="1"
                   id="autopbn" totalpage="500" picstyle="0" forumdefstyle="">��һҳ &raquo;</a>
                <script src="js/autoloadpage.js" type="text/javascript"></script>
                <div class="bm bw0 pgs cl">
            <span id="fd_page_bottom">
              <div class="pg">
                <strong>1</strong>
                <a href="forum-2-2.html">2</a>
                <a href="forum-2-3.html">3</a>
                <a href="forum-2-4.html">4</a>
                <a href="forum-2-5.html">5</a>
                <a href="forum-2-6.html">6</a>
                <a href="forum-2-7.html">7</a>
                <a href="forum-2-8.html">8</a>
                <a href="forum-2-9.html">9</a>
                <a href="forum-2-10.html">10</a>
                <a href="forum-2-500.html" class="last">... 23266</a>
                <label><input type="text" name="custompage" class="px" size="2" title="����ҳ�룬���س�������ת" value="1"
                              onkeydown="if(event.keyCode==13) {window.location='forum.php?mod=forumdisplay&amp;fid=2&amp;page='+this.value;; doane(event);}"><span
                        title="�� 500 ҳ"> / 500 ҳ</span></label>
                <a href="forum-2-2.html" class="nxt">��һҳ</a>
              </div>
            </span>
                    <span class="pgb y"><a href="forum.php">��&nbsp;��</a></span>

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
        <p>Powered by <strong><a href="http://www.discuz.net" target="_blank">Discuz!</a></strong> <em>X3.3</em></p>
        <p class="xs0">Copyright &copy; 2001-2019 Tencent Cloud.</p>
    </div>
</div>
<script src="/home.php" type="text/javascript"></script>
<div id="scrolltop">
    <span hidefocus="true"><a title="���ض���" onclick="window.scrollTo('0','0')" class="scrolltopa"><b>���ض���</b></a></span>
    <span> <a href="forum.php" hidefocus="true" class="returnboard" title="���ذ��"><b>���ذ��</b></a> </span>
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