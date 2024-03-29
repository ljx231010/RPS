<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/semantic.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/notiflix-3.2.5.min.css">
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/semantic.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/notiflix-3.2.5.min.js" type="text/javascript"></script>
    <title>首页</title>
    <style type="text/css">

        .m-text-font {
            font-size: 1em;
        }

        .button {
            background-color: transparent;
            border: none;
            color: black;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }

        .button:hover {
            background-color: transparent;
            border: 2px solid #e7e7e7;
            color: black;
        }

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

        hr {
            width: 80%;
            margin: 0 auto;
            border: 0;
            height: 0;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            border-bottom: 1px solid rgba(255, 255, 255, 0.3);
        }

        div {
            width: 75%;
        }

        .description {
        }

        .example {
        }

        .SEARCH {
        }

    </style>

</head>
<body class="bg1">
<%@include file="nav.jsp" %>
<div class="ui container" id="mainDiv" style="margin-top: 4em; width: 70%;">
<%--    <h2 class="ui header">--%>
<%--        <i class="registered icon"></i>Recommend--%>
<%--    </h2>--%>
    <div class="ui fluid segment SEARCH m-text-font" style="width: 100%">
        <form class="ui form" id="myForm" action="${pageContext.request.contextPath}/pathMain" method="post">
            <div class="field">
                <h3 class="ui header">由KEGG ID标识组成的路径:</h3>
                <div class="ui input ">
                    <input name="path" id="path" type="text"
                           placeholder="For example: C00065->R00586->C00979->R00897->C00097">
                </div>
                <p id="start_info"></p>
            </div>
            <div class="ui accordion">
                <div class="title">
                    <i class="dropdown icon"></i>
                    <b>自定义参数权重</b>
                </div>
                <div class="content">
                    <br>
                    <label><b>路径中内源反应占比权重:&nbsp;&nbsp;&nbsp;</b></label>
                    <input type="number" name="inOut" value="0.4" style="width: 80px;" id="inOut" min="0.0" max=1
                           step="0.1"/><br/><br/><br>
                    <label><b>途径末端代谢物权重:&nbsp;&nbsp;&nbsp;</b></label>
                    <input type="number" name="subAndProduct" value="0.2" style="width: 80px;" id="subAndProduct"
                           min="0.0" max=1
                           step="0.1"/><br/><br/><br>
                    <label><b>竞争性内源发应权重:&nbsp;&nbsp;&nbsp;</b></label>
                    <input type="number" name="compete" value="0.4" style="width: 80px;" id="compete" min="0.0" max=1
                           step="0.1"/><br/><br/>
                </div>
            </div>
            </br>
            <button class="ui teal basic center aligned button formsubmit" id="formsubmit"
                    onclick="submit_form1()" type="button" value="Submit">提交
            </button>
        </form>
    </div>
</div>

<div class="ui container" id="exampleDiv" style="margin-top: 5em; width: 70%;">
    <table class="ui celled table" id="example_list">
        <thead>
        <tr>
            <th class="two wide column">实例</th>
            <th class="eight wide column">路径</th>
            <%--                <th>Range</th>--%>
            <th class="two wide column">结果</th>
        </tr>
        <tr>
            <td>
                实例1
            </td>
            <td>
                <a href="https://www.genome.jp/entry/C00022" style="text-decoration: none;"
                   target="_blank">C00022</a>-&gt;<a href="https://www.genome.jp/entry/R00006"
                                                     style="text-decoration: none;"
                                                     target="_blank">R00006</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00900" style="text-decoration: none;"
                    target="_blank">C00900</a>-&gt;<a href="https://www.genome.jp/entry/R03051"
                                                      style="text-decoration: none;" target="_blank">R03051</a>-&gt;<a
                    href="https://www.genome.jp/entry/C04039" style="text-decoration: none;"
                    target="_blank">C04039</a>-&gt;<a href="https://www.genome.jp/entry/R01209"
                                                      style="text-decoration: none;" target="_blank">R01209</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00141" style="text-decoration: none;"
                    target="_blank">C00141</a>-&gt;<a href="https://www.genome.jp/entry/R01434"
                                                      style="text-decoration: none;" target="_blank">R01434</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00183" style="text-decoration: none;"
                    target="_blank">C00183</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/html/result/result1.html" target="_blank">查看</a>
            </td>
        </tr>
        <tr>
            <td>
                实例2
            </td>
            <td>
                <a href="https://www.genome.jp/entry/C00074" style="text-decoration: none;"
                   target="_blank">C00074</a>-&gt;<a href="https://www.genome.jp/entry/R00199"
                                                     style="text-decoration: none;"
                                                     target="_blank">R00199</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00022" style="text-decoration: none;"
                    target="_blank">C00022</a>-&gt;<a href="https://www.genome.jp/entry/R00209"
                                                      style="text-decoration: none;" target="_blank">R00209</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00024" style="text-decoration: none;"
                    target="_blank">C00024</a>-&gt;<a href="https://www.genome.jp/entry/R00351"
                                                      style="text-decoration: none;" target="_blank">R00351</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00158" style="text-decoration: none;"
                    target="_blank">C00158</a>-&gt;<a href="https://www.genome.jp/entry/R01325"
                                                      style="text-decoration: none;" target="_blank">R01325</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00417" style="text-decoration: none;"
                    target="_blank">C00417</a>-&gt;<a href="https://www.genome.jp/entry/R01900"
                                                      style="text-decoration: none;" target="_blank">R01900</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00311" style="text-decoration: none;"
                    target="_blank">C00311</a>-&gt;<a href="https://www.genome.jp/entry/R00709"
                                                      style="text-decoration: none;" target="_blank">R00709</a>-&gt;<a
                    href="https://www.genome.jp/entry/C00026" style="text-decoration: none;"
                    target="_blank">C00026</a>-&gt;<a href="https://www.genome.jp/entry/R09784"
                                                      style="text-decoration: none;" target="_blank">R09784</a>-&gt;<a
                    href="https://www.genome.jp/entry/C06547" style="text-decoration: none;"
                    target="_blank">C06547</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/html/result/result2.html" target="_blank">查看</a>
            </td>
        </tr>
        </thead>
    </table>
