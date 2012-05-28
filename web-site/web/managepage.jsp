<%@ page import="pojo.WebsiteMessage" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: 下午3:50
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>后台管理页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        .STYLE2 {font-size: 16px}
        -->
    </style>
</head>
<body>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">后台管理</div>
    </div>
    <div id="menu">
        <ul id="nav">
            <li><a href="#" class="STYLE2">用户信息管理</a>
                <ul>
                    <li><a href="#">查看用户</a></li>
                    <li><a href="#">添加用户</a></li>
                    <li><a href="#">修改用户</a></li>
                    <li><a href="#">删除用户</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">网站信息管理</a>
                <ul>
                    <li><a href="#">添加信息</a></li>
                    <li><a href="#">修改信息</a></li>
                    <li><a href="#">删除信息</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">系统信息维护</a>
                <ul>
                    <li><a href="http://localhost:8080/BasicDesignAction?getOldWebsiteMessage">基本信息设置</a></li>
                    <li><a href="#">统计信息总览</a></li>
                </ul>
            </li>
            <li><a href="feedbackshow.jsp" class="STYLE2">用户反馈信息</a></li>
        </ul>
    </div>
    <div id="mainContent_2">
        <%if(session.getAttribute("websitemessage")!=null){%>
        <form id="form1" name="form1" method="post" action="BasicDesignAction.action">
            <table width="543" height="239" border="0" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE8">网站标题：</td>
                    <td width="362"><label class="STYLE8">
                        <input name="websitename" type="text" class="STYLE8" value="<%=((WebsiteMessage)session.getAttribute("websitemessage")).getWebsitename()%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">网站背景图片：</td>
                    <td><label>
                        <input name="backgroundimage" type="file" class="STYLE8" value="<%=((WebsiteMessage)session.getAttribute("websitemessage")).getBackground()%>" />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">网站维护组邮箱：</td>
                    <td><label>
                        <input name="maintenanceaddress" type="text" class="STYLE8" value="<%=((WebsiteMessage)session.getAttribute("websitemessage")).getMaintenanceaddress()%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">网站默认语言：</td>
                    <td><label>
                        <select name="defaultlanguage" value="<%=((WebsiteMessage)session.getAttribute("websitemessage")).getDefaultlanguage()%>">
                            <option value="Chinese">Chinese</option>
                            <option value="English">English</option>
                        </select>
                    </label></td>
                </tr>
            </table>
            <p align="center" class="STYLE5">
                <label>
                    <input name="Submit" type="submit" class="STYLE8" value="更新" />
                </label>
            </p>
        </form>
       <%}%>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>