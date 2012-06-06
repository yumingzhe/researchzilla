<%@ page import="pojo.WebsiteMessage" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: 下午3:50
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="pojo.Subject" %>
<%@ page contentType="text/html;charset=gb2312"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>后台管理页面</title>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 36px;
            font-weight: bold;
        }
        .STYLE2 {
            font-size: 16px;
            background-image:url("img/menu.jpg");
        }
        .STYLE3 {
            font-size: 16px;
        }
        .STYLE4 {
            font-size: 20px;
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
            <li><a href="#" class="STYLE2">网站课题管理</a>
                <ul>
                    <li><a href="http://localhost:8080/SubjectAction!getallsubjectsm.action">查看全部课题</a></li>
                    <li><a href="addsubject.jsp">添加新课题</a></li>
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
        <p align="center" class="STYLE4 ">
            <%if(session.getAttribute("websitename")!=null){%>
            <%=session.getAttribute("websitename")%>
            <%}%>网站课题介绍
        </p>
        <%if(session.getAttribute("subjects")!=null){ %>
        <table  border="2" align="center" bordercolor="#00CCFF">
            <% List<Subject> subjects= (List<Subject>) session.getAttribute("subjects");%>
            <tr>
                <td class="STYLE2" >序号</td>
                <td class="STYLE2" >课题</td>
                <td class="STYLE2" >研究方向</td>
                <td class="STYLE2" >参与人员</td>
                <td class="STYLE2" >开始时间</td>
                <td class="STYLE2" >进度</td>
                <td class="STYLE2" >操作</td>
            </tr>
            <%for (int i = 0; i < subjects.size(); i++) { %>
            <tr height="50">
                <td height="50"> <%=subjects.get(i).getId()%>
                </td >
                <td height="50"> <%=subjects.get(i).getSubjecttopic()%>
                </td>
                <td height="50"><%= subjects.get(i).getResearchdirection()%>
                </td>
                <td height="50"><%= subjects.get(i).getResearchmember()%>
                </td>
                <td height="50"> <%=subjects.get(i).getStarttime()%>
                </td>
                <td height="50"> <%=subjects.get(i).getPrograss()%>
                </td>
                <td height="50"> <a href="http://localhost:8080/SubjectAction!deleteonesubject.action?subjectid=<%=subjects.get(i).getId()%>">删除</a>
                </td>
                <td height="50"> <a href="http://localhost:8080/SubjectAction!updateonesubject.action?subjectid=<%=subjects.get(i).getId()%>">修改</a>
                </td>
            </tr>
            <%}%>
        </table>
        <%}%>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>