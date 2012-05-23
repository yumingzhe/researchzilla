<%--
  User: wangyan
  Date: 12-5-22
  Time: 下午3:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>用户注册页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }

        .STYLE3 {
            font-size: 18px;
            font-weight: bold;
        }

        -->
    </style>
</head>
<body>
<s:actionerror/>
<s:fielderror/>
<s:actionmessage/>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">用户注册界面</div>
    </div>
    <div id="mainContent_2">
        <form id="registerform" name="registerform" method="post" action="RegisterAction.action">
            <p align="center" class="STYLE3">请输入您的注册信息：</p>
            <table width="384" height="406" border="0" align="center">
                <tr>
                    <td width="134">
                        <div align="center" class="STYLE3">用户名*</div>
                    </td>
                    <td width="240"><label>
                        <input id="username" name="username" type="text" class="STYLE3"/>
                    </label></td>
                </tr>
                <tr>
                    <td>
                        <div align="center" class="STYLE3">密码*</div>
                    </td>
                    <td><label>
                        <input id="password" name="password" type="password" class="STYLE3"/>
                    </label></td>
                </tr>
                <tr>
                    <td>
                        <div align="center" class="STYLE3">重复密码*</div>
                    </td>
                    <td><label>
                        <input id="repassword" name="repassword" type="password" class="STYLE3"/>
                    </label></td>
                </tr>
                <tr>
                    <td>
                        <div align="center" class="STYLE3">注册邮箱*</div>
                    </td>
                    <td><label>
                        <input id="email" name="email" type="text" class="STYLE3"/>
                    </label></td>
                </tr>
                <tr>
                    <td>
                        <div align="center" class="STYLE3">用户ID号</div>
                    </td>
                    <td><label>
                        <input id="instituteId" name="instituteId" type="text" class="STYLE3"/>
                    </label></td>
                </tr>

                <tr>
                    <td height="28"><label>
                        <div align="center" class="sfhover">
                            <input name="Submit" type="submit" class="STYLE3" value="提交"/>
                        </div>
                    </label></td>
                    <td><label>
                        <div align="center">
                            <input name="Reset" type="reset" class="STYLE3" value="重置"/>
                        </div>
                    </label></td>
                </tr>
            </table>
            <p>&nbsp;</p>
        </form>
        <p align="center" class="STYLE3">带*的为必填项</p>
    </div>
</div>
</body>
</html>