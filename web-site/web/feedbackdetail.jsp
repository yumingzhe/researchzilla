<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
<%@ page import="pojo.Feedback" %>
<%--
  User: wangyan
  Date: 12-5-25
  Time: 下午8:30
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>用户反馈信息详细内容显示界面</title>
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
                    <p align="center"><%=session.getAttribute("websitename")%></p> </td>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="managepage.jsp">返回后台管理页面</a></td>
                </tr>
            </table>
        </table>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
        <table width="396" height="30" border="0" align="center" class="STYLE1">
            <tr>
                <%if(request.getAttribute("onefeedback")!=null){%>
                <td class="STYLE1"><%=((Feedback)request.getAttribute("onefeedback")).getFeedbacktopic()%></td>
                <%}else{}%>
            </tr>
        </table>

        <table width="700" height="463" border="0" align="center">
            <%if(request.getAttribute("onefeedback")!=null){%>
            <tr>
                <td >作者：<%=((Feedback)request.getAttribute("onefeedback")).getFeedbackauthor()%>
                    发布时间：<%=((Feedback)request.getAttribute("onefeedback")).getPublishtime()%>
                </td>
            </tr>
            <tr>
                <td><%=((Feedback)request.getAttribute("onefeedback")).getFeedbackcontent()%></td>
            </tr>
            <%}else{}%>
        </table>
    </div>
    <div id="footer_1">
    </div>
</div>
</body>
</html>