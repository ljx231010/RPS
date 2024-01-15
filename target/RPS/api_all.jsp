<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.bootcss.com/semantic-ui/2.4.1/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico"/>
    <link rel="stylesheet" href="./static/css/me.css">
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
    <title>路径搜索方法</title>
</head>
<body class="bg1">
<%@include file="nav.jsp" %>
<br>
<h2 class="ui header" style="text-align: center;">使用RPS之前可供使用的一些路径搜索方法</h2>
<div class="ui center aligned container" style="margin-top: 4em;width: 75%">
    <table class="ui celled table" style="text-align: center">
        <thead>
        <tr>
            <th>方法 <span title="Path search method" style="cursor: help;" data-toggle="tooltip" data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            <th>介绍 <span title="Method introduction" style="cursor: help;" data-toggle="tooltip"
                                   data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            <th>文献 <span title="Literature corresponding to the method" style="cursor: help;" data-toggle="tooltip"
                                 data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            <th>搜索 <span title="Literature corresponding to the method" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>原子团跟踪</td>
            <td>跟踪化合物之间原子团的转移来选择路径</td>
            <td><a href="https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0168725" target="_blank">A Method for Finding
                Metabolic Pathways Using Atomic Group Tracking</a></td>
            <td>
                <button class="ui button" onclick="window.open('https://biolab.gxu.edu.cn/BPFinder/index.jsp')">使用</button>
            </td>
        </tr>
        <tr>
            <td>YenK</td>
            <td>K条最短路径算法</td>
            <td><a href="https://pubsonline.informs.org/doi/abs/10.1287/mnsc.17.11.712" target="_blank">Finding the K Shortest Loopless
                Paths in a Network</a></td>
            <td>
                <button class="ui button" onclick="window.open('YenK_api.jsp')">使用</button>
            </td>
        </tr>
        <tr>
            <td>AFP</td>
            <td>Atom-group Flux Pathfinder</td>
            <td>---</td>
            <td>
                <button class="ui button" onclick="window.open('https://biolab.gxu.edu.cn/AF/index.jsp')">使用</button>
            </td>
        </tr>
        </tbody>
    </table>
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
<br>
<br>
<br>
<br>
</body>
<%@include file="footer.jsp" %>
<script>
</script>
</html>
