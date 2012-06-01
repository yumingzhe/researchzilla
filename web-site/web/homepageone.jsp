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
<%@ page pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
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
    <style type="text/css">
        <!--
        .STYLE4 {
            font-size: 30px;
            font-weight: bold;
        }

        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE5 {
            font-size: 16px;
            font-weight: bold;
            color: #FF0000;
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

                    <p align="center" class="STYLE4"><%=session.getAttribute("websitename")%>
                    </p>

                    <p align="center">&nbsp;</p>
                    <%if ((session.getAttribute("user")) != null) {%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！<a href="http://localhost:8080/ExitAction.action">退出</a></p>
                    <p align="center"> <a href="#">个人主页</a></p>
                    <%} else {%>
                    <p align="center"><a href="login.jsp">登录</a> <a href="register.jsp">注册</a> </p>
                </td>
                <%}%>

            </tr>
        </table>
    </div>
    <div id="mainContent">
        <div id="sidebar">
            <%if ((session.getAttribute("user")) == null) {%>
            <div id="sidebar1">
                <form action="LoginAction.action" method="post" name="form1" class="STYLE1" id="form1">
                    <p class="STYLE3">登录窗口</p>
                    <table width="276" height="74" border="0">
                        <tr>
                            <td width="69" class="STYLE1">用户名</td>
                            <td ><label>
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
            <div class="STYLE3" id="sidebar1">
                <a href="http://localhost:8080/GetInternalNoticeAction!getSomeResult.action">内部通知</a>
                <marquee direction="up" behavior="scroll" scrollamount="2" onMouseOver="this.stop()"
                         onMouseOut="this.start()">
                    <table width="278" height="190" border="0" class="STYLE5" >
                        <%
                            List<Message> internalnotices = (List<Message>) session.getAttribute("internalnotices");
                            for (int i = 0; i < internalnotices.size(); i++) {
                        %>
                        <tr>
                            <td>
                                <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult.action?internalnoticeid=<%=internalnotices.get(i).getId()%>"><%= internalnotices.get(i).getTopic()%>
                                </a>
                            </td>
                        </tr>
                        <%}%>
                    </table>
                </marquee>
            </div>
            <%}%>
            <div class="STYLE3" id="sidebar2">网址导航
                <table width="278" height="190" border="1" class="STYLE2">
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
                    <%if(application.getAttribute("count")!=null){%>
                    <%=application.getAttribute("count")%>
                    <%}else{%>
                        0
                    <%}%>
                </p>
            </div>
        </div>
        <div id="sidebar4">
            <div class="STYLE3" id="content3"><a
                    href="http://localhost:8080/GetPublicNoticeAction!getSomeResult.action">最新公告</a>
                <table width="306" height="255" border="1" class="STYLE2">
                    <%
                        List<Message> publicnotices = (List<Message>) session.getAttribute("publicnotices");
                        for (int i = 0; i < publicnotices.size(); i++) {
                    %>
                    <tr>
                        <td>
                            <%= publicnotices.get(i).getType()%>
                        </td>
                        <td>
                            <a href="http://localhost:8080/GetPublicNoticeAction!getOneResult.action?publicnoticeid=<%=publicnotices.get(i).getId()%>"><%= publicnotices.get(i).getTopic()%>
                            </a>
                        </td>
                    </tr>
                    <%}%>
                </table>
            </div>
            <div class="STYLE3" id="content4"><a href="http://localhost:8080/GetAccomplishmentAction!getSomeResult.action">成果聚焦</a></div>
        </div>
        <div id="content">
            <div class="STYLE3" id="content1"><a href="http://localhost:8080/GetPictureNewsAction!getSomeResult.action">图片新闻</a>

              <%--  <div id="featured">
                    <div class="content" style="">
                        <h1>Orbit does content now.</h1>
                        <h3>Highlight me...I'm text.</h3>
                    </div>
                    <a href=""><img src="img/1338339790671_min.jpg" alt="Overflow: Hidden No More" /> </a>
                    <img src="img/1338339611828_min.jpg"  alt="HTML Captions" />
                    <img src="img/1338348321156_min.jpg" alt="and more features" />
                </div>--%>
            </div>
            <div class="STYLE3" id="content2"><a href="http://localhost:8080/GetNewsAction!getSomeResult.action">新闻快讯</a>
                <table width="334" height="255" border="1" class="STYLE2">
                    <%
                        List<Message> news = (List<Message>) session.getAttribute("news");
                        for (int i = 0; i < news.size(); i++) {
                    %>
                    <tr>
                        <td>
                            <%= news.get(i).getType()%>
                        </td>
                        <td>
                            <a href="http://localhost:8080/GetNewsAction.action!getOneResult.action?newsid=<%=news.get(i).getId()%>"> <%= news.get(i).getTopic()%></a>
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