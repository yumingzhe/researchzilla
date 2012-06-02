<%@ page import="pojo.WebsiteMessage" %>
<%--
  User: wangyan
  Date: 12-5-28
  Time: 下午5:00
--%>
<%@ page language="java"  pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>网站统计信息浏览页面</title>
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
        <div align="right" ><a href="managepage.jsp">返回后台管理页面</a></div>
    </div>
    <div id="mainContent_2">
        <%request.setCharacterEncoding("gb2312");
            response.setContentType("text/html;charset=gb2312");%>
            <table width="543" height="239" border="0" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE8">网站总注册用户数：</td>
                    <%if(request.getAttribute("usercount")!=null){%>
                    <td><%=request.getAttribute("usercount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE8">网站内部通知条数：</td>
                    <%if(request.getAttribute("internalnoticecount")!=null){%>
                    <td><%=request.getAttribute("internalnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE8">网站最新公告条数：</td>
                    <%if(request.getAttribute("publicnoticecount")!=null){%>
                    <td><%=request.getAttribute("publicnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE8">网站新闻快讯条数：</td>
                    <%if(request.getAttribute("newscount")!=null){%>
                    <td><%=request.getAttribute("newscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE8">网站图片新闻条数：</td>
                    <%if(request.getAttribute("picturenewscount")!=null){%>
                    <td><%=request.getAttribute("picturenewscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE8">网站成果聚焦条数：</td>
                    <%if(request.getAttribute("accomplishmentcount")!=null){%>
                    <td><%=request.getAttribute("accomplishmentcount")%></td>
                    <%}%>
                </tr>
            </table>

    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>