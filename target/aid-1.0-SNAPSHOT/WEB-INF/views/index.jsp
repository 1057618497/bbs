<%@ page language="java" import="java.util.*"  contentType="text/html;charset=utf-8"  %>
<%@ page import="vo.*"%>
<html>
<head>
    <meta http-equiv="Content-Type"; content="multipart/form-data; charset=utf-8"/>
    <meta charset="UTF-8">
    <title>wangEditor demo</title>
</head>
<body>
<div >
    <p>欢迎使用 <b>wangEditor</b> 富文本编辑器</p>
</div>

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
        //alert(content);
        text.value=content;
        form.submit();
    }
</script>

<form name="form" action="edit" method="post" >
<table>
    <tr>
        <td colspan="2">标题<br>
        <input type="text" name="title"> </td>
    </tr>
    <tr>
        <td colspan="2" id="editor">
            <script>editor.create()</script>

        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="hidden" id="area" rows="15" cols="30" name="html"></input>
    </tr>


    <tr>
        <td><input type="button" method="POST" value="提交" id="sub" onclick="f3()"> </td>
        <td> <input type="submit" value="submit"></td>
    </tr>
</table>
</form>
<input type="button" id="btn1" value="html" onclick="f1()">
<input type="button" id="btn2" value="text" onclick="f2()">

</body>
</html>