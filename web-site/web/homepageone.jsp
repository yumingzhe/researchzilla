<%@ page import="pojo.SiteUser" %>
<%--
  User: wangyan
  Date: 12-5-22
  Time: 下午2:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>网站首页1</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px
        }

        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css"/>
    <meta name="Keywords" content=""/>
    <meta name="" content=""/>
    <meta name="author" content=""/>
    <meta name="Description" content=""/>
    <style type="text/css">
        <!--
        .STYLE3 {
            font-size: 20px;
            font-weight: bold;
        }

        -->
    </style>
</head>
<body>
<div id="container">
    <div class="STYLE1" id="header">
        <table width="945" height="195" border="0">
            <tr>
                <td width="717" height="191">&nbsp;</td>
                <td width="218" class="STYLE3"><p>&nbsp;</p>

                    <p align="center">2012年5月20日</p>

                    <p align="center">星期日</p>

                    <p align="center">&nbsp;</p>
                    <%if (((SiteUser) session.getAttribute("user")).getUsername() != null) {%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                    <%} else {%>
                    <p align="center"><a href="login.jsp">登录</a> <a href="register.jsp">注册</a></p></td>
                <%}%>

            </tr>
        </table>
    </div>
    <div id="mainContent">
        <div id="sidebar">
            <%if (((SiteUser) session.getAttribute("user")).getUsername() == null) {%>
            <div id="sidebar1">
                <form action="LoginAction" method="post" name="form1" class="STYLE1" id="form1">
                    <p class="STYLE3">登录窗口</p>
                    <table width="278" height="74" border="0">
                        <tr>
                            <td width="69" class="STYLE1">用户名</td>
                            <td width="199"><label>
                                <input name="username" type="text" class="STYLE1" id="username" size="20"
                                       maxlength="20"/>
                            </label></td>
                        </tr>
                        <tr>
                            <td class="STYLE1">密 码</td>
                            <td><label>
                                <input name="password" type="password" class="STYLE1" size="20" maxlength="20"/>
                            </label></td>
                        </tr>
                    </table>
                    <table width="276" height="72" border="0">
                        <tr>
                            <td width="133" height="39"><label>
                                <input name="submit" type="submit" class="STYLE1" id="submit" value="登录"/>
                            </label></td>
                            <td width="133"><label>
                                <input name="reset" type="reset" class="STYLE1" id="reset" value="重置"/> </label></td>
                        </tr>
                        <tr>
                            <td>
                                <div align="center" class="STYLE1"><a href="forgetpassword.jsp">忘记密码？</a></div>
                            </td>
                            <td>
                                <div align="center" class="STYLE1"><a href="register.jsp">注册</a></div>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <%} else {%>
            <div class="STYLE1" id="sidebar1">内部通知</div>
            <%}%>
            <div class="STYLE1" id="sidebar2">网址导航</div>
            <div class="STYLE1" id="sidebar3">网站访问统计</div>
        </div>
        <div id="sidebar4">
            <div class="STYLE1" id="content3">最新公告</div>
            <div class="STYLE1" id="content4">成果聚焦</div>
        </div>
        <div id="content">
            <div class="STYLE1" id="content1">图片新闻</div>
            <div class="STYLE1" id="content2">新闻快讯</div>
        </div>
    </div>
    <div id="footer">
        <div align="center">
            <p>维护邮箱：wangyan_megan@yeah.net</p>

            <p><a href="feedback.jsp">用户反馈</a></p>
        </div>
    </div>
</div>
</body>
</html>