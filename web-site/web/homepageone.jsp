<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.*" %>
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
    <title><%if(session.getAttribute("websitename")!=null){%>
        <%=session.getAttribute("websitename")%>
        <%}%>
    </title>
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
            font-size: 14px;

        }

        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        .STYLE3 {
            font-size: 20px;
            font-weight: bold;
            background-image: url("img/menu.jpg");
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
    <style type="text/css"> /* Css样式要放到页面头部，而且要加上<style> */
    .btn {
        color: #0000FF;
        background-image: url(img/button.bmp);
        line-height: 15px;
        height: 23px;
        width: 72px;
        font-size: 15px;
        font-weight: bold;
        margin: 10px 0 0 20px; /*margin-top 和 margin-left 一句就可以实现了 */
        border: none; /* border-top\left\right\bottom 也可以缩到一句 */
    }
    </style>
    <style type="text/css">
        <!--
        .STYLE6 {
            font-size: 20px;
            font-weight: bold;
        }

        -->
    </style>
</head>
<body>
<div id="container">
    <div class="STYLE1" id="header">
        <table width="960" height="195" border="2" bordercolor="#00CCFF">
            <tr>
                <%String imgUrl= (String) session.getAttribute("imagepath");%>
                <td width="700" height="191" align="center"><img src="<%=imgUrl%>" alt="images" /></td>
                <td width="250" class="STYLE6">
                    <p>&nbsp;</p>
                    <p align="center" class="STYLE4"><%=session.getAttribute("websitename")%></p>
                    <p>&nbsp;</p>
                    <p>&nbsp;</p>
                    <%if ((session.getAttribute("user")) != null) {%>
                    <p align="center"><a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=
                    <%=((SiteUser)session.getAttribute("user")).getUid()%>"><%=((SiteUser) session.getAttribute("user")).getUsername()%></a> 欢迎您登录本网站！<a href="http://localhost:8080/ExitAction.action">退出</a></p>
                    <p align="center"> </p>
                    <%} else {%>
                    <p align="center"><a href="login.jsp">登录</a> <a href="register.jsp">注册</a> </p>
                    <%}%>
                </td>
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
                                <input name="username" type="text" class="STYLE1" id="username" size="15"
                                       maxlength="15"/>
                            </label></td>
                        </tr>
                        <tr>
                            <td class="STYLE1">密 码</td>
                            <td><label>
                                <input name="password" type="password" class="STYLE1" size="15" maxlength="15"/>
                            </label></td>
                        </tr>
                    </table>
                    <table width="276" height="72" border="0">
                        <tr>
                            <td width="133" height="39"><label>
                                <input name="submit" type="submit" class="btn" id="submit" value="登录"/>
                            </label></td>
                            <td width="133"><label>
                                <input name="reset" type="reset" class="btn" id="reset" value="重置"/> </label></td>
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
                <a href="http://localhost:8080/GetInternalNoticeAction!getSomeResult.action">
                    <p class="STYLE3">内部通知</p></a>
                <marquee direction="up" behavior="scroll" scrollamount="2" onMouseOver="this.stop()"
                         onMouseOut="this.start()">
                    <table width="278"  border="0" class="STYLE5" >
                        <% if(session.getAttribute("internalnotices")!=null){
                            List<Message> internalnotices = (List<Message>) session.getAttribute("internalnotices");
                            for (int i = 0; i < internalnotices.size(); i++) {
                        %>
                        <tr>
                            <td height="30" align="center" class="STYLE5">
                                <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult.action?internalnoticeid=<%=internalnotices.get(i).getId()%>"><%= internalnotices.get(i).getTopic()%>
                                </a>
                            </td>
                        </tr>
                        <%}}%>
                    </table>
                </marquee>
            </div>
            <%}%>
            <div class="STYLE3" id="sidebar2">
                <p class="STYLE3">网址导航</p>
                <table width="276" border="2" bordercolor="#00CCFF" class="STYLE2">
                    <% if(session.getAttribute("links")!=null){
                        List<Link> links = (List<Link>) session.getAttribute("links");
                        for (int i = 0; i < links.size(); i++) {
                    %>
                    <tr>
                        <td height="30" align="center">
                            <a href="<%=links.get(i).getWebsiteurl()%>"><%= links.get(i).getWebsitename()%></a>
                        </td>
                    </tr>
                    <%}}%>
                </table>
            </div>
            <div class="STYLE3" id="sidebar3">
                <p class="STYLE3">网站访问统计</p>
                <p align="center">&nbsp;</p>
                <p align="center">本网站总访问量
                    <%if(session.getAttribute("visits")!=null){%>
                    <%=session.getAttribute("visits")%>
                    <%}else{%>
                        0
                    <%}%>
                </p>
            </div>
        </div>
        <div id="sidebar4">
            <div class="STYLE3" id="content3">
                <a   href="http://localhost:8080/GetPublicNoticeAction!getSomeResult.action">
                    <p class="STYLE3">最新公告</p></a>
                <table width="306"  border="2" bordercolor="#00CCFF" class="STYLE2">
                    <%  if(session.getAttribute("publicnotices")!=null) {
                        List<Message> publicnotices = (List<Message>) session.getAttribute("publicnotices");
                        for (int i = 0; i < publicnotices.size(); i++) {
                    %>
                    <tr>
                        <td width="60" height="40">
                            <%= publicnotices.get(i).getType()%>
                        </td height="40">
                        <td>
                            <a href="http://localhost:8080/GetPublicNoticeAction!getOneResult.action?publicnoticeid=<%=publicnotices.get(i).getId()%>"><%= publicnotices.get(i).getTopic()%>
                            </a>
                        </td>
                    </tr>
                    <%}}%>
                </table>
            </div>
            <div class="STYLE3" id="content4">
                <a href="http://localhost:8080/GetAccomplishmentAction!getSomeResult.action" >
                    <p class="STYLE3">成果聚焦</p></a>
                <table width="310" border="2" bordercolor="#00CCFF" class="STYLE2">
                    <% if( session.getAttribute("fiveaccomplishments")!=null){
                        List<PictureNews> accomplishments = (List<PictureNews>) session.getAttribute("fiveaccomplishments");
                        for (int i = 0; i < accomplishments.size(); i++) {
                    %>
                    <tr>
                        <td width="60" height="40">
                            <%= accomplishments.get(i).getType()%>
                        </td>
                        <td height="40">
                            <a href="http://localhost:8080/GetAccomplishmentAction!getOneResult.action?accomplishmentid=<%=accomplishments.get(i).getId()%>"> <%= accomplishments.get(i).getTopic()%></a>
                        </td>
                    </tr>
                    <%}}%>
                </table>
            </div>
        </div>
        <div id="content">
            <div class="STYLE3" id="content1">
                <a href="http://localhost:8080/GetPictureNewsAction!getSomeResult.action" >
                    <p class="STYLE3">图片新闻</p>
                </a>
                <marquee direction="left" behavior="scroll" scrollamount="3" width="400"  onMouseOver="this.stop()"
                         onMouseOut="this.start()">
                    <table width="400"  border="0" class="STYLE2">
                        <% if( session.getAttribute("threepicturenews")!=null){
                            List<PictureNews> picturenews = (List<PictureNews>) session.getAttribute("threepicturenews");%>
                        <tr>
                         <%   for (int i = 0; i < picturenews.size(); i++) {%>
                            <td>
                                <a href="http://localhost:8080/GetPictureNewsAction!getOneResult.action?picturenewsid=<%=picturenews.get(i).getId()%>"><img src="<%=picturenews.get(i).getPath()%>" alt="images"/> </a>
                            </td>
                        <%}%>
                        </tr>
                        <tr>
                            <%   for (int i = 0; i < picturenews.size(); i++) {%>
                            <td>
                                <a href="http://localhost:8080/GetPictureNewsAction!getOneResult.action?picturenewsid=<%=picturenews.get(i).getId()%>"><%=picturenews.get(i).getTopic()%> </a>
                            </td>
                            <%}%>
                        </tr>
                        <%}%>
                    </table>
                </marquee>
            </div>
            <div class="STYLE3" id="content2">
                <a href="http://localhost:8080/GetNewsAction!getSomeResult.action" >
                    <p class="STYLE3">新闻快讯</p>
                </a>
                <table width="400"  border="2" bordercolor="#00CCFF" class="STYLE2">
                    <% if((List<Message>) session.getAttribute("news")!=null){
                        List<Message> news = (List<Message>) session.getAttribute("news");
                        for (int i = 0; i < news.size(); i++) {
                    %>
                    <tr>
                        <td width="60" height="40">
                            <%= news.get(i).getType()%>
                        </td>
                        <td height="40">
                            <a href="http://localhost:8080/GetNewsAction.action!getOneResult.action?newsid=<%=news.get(i).getId()%>"> <%= news.get(i).getTopic()%></a>
                        </td>
                    </tr>
                    <%}}%>
                </table>
            </div>

        </div>
    </div>
    <div id="footer">
        <div align="center">
            <p>维护邮箱：
                <%=session.getAttribute("maintenanceaddress")%>
            </p>

            <p>
                <%if((session.getAttribute("user")) != null){%>
                <a href="feedback.jsp">用户反馈</a>
                <%}else {%>
                用户反馈
                <%}%>
            </p>
        </div>
    </div>
</div>
</body>
</html>