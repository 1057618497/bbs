<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html >
<head><title>My JSP 'demo.jsp' starting page</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- <link rel="stylesheet" type="text/css" href="styles.css"> -->
    <style type="text/css"> /* table样式*/
    table {
        border-top: 1px solid #ccc;
        border-left: 1px solid #ccc;
    }

    table td, table th {
        border-bottom: 1px solid #ccc;
        border-right: 1px solid #ccc;
        padding: 3px 5px;
    }

    table th {
        border-bottom: 2px solid #ccc;
        text-align: center;
    }

    /* blockquote 样式*/
    blockquote {
        display: block;
        border-left: 8px solid #d0e5f2;
        padding: 5px 10px;
        margin: 10px 0;
        line-height: 1.4;
        font-size: 100%;
        background-color: #f1f1f1;
    }

    /* code 样式*/
    code {
        display: inline-block;
        *display: inline;
        *zoom: 1;
        background-color: #f1f1f1;
        border-radius: 3px;
        padding: 3px 5px;
        margin: 0 3px;
        font-family: "Courier New", Courier, monospace;
    }

    pre code {
        display: block;
    }

    /* ul ol 样式*/
    ul, ol {
        margin: 10px 0 10px 20px;
    } </style>
</head>
<body>
<div> <%out.print(request.getParameter("html"));%>
</div>
</body>
</html>