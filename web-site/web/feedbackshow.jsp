<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Feedback" %>
<%@ page import="java.util.List" %>
<%--
  User: wangyan
  Date: 12-5-28
  Time: 上午10:17
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>用户反馈信息页面</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
        }
        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 24px;
            font-weight: bold;
        }
        -->
    </style>
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
        <p align="center" class="STYLE2 ">用户反馈信息总览</p>

        <table width="662" height="473" border="2" align="center" bordercolor="#00CCFF">
            <% if( session.getAttribute("feedbacks")!=null){
                List<Feedback> feedbacks= (List<Feedback>) session.getAttribute("feedbacks");%>
                <tr>
                <td class="STYLE1">序号</td>
                <td class="STYLE1">作者</td>
                <td class="STYLE1">标题</td>
                <td class="STYLE1">发表时间</td>
                </tr>
            <%    for (int i = 0; i < feedbacks.size(); i++) {
            %>
            <tr>
                <td>
                    <%=feedbacks.get(i).getId()%>
                </td>
                <td>
                    <%=feedbacks.get(i).getFeedbackauthor()%>
                </td>
                <td>
                    <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult?feedbackid=<%=feedbacks.get(i).getId()%>"><%= feedbacks.get(i).getFeedbacktopic()%>
                    </a>
                </td>
                <td>
                    <%=feedbacks.get(i).getPublishtime()%>
                </td>
            </tr>
             <%}}else{%>
            <tr class="STYLE1">
                暂时无用户反馈信息
            </tr>
            <%}%>
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