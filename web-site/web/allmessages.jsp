<%@ page import="pojo.SiteUser" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.Message" %>
<%--
  User: wangyan
  Date: 12-5-30
  Time: 上午9:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>全部文本信息显示页面</title>
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
            <li><a href="#" class="STYLE1">网站课题管理</a>
                <ul>
                    <li><a href="http://localhost:8080/SubjectAction!getallsubjectsm.action">查看全部课题</a></li>
                    <li><a href="addsubject.jsp">添加新课题</a></li>
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
        <p align="center" class="STYLE2 ">网站纯文本信息总览</p>
        <p>&nbsp;</p>
            <%   int intPageCount;  //总页数
                int intPage;       //待显示页码
                if(request.getAttribute("somemessages")!=null){ %>
                <table width="500" height="350" border="0" align="center" >
                    <table  border="2" align="center" bordercolor="#00CCFF">
              <%    List<Message> messages= (List<Message>) request.getAttribute("somemessages");
                    intPage=  (Integer)(request.getAttribute("currentpage"));
                    if(intPage==1){
                        intPage=1;
                    }else {
                        if(intPage<1) intPage=1;
                    }
                    intPageCount=(Integer)(request.getAttribute("totalpage"));
                    if(intPage>intPageCount) intPage=intPageCount;%>
            <tr>
                <td class="STYLE1" >序号</td>
                <td class="STYLE1" >类型</td>
                <td class="STYLE1" >标题</td>
                <td class="STYLE1" >作者</td>
                <td class="STYLE1" >发布时间</td>
                <td class="STYLE1" >操作</td>
            </tr>
            <%    for (int i = 0; i < messages.size(); i++) {
            %>
            <tr height="50">
                <td height="50"> <%=messages.get(i).getId()%>
                </td >
                <td height="50"> <%=messages.get(i).getType()%>
                </td>
                <td height="50"><a href="http://localhost:8080/MessageAction!getOneMessage.action?messageid=<%=messages.get(i).getId()%>"><%= messages.get(i).getTopic()%>
                </td>
                <td height="50"><%= messages.get(i).getAuthor()%>
                </td>
                <td height="50"> <%=messages.get(i).getPublishtime()%>
                </td>
                <td height="50"><a href="http://localhost:8080/MessageAction!deleteOneMessage.action?messageid=<%=messages.get(i).getId()%>">删除</a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center" class="STYLE3">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/MessageAction!getsomemessages.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/MessageAction!getsomemessages.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
            </table>
            </table>
            <%}else{%>
            <tr class="STYLE1">
                暂时无信息
            </tr>
            <%}%>
    </div>
    <div id="footer_1">
        </div>
    </div>
</div>
</body>
</html>