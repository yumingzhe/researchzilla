<%--
  User: wangyan
  Date: 12-5-30
  Time: 下午1:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>网站链接添加页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        .STYLE3 {font-size: 18px; font-weight: bold; }
        -->
    </style>
</head>
<body>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">添加链接界面</div>
    </div>
    <div id="mainContent_2">
        <form id="addmessageform" name="addmessageform" method="post"   action="LinkAction.action">
            <table width="623" height="406" border="0" align="center">
                <tr>
                    <td width="184"><div align="center" class="STYLE3">网站标题</div></td>
                    <td width="429"><label>
                        <input name="title" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">网站url</div></td>
                    <td><label>
                        <input name="url" type="text" class="STYLE3" />
                    </label></td>
                </tr>

                <tr>
                    <td height="28"><label>
                        <div align="center" class="sfhover">
                            <input name="Submit" type="submit" class="STYLE3" value="提交" />
                        </div>
                    </label></td>
                    <td><label>
                        <div align="center">
                            <input name="Reset" type="reset" class="STYLE3" value="重置" />
                        </div>
                    </label></td>
                </tr>
            </table>
            <p>&nbsp;</p>
        </form>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>