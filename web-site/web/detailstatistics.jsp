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
        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE3 {
            font-size: 16px;
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
        <div align="right" class="STYLE3" ><a href="index.jsp">首页</a></div>
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
        <p align="center" class="STYLE1 ">网站静态统计信息信息总览</p>
        <p>&nbsp;</p>
        <%request.setCharacterEncoding("gb2312");
            response.setContentType("text/html;charset=gb2312");%>
            <table  width="400" border="2" bordercolor="#00CCFF" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE2">网站总注册用户数：</td>
                    <%if(request.getAttribute("usercount")!=null){%>
                    <td><%=request.getAttribute("usercount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站总登录访问量：</td>
                    <%if(request.getAttribute("visits")!=null){%>
                    <td><%=request.getAttribute("visits")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站内部通知条数：</td>
                    <%if(request.getAttribute("internalnoticecount")!=null){%>
                    <td><%=request.getAttribute("internalnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站最新公告条数：</td>
                    <%if(request.getAttribute("publicnoticecount")!=null){%>
                    <td><%=request.getAttribute("publicnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站新闻快讯条数：</td>
                    <%if(request.getAttribute("newscount")!=null){%>
                    <td><%=request.getAttribute("newscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站图片新闻条数：</td>
                    <%if(request.getAttribute("picturenewscount")!=null){%>
                    <td><%=request.getAttribute("picturenewscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">网站成果聚焦条数：</td>
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