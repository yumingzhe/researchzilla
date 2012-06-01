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
    <title>网站基本信息设置页面</title>
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
    </div>
    <div id="mainContent_2">
        <%request.setCharacterEncoding("gb2312");
          response.setContentType("text/html;charset=gb2312");%>
        <%if(request.getAttribute("websitemessage")!=null){%>
        <form id="form1" name="form1" method="post" enctype="multipart/form-data" action="dobasicmessagechange.jsp">
            <table width="543" height="239" border="0" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE8">网站标题：</td>
                    <td width="362"><label class="STYLE8">
                        <input name="websitename" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getWebsitename()%>"/>
                    </label></td>
                    <%System.out.println(((WebsiteMessage)request.getAttribute("websitemessage")).getWebsitename());%>
                </tr>
                <tr>
                    <td class="STYLE8">网站背景图片：</td>
                    <td><label>
                        <input name="path" type="file"  class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getPath()%>" />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">网站维护组邮箱：</td>
                    <td><label>
                        <input name="maintenanceaddress" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getMaintenanceaddress()%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">网站默认语言：</td>
                    <td><label>
                        <select name="defaultlanguage" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getDefaultlanguage()%>">
                            <option value="Chinese">Chinese</option>
                            <option value="English">English</option>
                        </select>
                    </label></td>
                </tr>
            </table>
            <p align="center" class="STYLE5">
                <label>
                    <input name="Submit" type="submit" class="STYLE8" value="更新" />
                </label>
            </p>
        </form>
        <%}%>
         <%String imgUrl= ((WebsiteMessage)request.getAttribute("websitemessage")).getPath();
         %>
        <div align="center">
            <img src="<%=imgUrl%>" alt="images"/>
        </div>

    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>