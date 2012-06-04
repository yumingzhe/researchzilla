<%--
  User: wangyan
  Date: 12-5-30
  Time: 下午1:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>文本信息添加页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        .STYLE2 {font-size: 18px; font-weight: bold;background-image: url("img/menu.jpg"); }
        .STYLE3 {font-size: 18px; font-weight: bold; }
        -->
    </style>
</head>
<body>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">添加文本消息界面</div>
    </div>
    <div class="STYLE2" height="30"></div>
    <div id="mainContent_2">
        <form id="addmessageform" name="addmessageform" enctype="multipart/form-data" method="post" action="doaddtextmessage.jsp">
            <table width="623" height="406" border="0" align="center">
                <tr>
                    <td width="184"><div align="center" class="STYLE3">标题*</div></td>
                    <td width="429"><label>
                        <input name="topic" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">文本类型*</div></td>
                    <td><label>
                        <select name="type" class="STYLE3">
                            <option value="internalnotice">internalnotice</option>
                            <option value="publicnotice">publicnotice</option>
                            <option value="news">news</option>
                        </select>
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">作者*</div></td>
                    <td><label>
                        <input name="author" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">发布者*</div></td>
                    <td><label>
                        <input name="publisher" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">内容*</div></td>
                    <td><label>
                        <textarea name="content" cols="50" rows="15" class="STYLE3"></textarea>
                    </label></td>
                </tr>

                <tr>
                    <td height="28"><div align="center" class="STYLE3">附件*</div></td>
                    <td><input name="accessory" type="file" class="STYLE3" /></td>
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
        <p align="center" class="STYLE3">带*的为必填项</p>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>