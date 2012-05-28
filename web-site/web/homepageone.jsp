<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Link" %>
<%--
  User: wangyan
  Date: 12-5-22
  Time: 下午2:41
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><%=session.getAttribute("websitename")%>
    </title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px
        }

        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 14px
        }

        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css"/>
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
                <td width="218" class="STYLE3">
                    <p>&nbsp;</p>

                    <p align="center"><%=session.getAttribute("websitename")%>
                    </p>

                    <p align="center">&nbsp;</p>
                    <%if ((session.getAttribute("user")) != null) {%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                    <p align="center"> <a href="#">个人主页</a></p>
                    <%} else {%>
                    <p align="center"><a href="login.jsp">登录</a> <a href="register.jsp">注册</a> <a href="#">退出</a></p>
                </td>
                <%}%>

            </tr>
        </table>
    </div>
    <div id="mainContent">
        <div id="sidebar">
            <%if ((session.getAttribute("user")) == null) {%>
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
            <div class="STYLE3" id="sidebar1"><a
                    href="http://localhost:8080/GetInternalNoticeAction!getAllResult">内部通知</a>
                <marquee direction="up" behavior="scroll" scrollamount="2" onMouseOver="this.stop()"
                         onMouseOut="this.start()">
                    <table width="278" height="190" border="0" class="STYLE2">
                        <%
                            List<Message> internalnotices = (List<Message>) session.getAttribute("internalnotices");
                            for (int i = 0; i < internalnotices.size(); i++) {
                        %>
                        <tr>
                            <td>
                                <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult?internalnoticeid=<%=internalnotices.get(i).getId()%>"><%= internalnotices.get(i).getTopic()%>
                                </a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </marquee>
            </div>
            <%}%>
            <div class="STYLE3" id="sidebar2">网址导航
                <table width="278" height="190" border="0" class="STYLE2">
                    <%
                        List<Link> links = (List<Link>) session.getAttribute("links");
                        for (int i = 0; i < links.size(); i++) {
                    %>
                    <tr>
                        <td>
                            <a href="<%=links.get(i).getWebsiteurl()%>"><%= links.get(i).getWebsitename()%></a>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="STYLE3" id="sidebar3">网站访问统计
                <p align="center">本网站总访问量
                    <%=session.getAttribute("visits")%>
                </p>
            </div>
        </div>
        <div id="sidebar4">
            <div class="STYLE3" id="content3"><a
                    href="http://localhost:8080/GetPublicNoticeAction!getAllResult">最新公告</a>
                <table width="306" height="255" border="0" class="STYLE2">
                    <%
                        List<Message> publicnotices = (List<Message>) session.getAttribute("publicnotices");
                        for (int i = 0; i < publicnotices.size(); i++) {
                    %>
                    <tr>
                        <td>
                            <%= publicnotices.get(i).getType()%>
                        </td>
                        <td>
                            <a href="http://localhost:8080/GetPublicNoticeAction!getOneResult?publicnoticeid=<%=publicnotices.get(i).getId()%>"><%= publicnotices.get(i).getContent()%>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="STYLE3" id="content4"><a href="#">成果聚焦</a></div>
        </div>
        <div id="content">
            <div class="STYLE3" id="content1"><a href="#">图片新闻</a></div>
            <div class="STYLE3" id="content2"><a href="http://localhost:8080/GetNewsAction!getAllResult">新闻快讯</a>
                <table width="334" height="255" border="0" class="STYLE2">
                    <%
                        List<Message> news = (List<Message>) session.getAttribute("news");
                        for (int i = 0; i < news.size(); i++) {
                    %>
                    <tr>
                        <td>
                            <%= news.get(i).getType()%>
                        </td>
                        <td>
                            <a href="http://localhost:8080/GetNewsAction!getOneResult?newsid=<%=news.get(i).getId()%>"> <%= news.get(i).getContent()%></a>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>

        </div>
    </div>
    <div id="footer">
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