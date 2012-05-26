<%@ page import="pojo.SiteUser" %>
<%--
  User: wangyan
  Date: 12-5-25
  Time: 下午8:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>详细内容显示界面</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
        }
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
                        <%if(( session.getAttribute("user"))!=null){%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                        <%}%>
            </tr>
        </table>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
        <table width="396" height="30" border="0" align="center" class="STYLE1">
            <tr>
                <td class="STYLE1">&nbsp;</td>
            </tr>
        </table>
        、
        <table width="745" height="463" border="0" align="center">
            <tr>
                <td height="459">&nbsp;</td>
            </tr>
        </table>
    </div>
    <div id="footer_1">
        <div align="center">
            <p>维护邮箱：
                <%=session.getAttribute("maintenanceaddress")%>
            </p>
            <p><a href="feedback.jsp">用户反馈</a></p>
        </div>
    </div>
</div>
</body>
</html>