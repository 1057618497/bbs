<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"  %>
<%@ page import="vo.*"%>

<html>
<head>
    <meta http-equiv="Content-Type"; content="multipart/form-data; charset=utf-8"/>
    <meta charset="UTF-8">
    <title>修改草稿</title>
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
            <h2><a href="../home" ><img  src="../images/ncu.png"  height="80" width="80"  border="0" /></a>
            </h2>
            <div id="um">
                <div class="avt y"><a href="home.php?mod=space&amp;uid=3092991"><img
                        src="https://uc.discuz.net/data/avatar/003/09/29/91_avatar_small.jpg"
                        onerror="this.onerror=null;this.src='https://uc.discuz.net/images/noavatar_small.gif'" /></a></div>
                <p>
                    <strong class="vwmy"><a href="myView" target="_blank"
                                            title="访问我的空间">${userProfile.nickname}</a></strong>




                    <span class="pipe">|</span><a href="../myView" id="myitem" class="showmenu"
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
        <li class="a" id="mn_forum"><a href="../home" hidefocus="true" title="BBS">论坛首页<span>BBS</span></a></li>

    </ul>
</div>

<div align="center">

    <br><hr>

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
            document.form.action="./draftToTopicAction ";

            //alert(content);


            text.value=content;
            if(text.value.length<=0||document.getElementById("title").value.length<=0){
                alert("帖子和标题长度不能为0"  );
            }
            else{
            var radio=document.getElementsByName("isRequire");
            var p=document.getElementById("points").value;
            if(radio[0].checked){
                document.getElementById("points").value=0;
                form.submit();
            }
            else if(p>${userProfile.points})
                alert("积分不足");
            else form.submit();
            }
        }
        function f4(){
            var text=document.getElementById("area");
            var content=editor.txt.html();
            document.form.action="./draftSaveAction";

            //alert(content);
            text.value=content;
            form.submit();
        }

        function  f6() {
            var p=document.getElementById("points").value;
            if(p>${userProfile.points}||p<0)
                alert("积分不足或为负数");
        }
    </script>

    <form name="form" action="edit" method="post" id="form">
        <table >
            <tr>
                <td colspan="2"><b>标题:</b>
                    <input type="text" name="title"  id="title" style="width:1000px" value="${draft.title}"><br></td><br>
            </tr>
            <tr>
                <td><br><b>请选择帖子类型:</b><br><br><br><hr></td>
                <td >
                    <br><input type="radio" name="isRequire" checked value="0">交流
                    <input type="radio" name="isRequire" value="1">需求
                    设置需求积分奖励：<input type="text" id="points" name="points" value="0"   onblur="f6()"><br><br><br><hr>
                </td>
            </tr>

            <tr>

                <td colspan="2"  >

                    <div id="editor">

                        ${draft.content}


                    </div>
                    <script>editor.create()</script>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" id="area" rows="15" cols="30" name="html" value="${draft.content}">
                    <input type="hidden" name="did" value="${draft.did}">
                </td>
            </tr>


            <tr>
                <td align="center"><input type="button" method="POST" value="发布帖子" id="sub1" onclick="f3()"> </td>
                <td align="center"><input type="button" method="POST" value="保存草稿" id="sub2" onclick="f4()"> </td>
            </tr>
        </table>
    </form>
    <!--
<input type="button" id="btn1" value="html" onclick="f1()">
<input type="button" id="btn2" value="text" onclick="f2()">
-->
</div>
</body>
</html>