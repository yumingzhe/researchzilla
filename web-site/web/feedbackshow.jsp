<%@ page import="pojo.SiteUser" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Feedback" %>
<%--
  User: wangyan
  Date: 12-5-30
  Time: 上午9:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>用户反馈信息显示页面</title>
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
                    <%if(session.getAttribute("websitename")!=null){%>
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <%}%>
                    <p align="center">&nbsp;</p>
            </tr>
        </table>
    </div>
    <div id="mainContent_2">
        <p align="center" class="STYLE2 ">用户反馈信息总览</p>

        <table width="662" height="473" border="2" align="center" bordercolor="#00CCFF">
            <% if(request.getAttribute("feedbacks")!=null){
                List<Feedback> feedbacks= (List<Feedback>) request.getAttribute("feedbacks");%>
            <tr>
                <td class="STYLE1" height="50">序号</td>
                <td class="STYLE1" height="50">标题</td>
                <td class="STYLE1" height="50">作者</td>
                <td class="STYLE1" height="50">发布时间</td>
                <td class="STYLE1" height="50">操作</td>
            </tr>
            <%    for (int i = 0; i < feedbacks.size(); i++) {
            %>
            <tr height="50">
                <td height="50">
                    <%=feedbacks.get(i).getId()%>
                </td>
                <td height="50">
                    <%=feedbacks.get(i).getFeedbacktopic()%>
                </td>
                <td height="50">
                    <%= feedbacks.get(i).getFeedbackauthor()%>
                </td>
                <td height="50">
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

    </div>
</div>
</body>
</html>