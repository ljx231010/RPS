
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <!-- <meta charset="UTF-8"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/semantic.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/images/favicon.ico"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/me.css">
    <title>Yen-K</title>
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

        table {
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }

        table td, table th {
            border: 1px solid #cad9ea;
            color: #666;
            height: 30px;
        }

        table thead th {
            background-color: #CCE8EB;
            width: 100px;
        }

        table tr:nth-child(odd) {
            background: #fff;
        }

        table tr:nth-child(even) {
            background: #F5FAFA;
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
            margin: 0 auto;
        }

        .msg {
            display: inline-block;
            color: green;
            background-size: 20px;
            padding-left: 30px;
        }

        .wrong {
            color: red;
        }
    </style>
</head>
<body class="bg1">
<%@include file="nav.jsp" %>
<div class="ui container" id ="mainDiv" style="margin-top: 5em; width: 70%;">
    <h3 class="ui header" style="text-align: left;">
        <i class="paper plane icon"></i>路径搜索
    </h3>
    <div class="ui fluid segment SEARCH m-text-font attached"
         style="width: 100%">
        <form class="ui form" id="myForm" action="${pageContext.request.contextPath}/YenK">
            <div class="field">
                <h4 class="ui header">起始化合物的KEGG ID:</h4>
                <div class="ui input ">
                    <input name="startCompound" id="startCompound" type="text" onblur="checkStart()"
                           placeholder="For example: C00022">
                </div>
                <p id="start_info"></p>
            </div>
            <div class="field">
                <h4 class="ui header">目标化合物的KEGG ID:</h4>
                <div class="ui input ">
                    <input name="endCompound" id="endCompound" type="text" onblur="checkEnd()"
                           placeholder="For example: C00183">
                </div>
                <p id="end_info"></p>
            </div>
            <div class="field">
                <h4 class="ui header">k的值:</h4>
                <div class="ui input ">
                    <input name="k" id="k" type="text"
                           placeholder="For example: 4" onblur="checkK()">
                </div>
                <p id="k_info"></p>
            </div>
            <button class="ui teal basic center aligned button formsubmit"
                    id="formsubmit" onclick="submit_form()" type="button"
                    value="Submit">提交
            </button>
        </form>
    </div>
    <h3 class="ui header">
        <i class="bell outline icon"></i>运行参数
    </h3>
    <table class="ui celled table" style="font-size: 16px;text-align: center">
        <thead>
        <colgroup>
            <col style="width: 10%;" />
            <col style="width: 30%;" />
            <col style="width: 60%;" />
        </colgroup>
        <tr>
            <th></th>
            <th>选项</th>
            <th>描述</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>1</td>
            <td>起始化合物</td>
            <td>KEGG数据库中化合物ID</td>
        </tr>
        <tr>
            <td>2</td>
            <td>目标化合物</td>
            <td>KEGG数据库中化合物ID</td>
        </tr>
        <tr>
            <td>3</td>
            <td>k的值</td>
            <td>k条最短路径</td>
        </tr>
        </tbody>
    </table>
    <br>
    <br>
    <br>
</div>
<br>
<br>
<br>

<div data-role="content" style="display:none;" id="formResponse">
    <br />
    <br />
    <br />
    <p style="font-size: 24px;">程序正在运行，请稍候。。。</p>
    <p style="font-size: 24px;">您的输入如下：</p>
    <ul>
        <li><span style="font-size: 20px;">起始化合物&nbsp;:&nbsp;</span><span style="font-weight: bold;" id="yourStart"></span></li>
        <br><li><span style="font-size: 20px;">目标化合物&nbsp;:&nbsp;</span><span style="font-weight: bold;" id="yourTarget"></span></li>
        <br><li><span style="font-size: 20px;">k的值&nbsp;:&nbsp;</span><span style="font-weight: bold;" id="yourK"></span>
    </ul>
    <br><br /><br />
    <br><br /><br />
    <br><br /><br />
    <br><br /><br />
</div>
</body>
<br>
<br>
<br>
<%@include file="footer.jsp" %>
<script src="./static/js/jquery.min.js"></script>
<script
        src="./static/js/semantic.min.js"></script>
<script>
    $('.wechat').popup({
        popup: $('.wechat-qr'),
        position: "right center"
    });
</script>
<script>
    function checkStart() {
        var start = document.getElementById('startCompound').value;
        var patternCompound = new RegExp("^C[0-9]{5}$");
        start_info = document.getElementById('start_info');
        if (!patternCompound.test(start)) {
            start_info.setAttribute("style", 'color:red');
            start_info.innerHTML = "起始化合物应满足标准KEGG ID，例如，KEGG中的C00011表示二氧化碳.更多细节请见https://www.kegg.jp/";
            return false;
        } else {
            start_info.innerHTML = "";
            return true;
        }
    }

    function checkEnd() {
        var end = document.getElementById('endCompound').value;
        var patternCompound = new RegExp("^C[0-9]{5}$");
        end_info = document.getElementById('end_info');
        if (!patternCompound.test(end)) {
            end_info.setAttribute("style", 'color:red');
            end_info.innerHTML = "目标化合物应满足标准KEGG ID，例如，KEGG中的C00011表示二氧化碳.更多细节请见https://www.kegg.jp/";
            return false;
        } else {
            end_info.innerHTML = "";
            return true;
        }
    }

    function checkK() {
        var k = document.getElementById('k').value;
        var kInfo = document.getElementById('k_info');
        if (isNaN(parseInt(k)) || (parseInt(k) !== parseFloat(k))) {
            kInfo.className = '错误';
            kInfo.innerHTML = '请将k的值输入为整数！';
            return false;
        } else {
            if (kInfo.className === 'msg wrong') {
                kInfo.innerHTML = "";
            }
            document.getElementById("formsubmit").removeAttribute('disabled');
            return true;
        }
    }

    function submit_form() {
        var startFlag = checkStart();
        var endFlag = checkEnd();
        var kFlag = checkK();
        if (startFlag === true && endFlag === true && kFlag === true) {
            document.getElementById("myForm").submit();
            document.getElementById("formsubmit").disabled = "disabled";
            afterSubmit();
        }
    }
    function afterSubmit() {
        document.getElementById('yourStart').innerText = document.getElementById('startCompound').value;
        document.getElementById('yourTarget').innerText = document.getElementById('endCompound').value;
        document.getElementById('yourK').innerText = document.getElementById('k').value;
        document.getElementById('formResponse').style.removeProperty('display');
        document.getElementById('mainDiv').style.display = 'none';
    }

</script>
</html>
