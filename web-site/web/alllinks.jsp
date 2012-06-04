<%@ page import="pojo.SiteUser" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Message" %>
<%@ page import="pojo.Link" %>
<%--
  User: wangyan
  Date: 12-5-30
  Time: 上午9:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>全部链接显示页面</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
            background-image: url("img/menu.jpg");
            height: 10px;
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
                <td width="640" height="191">&nbsp;</td>
                <td width="25518" class="STYLE2"><p>&nbsp;</p>
                    <%if(session.getAttribute("websitename")!=null){%>
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <%}%>
                    <p align="center">&nbsp;</p>
                </td>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="managepage.jsp">返回后台管理页面</a></td>
                </tr>
            </table>
        </table>
    </div>
    <div class="STYLE1"></div>
    <div id="mainContent_2">
        <p align="center" class="STYLE2 ">网站链接信息总览</p>
        <p>&nbsp;</p>
        <%
            if(request.getAttribute("alllinks")!=null){ %>
        <table  height="350"border="0" align="center" >
            <table  border="2" align="center" bordercolor="#00CCFF">
            <%    List<Link> links= (List<Link>) request.getAttribute("alllinks");%>
            <tr>
                <td class="STYLE1" >序号</td>
                <td class="STYLE1" >网站标题</td>
                <td class="STYLE1" >网址</td>
                <td class="STYLE1" >操作</td>
            </tr>
            <%    for (int i = 0; i < links.size(); i++) {
            %>
            <tr height="50">
                <td height="50"> <%=links.get(i).getId()%>
                </td>
                <td height="50"><a href="http://localhost:8080/LinkAction!deleteonelink.action?linkid=<%=links.get(i).getId()%>"><%= links.get(i).getWebsitename()%>
                </td>
                <td height="50"><%= links.get(i).getWebsiteurl()%>
                </td>
                <td height="50"><a href="http://localhost:8080/LinkAction!deleteonelink.action?linkid=<%=links.get(i).getId()%>">删除</a>
                </td>
            </tr>
            <%}%>
            </table>
        </table>
        <%}else{%>
        <tr class="STYLE1">
            暂时无信息
        </tr>
        <%}%>
        <p align="center">首页网址导航最多只能显示五条，请慎重添加</p>
    </div>
    <div id="footer_1">
    </div>
</div>
</div>
</body>
</html>