<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title data-react-helmet="true">400</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/error.css">
</head>
<body>
<div id="root">
    <div class="box-404-wrap">
        <div class="box">
            <div class="d-flex flex-column align-items-center">
                <div class="text-wrap">
                    <h1 data-t="400" class="h1">400</h1>
                </div>
                <div class="text-center mt-2">由于感知到客户端错误（如格式错误的请求语法、无效的请求信息帧或虚拟请求路由），服务器无法或将不会处理当前请求。</div>
                <div class="mt-4"><a href="${pageContext.request.contextPath}/index.jsp" role="button" tabindex="0" class="btn btn-primary">返回首页</a></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
