<%--
  User: wangyan
  Date: 12-5-30
  Time: 下午1:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>网站链接添加页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        .STYLE2 {font-size: 18px; font-weight: bold;background-image: url("img/menu.jpg"); }
        .STYLE3 {font-size: 18px; font-weight: bold; }
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
        <form id="addmessageform" name="addmessageform" method="post"   action="SubjectAction.action">
            <table width="543" height="239" border="0" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE3">研究课题：</td>
                    <td width="362"><label class="STYLE3">
                        <input name="subjecttopic" type="text" class="STYLE3"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE3">研究方向：</td>
                    <td><label>
                        <input name="researchdirection" type="text"  class="STYLE3"  />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE3">参与人员：</td>
                    <td><label>
                        <input name="researchmember" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE3">开始时间</td>
                    <td><label>
                        <input name="starttime" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE3">进度描述</td>
                    <td><label>
                        <input name="prograss" type="text" class="STYLE3"/>
                    </label></td>
                </tr>
            </table>
            <p align="center" class="STYLE3">
                <label>
                    <input name="Submit" type="submit" class="STYLE3" value="提交" />
                </label>
            </p>
        </form>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>