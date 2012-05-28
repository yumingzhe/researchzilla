<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
<%@ page import="java.util.List" %>
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
                    <%if(( session.getAttribute("user"))!=null){%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                    <%}%>
            </tr>
        </table>
    </div>
    <div id="mainContent_1">
        <div id="sidebar_1">
            <div id="left">
                <div id="bar1" align="center" class="STYLE1"><a href="http://localhost:8080/GetInternalNoticeAction!getAllResult">内部通知</a></div>
                <div id="bar2" align="center" class="STYLE1"><a href="http://localhost:8080/GetPublicNoticeAction!getAllResult">最新公告</a></div>
                <div id="bar3" align="center" class="STYLE1"><a href="#">图片新闻</a></div>
                <div id="bar4" align="center" class="STYLE1"><a href="http://localhost:8080/GetNewsAction!getAllResult">新闻快讯</a></div>
                <div id="bar5" align="center" class="STYLE1"><a href="#">成果聚焦</a></div>
            </div>
        </div>
        <div  id="content_2">详细内容分条显示框
            <table width="578" height="423" border="0">
                <%if(request.getAttribute("allinternalnotices")!=null){
                    List<Message> internalnotices= (List<Message>) request.getAttribute("allinternalnotices");
                    for (int i = 0; i < internalnotices.size(); i++) {
                %>
                <tr>
                    <td>
                        <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult?internalnoticeid=<%=internalnotices.get(i).getId()%>"><%= internalnotices.get(i).getTopic()%>
                        </a>
                    </td>
                </tr>

                <%}}else if(request.getAttribute("allpublicnotices")!=null){
                    List<Message> publicnotices= (List<Message>) request.getAttribute("allpublicnotices");
                    for (int i = 0; i < publicnotices.size(); i++) {
                %>
                <tr>
                    <td>
                        <a href="http://localhost:8080/GetPublicNoticeAction!getOneResult?publicnoticeid=<%=publicnotices.get(i).getId()%>"><%= publicnotices.get(i).getContent()%>
                        </a>
                    </td>
                </tr>

                <%}}else{
                    List<Message> newses= (List<Message>) request.getAttribute("allnewses");
                    for (int i = 0; i < newses.size(); i++) {%>
                <tr>
                    <td>
                        <a href="http://localhost:8080/GetNewsAction!getOneResult?newsid=<%=newses.get(i).getId()%>"><%= newses.get(i).getContent()%>
                        </a>
                    </td>
                </tr>
            <%}}%>
            </table>
        </div>
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