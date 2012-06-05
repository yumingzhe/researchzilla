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
        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 18px;
            font-weight: bold;
            background-image: url("img/menu.jpg");
        }
        .STYLE8 {
            font-size: 18px;
            font-weight: bold;
        }
        -->
    </style>
    <script type=text/javascript><!--//--><![CDATA[//><!--
    function menuFix() {
        var sfEls = document.getElementById("nav").getElementsByTagName("li");
        for (var i=0; i<sfEls.length; i++) {
            sfEls[i].onmouseover=function() {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
            sfEls[i].onMouseDown=function() {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
            sfEls[i].onMouseUp=function() {
                this.className+=(this.className.length>0? " ": "") + "sfhover";
            }
            sfEls[i].onmouseout=function() {
                this.className=this.className.replace(new RegExp("( ?|^)sfhover\\b"),
                        "");
            }
        }
    }
    window.onload=menuFix;
    //--><!]]></script>
</head>
<body>

<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">
            <%if(session.getAttribute("websitename")!=null){%>
            <%=session.getAttribute("websitename")%>
            <%}%>后台管理
        </div>
    </div>
    <div id="menu">
        <ul id="nav">
            <li><a href="#" class="STYLE2">用户信息管理</a>
                <ul>
                    <li><a href="http://localhost:8080/UserAction!getsomeusers.action">查看所有用户</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">网站信息管理</a>
                <ul>
                    <li><a href="addmesssage.jsp" >添加图片信息</a></li>
                    <li><a href="addtextmessage.jsp">添加文本信息</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomemessages.action">查看文本消息</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomepicturemessages.action">查看图片消息</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">系统信息维护</a>
                <ul>
                    <li><a href="http://localhost:8080/BasicMessageChangeAction.action">基本信息设置</a></li>
                    <li><a href="http://localhost:8080/GetStatisticsAction.action">统计信息浏览</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">网站链接管理</a>
                <ul>
                    <li><a href="http://localhost:8080/GetLinkAction!getalllinks.action">查看全部链接</a></li>
                    <li><a href="addlink.jsp">添加新链接</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">反馈信息管理</a>
                <ul>
                    <li><a href="http://localhost:8080/FeedbackAction!getsomefeedbacks.action">查看所有留言</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
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
                <tr>
                    <td class="STYLE8">网站访问量：</td>
                    <td><label>
                        <input name="maintenanceaddress" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getVisits()%>"/>
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