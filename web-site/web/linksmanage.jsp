<%--
  User: wangyan
  Date: 12-5-30
  Time: 下午2:36
--%>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Link" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>全部链接信息显示页面</title>
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
        <p align="center" class="STYLE2 ">链接信息总览</p>

        <table width="662" height="473" border="2" align="center" bordercolor="#00CCFF">
            <% if(request.getAttribute("links")!=null){
                List<Link> links= (List<Link>) request.getAttribute("links");%>
            <tr>
                <td class="STYLE1" height="50">序号</td>
                <td class="STYLE1" height="50">网站名称</td>
                <td class="STYLE1" height="50">网站url</td>
                <td class="STYLE1" height="50">操作</td>
            </tr>
            <%    for (int i = 0; i < links.size(); i++) {
            %>
            <tr height="50">
                <td height="50">
                    <%=links.get(i).getId()%>
                </td>
                <td height="50">
                    <%=links.get(i).getWebsitename()%>
                </td>
                <td height="50">
                    <%= links.get(i).getWebsiteurl()%>
                </td>
                <td height="50">
                    <a href="http://localhost:8080/LinkAction.action?uid=<%=links.get(i).getId()%>">修改</a>
                </td>
                <td height="50">
                    <a href="http://localhost:8080/LinkAction.action?uid=<%=links.get(i).getId()%>">删除</a>
                </td>
                <td height="50">
                    <a href="http://localhost:8080/LinkAction.action?uid=<%=links.get(i).getId()%>">添加</a>
                </td>
            </tr>
            <%}}else{%>
            <tr class="STYLE1">
                暂时无链接信息
            </tr>
            <%}%>
        </table>
    </div>
    该网站常用网站链接最多只能显示五个
    <div id="footer_1">
    </div>
</div>
</body>
</html>