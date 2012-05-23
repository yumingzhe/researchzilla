<%--
  User: wangyan
  Date: 12-5-21
  Time: 下午3:12
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
        }
        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 36px;
            font-weight: bold;
        }
        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<s:actionerror/>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE2">登录窗口</div>
    </div>
    <div id="mainContent_2">
        <div align="center">
            <form action="LoginAction" method="post" name="loginform" class="STYLE1" id="loginform">
                <table width="304" height="92" border="2" align="center">
                    <tr>
                        <td width="86" class="STYLE1">用户名</td>
                        <td width="200"><label>
                            <input name="username" type="text" class="STYLE1" id="username" size="20" maxlength="20" />
                        </label></td>
                    </tr>
                    <tr>
                        <td height="41" class="STYLE1">密 码</td>
                        <td><label>
                            <input name="password" type="password" class="STYLE1" id="password" size="20" maxlength="20" />
                        </label></td>
                    </tr>
                </table>
                <table width="303" height="95" border="0">
                    <tr>
                        <td width="147" height="39"><label>
                            <div align="center">
                              <input name="submit" type="submit" class="STYLE1" id="submit" value="登录" />
                                </div>
                        </label></td>
                      <td width="146"><label>
                            <input name="reset" type="reset" class="STYLE1" id="reset" value="重置" />
                        </label>
                        </td>
                    </tr>
                    <tr>
                        <td height="50"><div align="center" class="STYLE1"><a href="forgetpassword.jsp">忘记密码？</a></div></td>
                        <td><div align="center" class="STYLE1"><a href="register.jsp">注册</a></div></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>