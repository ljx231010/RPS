<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/notiflix-3.2.5.min.css">
    <script src="${pageContext.request.contextPath}/static/js/clipboard.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/notiflix-3.2.5.min.js"></script>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico"/>
    <style>
        table td {
            font-size: 15px;
            font-weight: bold;
            text-align: center;
        }

        table thead {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <title>路径搜索结果</title>
</head>
<body class="bg1">
<%@include file="/nav.jsp" %>

<div class="ui center aligned container" style="margin-top: 5em; width: 80%; ">
    <h3 class="ui header">${requestScope.get("path")}</h3>
    <table class="ui celled table" style="text-align: center;">
        <thead>
        <tr>
            <th>排名<span title="路径排名" style="cursor: help;" data-toggle="tooltip"
                          data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            <th>路径</th>
            <th>复制<span title="单击“复制”复制当前行的路径" style="cursor: help;"
                          data-toggle="tooltip"
                          data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="path" items="${requestScope.get('results')}" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td id="result${status.count}">${path}</td>
                <td>
                    <button class="ui button" data-clipboard-target="#result${status.count}">复制</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${empty requestScope.get('results')}">
        <p>在当前方法中找不到结果。请尝试其他方法。</p>
    </c:if>

    <button class="ui button" style="text-align: center;"><a href="${pageContext.request.contextPath}/index.jsp">返回RPS首页</a></button>


</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</body>

<%@include file="/footer.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/semantic.min.js"></script>
<script>
    var clipboard = new ClipboardJS('.ui button');

    clipboard.on('success', function (e) {
        console.log(e);
        console.info('Action:', e.action);
        console.info('Text:', e.text);
        console.info('Trigger:', e.trigger);
        copyResult();
    });

    clipboard.on('error', function (e) {
        console.log(e);
        console.error('Action:', e.action);
        console.error('Trigger:', e.trigger);
        copyFailure();
    });
</script>
<script>
    function copyResult() {
        Notiflix.Notify.success(
            '复制成功', {
                timeout: 2000,
            },
        );
    }

    function copyFailure() {
        Notiflix.Notify.failure(
            '复制失败，请手动复制', {
                timeout: 5000,
            },
        );
    }
</script>
</html>
