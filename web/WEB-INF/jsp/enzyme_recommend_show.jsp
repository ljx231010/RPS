<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico"/>
    <style>
        table td {
            font-size: 16px;
            font-weight: bold;
            text-align: center;
        }

        table thead {
            font-size: 17px;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <title>外源酶推荐结果</title>
</head>
<body class="bg1">
<%@include file="/nav.jsp" %>

<div class="ui aligned container" style="margin-top: 5em; width: 80%; ">
    <h2 class="ui header" style="text-align: center">
        在<b>${requestScope.get("speciesName")}</b>中为外源反应<b>${requestScope.get("reactionId")}</b>的表达推荐的外源酶结果</h2>
    <br>
    <p style="margin-left: 35%;">
        <font size="5px">过滤器:&nbsp;&nbsp;</font>
    </p>
    <div class="field" style="text-align: center;margin-top: -1.1cm;">
        <select class="ui dropdown" id="select1" onchange="func2()">
            <option value="1">只有系统发育距离</option>
            <option value="2">只有Km值</option>
            <option value="3" selected="selected">组合(默认)</option>
        </select>
    </div>
    <table class="ui celled table" id="table1" hidden="hidden" style="text-align: center;">
            <thead>
            <tr>
                <th>排名 <span title="外源酶结果排名" style="cursor: help;" data-toggle="tooltip"
                               data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>酶 <span title="酶的EC编号" style="cursor: help;"
                                           data-toggle="tooltip"
                                           data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>来源生物 <span title="外源酶的来源生物" style="cursor: help;"
                                         data-toggle="tooltip"
                                         data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>距离 <span title="系统发育距离" style="cursor: help;" data-toggle="tooltip"
                                   data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>查看 <span title="相关链接" style="cursor: help;" data-toggle="tooltip"
                               data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="enzyme" items="${requestScope.get('distanceEnzymes')}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${enzyme.getEcNumber()}</td>
                    <td>${enzyme.getSourceOrganismName()}</td>
                    <td>${enzyme.getDistance()}</td>
                    <td>
                        <c:if test="${enzyme.getUrls()==null}">
                            -
                        </c:if>
                        <c:forEach var="url" items="${enzyme.getUrls()}">
                            <a href="${url.getWebSite()}" target="_blank">${url.getName()}</a>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty requestScope.get('distanceEnzymes')}">
                <tr>
                    <td colspan="5">没有结果</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <table class="ui celled table" id="table2" hidden="hidden" style="text-align: center;">
            <thead>
            <tr>
                <th>排名 <span title="外源酶结果排名" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>酶 <span title="酶的EC编号" style="cursor: help;"
                            data-toggle="tooltip"
                            data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>来源生物 <span title="外源酶的来源生物" style="cursor: help;"
                               data-toggle="tooltip"
                               data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>距离 <span title="系统发育距离" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>查看 <span title="相关链接" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="enzyme" items="${requestScope.get('dynamicsEnzymes')}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${enzyme.getEcNumber()}</td>
                    <td>${enzyme.getSourceOrganismName()}</td>
                    <td>${enzyme.getKm()}</td>
                    <td>
                        <c:if test="${enzyme.getUrls()==null}">
                            -
                        </c:if>
                        <c:forEach var="url" items="${enzyme.getUrls()}">
                            <a href="${url.getWebSite()}" target="_blank">${url.getName()}</a>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty requestScope.get('dynamicsEnzymes')}">
                <tr>
                    <td colspan="5">没有结果</td>
                </tr>
            </c:if>
            </tbody>
        </table>
        <table class="ui celled table" id="table3" style="text-align: center;">
            <thead>
            <tr>
                <th>排名 <span title="外源酶结果排名" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>酶 <span title="酶的EC编号" style="cursor: help;"
                            data-toggle="tooltip"
                            data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>来源生物 <span title="外源酶的来源生物" style="cursor: help;"
                               data-toggle="tooltip"
                               data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>距离 <span title="系统发育距离" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
                <th>查看 <span title="相关链接" style="cursor: help;" data-toggle="tooltip"
                             data-placement="right">
			<sup style="color:black;"><i class="question circle outline icon" aria-hidden="true"></i></sup></span></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="enzyme" items="${requestScope.get('collect')}" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${enzyme.getEcNumber()}</td>
                    <td>
                        <c:if test="${enzyme.getSourceOrganismId()!=null}">
                            ${enzyme.getSourceOrganismName()}
                        </c:if>
                        <c:if test="${enzyme.getSourceOrganismId()==null}">
                            ${enzyme.getSourceOrganismTaxName()}
                        </c:if>
                    </td>
                    <td>${enzyme.getScore()}</td>
                    <td>
                        <c:if test="${enzyme.getUrls()==null}">
                            -
                        </c:if>
                        <c:forEach var="url" items="${enzyme.getUrls()}">
                            <a href="${url.getWebSite()}" target="_blank">${url.getName()}</a>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty requestScope.get('collect')}">
                <tr>
                    <td colspan="5">没有结果</td>
                </tr>
            </c:if>
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
</body>v

<%@include file="/footer.jsp" %>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/semantic.min.js"></script>
<script>
    $('.ui.dropdown').dropdown();
</script>
<script>
    function func2() {
        console.log("func2");
        var value1 = document.getElementById("select1").value;
        var value = parseInt(value1);
        console.log(value);
        if (value === 1) {
            console.log("value===1");
            document.getElementById("table1").removeAttribute("hidden");
            document.getElementById("table2").hidden = "hidden";
            document.getElementById("table3").hidden = "hidden";
        } else if (value === 2) {
            console.log("value===2");
            document.getElementById("table2").removeAttribute("hidden");
            document.getElementById("table1").hidden = "hidden";
            document.getElementById("table3").hidden = "hidden";
        } else if (value === 3) {
            console.log("value===3");
            document.getElementById("table3").removeAttribute("hidden");
            document.getElementById("table1").hidden = "hidden";
            document.getElementById("table2").hidden = "hidden";
        }
    }
</script>
</html>

