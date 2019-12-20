<%--
  Created by IntelliJ IDEA.
  User: 蓝景
  Date: 2019/12/16
  Time: 14:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=gb2312" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    int num=0;

    String content= (String) request.getAttribute("content");
   if(request.getAttribute("num")!=null)
       num=(int)request.getAttribute("num");
%>
<html>

<head>

    <title>搜索</title>

    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_common_1.css">
    <link rel="stylesheet" type="text/css" href="/bbs/css/style_1_search_forum.css">

</head>

<body id="nv_search" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>
<div id="toptb" class="cl">
    <div class="z">
        <a href="./home" id="navs" class="showmenu xi2">返回首页</a>
    </div>

</div>

<div id="ct" class="cl w">
    <div class="mw">
        <form class="searchform" method="post" autocomplete="off" action="search"
              onsubmit="if($('scform_srchtxt')) searchFocus($('scform_srchtxt'));">

            <table id="scform" class="mbm" cellspacing="0" cellpadding="0">
                <tbody>
                <tr>
                    <td>
                        <h1><a href="home" title="U-Share"><img src="images/ncu.png" height="80" width="80"  alt="NCU"></a></h1>
                    </td>
                    <td>

                        <table id="scform_form" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr>
                                <td class="td_srchtxt"><input type="text" id="scform_srchtxt" name="search" size="45"
                                                              maxlength="40" value="${content}" tabindex="1" x-webkit-speech speech>
                                    <script type="text/javascript">
                                        initSearchmenu('scform_srchtxt');
                                        $('scform_srchtxt').focus();
                                    </script>
                                </td>
                                <td class="td_srchbtn"><input type="hidden" name="searchsubmit" value="yes"><input type="submit"
                                                                                                                    id="scform_submit" class="schbtn" value="搜索"></td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>

        </form>
        <div class="tl">
            <div class="sttl mbn">
                <h2>结果: <em>找到 “<span class="emfont">${content}</span>” 相关内容 ${num} 个</em> </h2>
            </div>
            <div class="slst mtw" id="threadlist">
                <ul>
                    <c:forEach var="li" items="${searchList}">
                        <li class="pbw" >
                            <h3 class="xs3"> <a href="topic?tid=${li.tid}"
                                                target="_blank">${li.title}</a> </h3>
                            <p class="xg1">${li.replyNum} 个回复 - ${li.clickNum}次查看</p>
                            <p>${li.title}...</p>
                            <p> <span>${li.upTime}</span> - <span> </span> </p>
                        </li>

                    </c:forEach>


                </ul>
            </div>

        </div>
    </div>
</div>

<div id="ft" class="w cl">
    <em>Powered by <strong><a href="home" target="_blank">NCU!</a></strong> </em>

</div>
</body>

</html>
