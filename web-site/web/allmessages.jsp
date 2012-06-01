<%@ page import="pojo.SiteUser" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Message" %>
<%--
  User: wangyan
  Date: 12-5-30
  Time: 上午9:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>全部文本信息显示页面</title>
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
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <p align="center">&nbsp;</p>
            </tr>
        </table>
    </div>
    <div id="mainContent_2">
        <p align="center" class="STYLE2 ">网站纯文本信息总览</p>

        <table width="662" height="473" border="2" align="center" bordercolor="#00CCFF">
            <% if(request.getAttribute("messages")!=null){
                List<Message> messages= (List<Message>) request.getAttribute("messages");%>
            <tr>
                <td class="STYLE1" height="50">序号</td>
                <td class="STYLE1" height="50">类型</td>
                <td class="STYLE1" height="50">标题</td>
                <td class="STYLE1" height="50">作者</td>
                <td class="STYLE1" height="50">发布时间</td>
            </tr>
            <%    for (int i = 0; i < messages.size(); i++) {
            %>
            <tr height="50">
                <td height="50">
                    <%=messages.get(i).getId()%>
                </td>
                <td height="50">
                    <%=messages.get(i).getType()%>
                </td>
                <td height="50">
                    <a href="http://localhost:8080/MessageAction!getOneMessage.action?messageid=<%=messages.get(i).getId()%>"><%= messages.get(i).getTopic()%>
                </td>
                <td height="50">
                    <%= messages.get(i).getAuthor()%>
                </td>
                <td height="50">
                    <%=messages.get(i).getPublishtime()%>
                </td>
                <td height="50">
                    <a href="#">删除</a>
                </td>
            </tr>
            <%}}else{%>
            <tr class="STYLE1">
                暂时无信息
            </tr>
            <%}%>
        </table>
    </div>
    <div id="footer_1">
        </div>
    </div>
</div>
</body>
</html>