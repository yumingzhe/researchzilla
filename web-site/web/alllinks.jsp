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
        .STYLE3 {
            font-size: 16px;
        }
        .STYLE4 {
            font-size: 36px;
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
        <div align="center" class="STYLE4">
            <%if(session.getAttribute("websitename")!=null){%>
            <%=session.getAttribute("websitename")%>
            <%}%>后台管理
        </div>
        <div align="right" class="STYLE3" ><a href="index.jsp">首页</a></div>
    </div>
    <div id="menu">
        <ul id="nav">
            <li><a href="#" class="STYLE1">用户信息管理</a>
                <ul>
                    <li><a href="http://localhost:8080/UserAction!getsomeusers.action">查看所有用户</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE1">网站信息管理</a>
                <ul>
                    <li><a href="addmesssage.jsp" >添加图片信息</a></li>
                    <li><a href="addtextmessage.jsp">添加文本信息</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomemessages.action">查看文本消息</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomepicturemessages.action">查看图片消息</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE1">系统信息维护</a>
                <ul>
                    <li><a href="http://localhost:8080/BasicMessageChangeAction.action">基本信息设置</a></li>
                    <li><a href="http://localhost:8080/GetStatisticsAction.action">统计信息浏览</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE1">网站链接管理</a>
                <ul>
                    <li><a href="http://localhost:8080/GetLinkAction!getalllinks.action">查看全部链接</a></li>
                    <li><a href="addlink.jsp">添加新链接</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE1">反馈信息管理</a>
                <ul>
                    <li><a href="http://localhost:8080/FeedbackAction!getsomefeedbacks.action">查看所有留言</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
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