<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
<%@ page import="pojo.PictureNews" %>
<%--
  User: wangyan
  Date: 12-5-25
  Time: 下午8:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>详细内容显示界面</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
        }
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
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <p align="center">&nbsp;</p>
                        <%if(( session.getAttribute("user"))!=null){%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                        <%}%>
            </tr>
        </table>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
        <table width="396" height="30" border="0" align="center" class="STYLE1">
            <tr>
                <%if(request.getAttribute("onepicturenews")!=null){%>
                <td class="STYLE1"><%=((PictureNews)request.getAttribute("onepicturenews")).getTopic()%></td>
                <%}else if(request.getAttribute("oneaccomplishment")!=null){%>
                <td class="STYLE1"><%=((PictureNews)request.getAttribute("oneaccomplishment")).getTopic()%></td>
                <%}else if(request.getAttribute("onepicturemessage")!=null){%>
                <td class="STYLE1"><%=((PictureNews)request.getAttribute("onepicturemessage")).getTopic()%></td>
                <%}else{}%>
            </tr>
        </table>

        <table width="700" height="500" border="0" align="center">
            <%if(request.getAttribute("onepicturenews")!=null){%>
            <tr>
                <td >作者：<%=((PictureNews)request.getAttribute("onepicturenews")).getAuthor()%> 发布者：<%=((PictureNews)request.getAttribute("onepicturenews")).getPublisher()%>
                    发布时间：<%=((PictureNews)request.getAttribute("onepicturenews")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td><img src="<%=((PictureNews)request.getAttribute("onepicturenews")).getPath()%>" alt="images"/></td>
            </tr>
            <tr>
                <td><%=((PictureNews)request.getAttribute("onepicturenews")).getContent()%> </td>
            </tr>

            <%}else if(request.getAttribute("oneaccomplishment")!=null){%>
            <tr>
                <td >作者：<%=((PictureNews)request.getAttribute("oneaccomplishment")).getAuthor()%> 发布者：<%=((PictureNews)request.getAttribute("oneaccomplishment")).getPublisher()%>
                    发布时间：<%=((PictureNews)request.getAttribute("oneaccomplishment")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td><img src="<%=((PictureNews)request.getAttribute("oneaccomplishment")).getPath()%>" alt="images"/></td>
            </tr>
            <tr>
                <td><%=((PictureNews)request.getAttribute("oneaccomplishment")).getContent()%></td>
            </tr>
            <%}else if(request.getAttribute("onepicturemessage")!=null) {%>
            <tr>
                <td >作者：<%=((PictureNews)request.getAttribute("onepicturemessage")).getAuthor()%> 发布者：<%=((PictureNews)request.getAttribute("onepicturemessage")).getPublisher()%>
                    发布时间：<%=((PictureNews)request.getAttribute("onepicturemessage")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td><img src="<%=((PictureNews)request.getAttribute("onepicturemessage")).getPath()%>" alt="images"/></td>
            </tr>
            <tr>
                <td><%=((PictureNews)request.getAttribute("onepicturemessage")).getContent()%></td>
            </tr>
             <%}%>
        </table>
    </div>
    <div id="footer_1">
    </div>
</div>
</body>
</html>