</div>

<div data-role="content" style="display:none;" id="formResponse">
    <br/>
    <br/>
    <br/>
    <p style="font-size: 24px;">程序正在运行，请稍候。。。</p>
    <p style="font-size: 24px;">您的输入如下：</p>
    <ul>
        <li><span style="font-size: 20px;">路径&nbsp;:&nbsp;</span><span style="font-weight: bold;"
                                                                            id="yourPath"></span></li>
        <br>
        <li><span style="font-size: 20px;">路径中内源性反应占比权重&nbsp;:&nbsp;</span><span
                style="font-weight: bold;" id="yourInOut"></span></li>
        <br>
        <li><span style="font-size: 20px;">途径末端代谢物权重&nbsp;:&nbsp;</span><span
                style="font-weight: bold;" id="yourSubAndProduct"></span>
        </li>
        <br>
        <li><span style="font-size: 20px;">竞争性内源发应权重&nbsp;:</span><span
                style="font-weight: bold;" id="yourCompete"></span>
        </li>
    </ul>
    <br><br/><br/>
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ui.accordion').accordion({
            duration: 'click'
        });
    });
</script>
<script type="text/javascript">
    function submit_form1() {
        console.log(document.getElementById("inOut").value);
        console.log(document.getElementById("subAndProduct").value);
        console.log(document.getElementById("compete").value);
        var subAndProduct = document.getElementById("subAndProduct").value;
        var inout = document.getElementById("inOut").value;
        var compete = document.getElementById("compete").value;

        var patternNum = new RegExp("^\\d+(\\.\\d+)?$");
        if (document.getElementById("path").value === null) {
            Notiflix.Report.failure('路径错误', '路径输入为空，请输入', '是');
            return;
        }
        if (subAndProduct === "" || inout === "" || compete === "") {
            Notiflix.Report.failure('参数错误', '参数错误，检查并确认为数字', '是');
            return;
        }
        if (!patternNum.test(subAndProduct)||!patternNum.test(inout)||!patternNum.test(compete)){
            Notiflix.Report.failure('参数错误', '参数错误，检查并确认为数字', '是');
            return;
        }
        var flag = func1();
        if (flag === true) {
            document.getElementById("myForm").submit();
            document.getElementById("formsubmit").disabled = "disabled";
            afterSubmit();
        } else {
            Notiflix.Report.failure('路径错误', '路径的格式有问题，请检查', '是');
        }
    }

    function afterSubmit() {
        document.getElementById('yourPath').innerText = document.getElementById('path').value;
        document.getElementById('yourInOut').innerText = document.getElementById('inOut').value;
        document.getElementById('yourSubAndProduct').innerText = document.getElementById('subAndProduct').value;
        document.getElementById('yourCompete').innerText = document.getElementById('compete').value;
        document.getElementById('formResponse').style.removeProperty('display');
        document.getElementById('mainDiv').style.display = 'none';
        document.getElementById('exampleDiv').style.display = 'none';
    }

    function func1() {
        var p = document.getElementById("path").value;
        var list = p.split("->");
        console.log(list);
        if (list[1] === p)
            return false;
        var patternCompound = new RegExp("^C[0-9]{5}$");
        var patternReaction = new RegExp("^R[0-9]{5}$");
        let i = 0;
        while (i < list.length) {
            if (!patternCompound.test(list[i])) {
                return false;
            }
            i += 2;
        }
        let j = 1;
        while (j < list.length) {
            if (!patternReaction.test(list[j])) {
                return false;
            }
            j += 2;
        }
        if (!patternCompound.test(list[list.length - 1]))
            return false;
        return true;
    }
</script>
</html>
