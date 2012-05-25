<%@ page import="pojo.SiteUser" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: 下午3:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>网站首页2</title>
    <style type="text/css">
        <!--
        .STYLE1 {font-size: 24px}
        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="container_1">
    <div class="STYLE1" id="header_1">
        <table width="900" height="195" border="0">
            <tr>
                <td width="717" height="191">&nbsp;</td>
                <td width="218" class="STYLE3"><p>&nbsp;</p>
                    <p align="center">2012年5月20日</p>
                    <p align="center">星期日</p>
                    <p align="center">&nbsp;</p>
                    <%if(((SiteUser) session.getAttribute("user")).getUsername()!=null){%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                    <%}%>
            </tr>
        </table>
    </div>
    <div id="mainContent_1">
        <div id="sidebar_1">
            <div id="left">
                <div id="bar1" align="center" class="STYLE1">内部通知</div>
                <div id="bar2" align="center" class="STYLE1">最新公告</div>
                <div id="bar3" align="center" class="STYLE1">图片新闻</div>
                <div id="bar4" align="center" class="STYLE1">新闻快讯</div>
                <div id="bar5" align="center" class="STYLE1">成果聚焦</div>
            </div>
        </div>
        <div class="STYLE1" id="content_2">详细内容分条显示框</div>
    </div>
    <div id="footer_1">
        <div align="center">
            <p>维护邮箱：wangyan_megan@yeah.net</p>
            <p><a href="feedback.jsp">用户反馈</a></p>
        </div>
    </div>
</div>
</body>
</html>