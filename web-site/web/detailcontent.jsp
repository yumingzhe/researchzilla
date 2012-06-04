<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
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
    <style type="text/css">
        <!--
        .STYLE3 {
            font-size: 24px;
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
                <td width="640" height="191">&nbsp;</td>
                <td width="255" class="STYLE3"><p>&nbsp;</p>
                    <%if(session.getAttribute("websitename")!=null){%>
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <%}%>
                    <p align="center">&nbsp;</p>
                        <%if(( session.getAttribute("user"))!=null){%>
                    <p align="center"><%=((SiteUser) session.getAttribute("user")).getUsername()%> 欢迎您登录本网站！</p>
                        <%}%>
                </td>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="homepageone.jsp">返回首页</a></td>
                </tr>
            </table>
        </table>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
        <table width="396" height="30" border="2" bordercolor="#00CCFF" align="center" class="STYLE1">
            <tr>
                <%if(request.getAttribute("oneinternalnotice")!=null){%>
                <td class="STYLE1" align="center" ><%=((Message)request.getAttribute("oneinternalnotice")).getTopic()%></td>
                <%}else if(request.getAttribute("onepublicnotice")!=null){%>
                <td class="STYLE1" align="center" ><%=((Message)request.getAttribute("onepublicnotice")).getTopic()%></td>
                <%}else if(request.getAttribute("onenews")!=null){%>
                <td class="STYLE1" align="center" ><%=((Message)request.getAttribute("onenews")).getTopic()%></td>
                <%}else if(request.getAttribute("onemessage")!=null){%>
                <td class="STYLE1" align="center" ><%=((Message)request.getAttribute("onemessage")).getTopic()%></td>
                <%}else{}%>
            </tr>
        </table>
        <p>&nbsp;</p>
        <table width="500"  border="2" bordercolor="#00CCFF" align="center">
            <%if(request.getAttribute("oneinternalnotice")!=null){%>
            <tr>
                <td height="30">作者：<%=((Message)request.getAttribute("oneinternalnotice")).getAuthor()%>
                    发布者：<%=((Message)request.getAttribute("oneinternalnotice")).getPublisher()%><br>
                    发布时间：<%=((Message)request.getAttribute("oneinternalnotice")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td align="center"  height="300"><%=((Message)request.getAttribute("oneinternalnotice")).getContent()%></td>
            </tr>
            <%--<tr>
                <td><%=((Message)request.getAttribute("oneinternalnotice")).getAccesory()%></td>
            </tr>--%>
            <%}else if(request.getAttribute("onepublicnotice")!=null){%>
            <tr>
                <td height="30">作者：<%=((Message)request.getAttribute("onepublicnotice")).getAuthor()%>
                    发布者：<%=((Message)request.getAttribute("onepublicnotice")).getPublisher()%><br>
                    发布时间：<%=((Message)request.getAttribute("onepublicnotice")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td  height="300"><%=((Message)request.getAttribute("onepublicnotice")).getContent()%></td>
            </tr>
           <%-- <tr>
                <td ><%=((Message)request.getAttribute("onepublicnotice")).getAccesory()%></td>
            </tr>--%>
            <%}else if(request.getAttribute("onenews")!=null){%>
            <tr>
                <td height="30" >作者：<%=((Message)request.getAttribute("onenews")).getAuthor()%>
                    发布者：<%=((Message)request.getAttribute("onenews")).getPublisher()%> <br>
                    发布时间：<%=((Message)request.getAttribute("onenews")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td align="center"  height="300"><%=((Message)request.getAttribute("onenews")).getContent()%></td>
            </tr>

            <%}else if(request.getAttribute("onemessage")!=null){%>
            <tr>
                <td height="30">作者：<%=((Message)request.getAttribute("onemessage")).getAuthor()%>
                    发布者：<%=((Message)request.getAttribute("onemessage")).getPublisher()%><br>
                    发布时间：<%=((Message)request.getAttribute("onemessage")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td align="center"  height="300"><%=((Message)request.getAttribute("onemessage")).getContent()%></td>
            </tr>
            <%--<tr>
                <td ><%=((Message)request.getAttribute("onemessage")).getAccesory()%></td>
            </tr>--%>
            <%}else{}%>

        </table>
    </div>
    <div id="footer_1">
    </div>
</div>
</body>
</html>