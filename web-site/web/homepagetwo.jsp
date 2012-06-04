<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Message" %>
<%@ page import="java.util.List" %>
<%@ page import="pojo.PictureNews" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: 下午3:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title><%if(session.getAttribute("websitename")!=null){%>
        <%=session.getAttribute("websitename")%>
        <%}%></title>
    <style type="text/css">
        <!--
        .STYLE1 {font-size: 24px}
        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE4 {
            font-size: 30px;
            font-weight: bold;
        }
        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 24px;
            background-image: url("img/menu.jpg");
        }
        -->
    </style>
</head>
<body>
<div id="container_1">
    <div class="STYLE1" id="header_1">
        <table width="930" height="195" border="0">
            <tr>
                <td width="680" height="191">&nbsp;</td>
                <td width="250" class="STYLE4"><p>&nbsp;</p>
                    <p align="center"><%=session.getAttribute("websitename")%></p></td>
            </tr>
        </table>
        <div align="right" ><a href="index.jsp">首页</a></div>
    </div>
    <div class="STYLE2" ></div>
    <div id="mainContent_1">
        <div class="STYLE2" ></div>
        <div id="sidebar_1">
            <div id="left">
                <%if((session.getAttribute("user")) != null){%>
                <div id="bar1" align="center" class="STYLE1"><a href="http://localhost:8080/GetInternalNoticeAction!getSomeResult.action">内部通知</a></div>
                <%}%>
                <div id="bar2" align="center" class="STYLE1"><a href="http://localhost:8080/GetPublicNoticeAction!getSomeResult.action">最新公告</a></div>
                <div id="bar3" align="center" class="STYLE1"><a href="http://localhost:8080/GetPictureNewsAction!getSomeResult.action">图片新闻</a></div>
                <div id="bar4" align="center" class="STYLE1"><a href="http://localhost:8080/GetNewsAction!getSomeResult.action">新闻快讯</a></div>
                <div id="bar5" align="center" class="STYLE1"><a href="http://localhost:8080/GetAccomplishmentAction!getSomeResult.action">成果聚焦</a></div>
            </div>
        </div>
        <div  id="content_2">详细内容分条显示框
            <%
                int intPageCount;  //总页数
                int intPage;       //待显示页码
                if(request.getAttribute("someinternalnotices")!=null&&(session.getAttribute("user")) != null){ %>
                <table width="578"  border="2" bordercolor="#00CCFF" class="STYLE1">
                 <%   List<Message> internalnotices= (List<Message>) request.getAttribute("someinternalnotices");
                    intPage=  (Integer)(request.getAttribute("currentpage"));
                    if(intPage==1){
                        intPage=1;
                    }else {
                        if(intPage<1) intPage=1;
                    }
                    intPageCount=(Integer)(request.getAttribute("totalpage"));
                    if(intPage>intPageCount) intPage=intPageCount;
                    for (int i= 0; i< internalnotices.size(); i++) {
                %>
                <tr>
                    <td height="50">
                        <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult.action?internalnoticeid=<%=internalnotices.get(i).getId()%>"><%= internalnotices.get(i).getTopic()%>
                        </a>
                    </td>
                </tr>
                <%}%>
                </table>
                <table align="center">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/GetInternalNoticeAction!getSomeResult.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/GetInternalNoticeAction!getSomeResult.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
             </table>
            <%}else if(request.getAttribute("somepublicnotices")!=null){%>
                <table width="578"  border="2" bordercolor="#00CCFF" class="STYLE1">
            <%   List<Message> publicnotices= (List<Message>) request.getAttribute("somepublicnotices");
                intPage=  (Integer)(request.getAttribute("currentpage"));
                if(intPage==1){
                intPage=1;
                }else {
                if(intPage<1) intPage=1;
                }
                intPageCount=(Integer)(request.getAttribute("totalpage"));
                if(intPage>intPageCount) intPage=intPageCount;
                //   currPageBegin=Integer.parseInt((String)request.getAttribute("currentpage"));
                for (int i= 0; i< publicnotices.size(); i++) {
            %>
            <tr>
                <td height="50">
                    <a href="http://localhost:8080/GetPublicNoticeAction!getOneResult.action?publicnoticeid=<%=publicnotices.get(i).getId()%>"><%= publicnotices.get(i).getTopic()%>
                    </a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/GetPublicNoticeAction!getSomeResult.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/GetPublicNoticeAction!getSomeResult.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
            </table>
                <%}else if(request.getAttribute("somenewses")!=null){ %>
                    <table width="578"  border="2" bordercolor="#00CCFF" class="STYLE1">
            <%   List<Message> newses= (List<Message>) request.getAttribute("somenewses");
                intPage=  (Integer)(request.getAttribute("currentpage"));
                if(intPage==1){
                intPage=1;
                }else {
                if(intPage<1) intPage=1;
                }
                intPageCount=(Integer)(request.getAttribute("totalpage"));
                if(intPage>intPageCount) intPage=intPageCount;
                //   currPageBegin=Integer.parseInt((String)request.getAttribute("currentpage"));
                for (int i= 0; i< newses.size(); i++) {
            %>
            <tr>
                <td height="50">
                    <a href="http://localhost:8080/GetInternalNoticeAction!getOneResult.action?internalnoticeid=<%=newses.get(i).getId()%>"><%= newses.get(i).getTopic()%>
                    </a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/GetNewsAction!getSomeResult.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/GetNewsAction!getSomeResult.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
            </table>
                <%}else if(request.getAttribute("somepicturenewses")!=null){ %>
                    <table width="578"  border="2" bordercolor="#00CCFF" class="STYLE1">
            <%   List<PictureNews> picturenewses= (List<PictureNews>) request.getAttribute("somepicturenewses");
                intPage=  (Integer)(request.getAttribute("currentpage"));
                if(intPage==1){
                intPage=1;
                }else {
                if(intPage<1) intPage=1;
                }
                intPageCount=(Integer)(request.getAttribute("totalpage"));
                if(intPage>intPageCount) intPage=intPageCount;
                //   currPageBegin=Integer.parseInt((String)request.getAttribute("currentpage"));
                for (int i= 0; i< picturenewses.size(); i++) {
            %>
            <tr>
                <td height="50">
                    <a href="http://localhost:8080/GetPictureNewsAction!getOneResult.action?picturenewsid=<%=picturenewses.get(i).getId()%>"><%= picturenewses.get(i).getTopic()%>
                    </a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/GetPictureNewsAction!getSomeResult.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/GetPictureNewsAction!getSomeResult.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
            </table>
                <%}else if(request.getAttribute("someaccomplishments")!=null){ %>
                    <table width="578"  border="2" bordercolor="#00CCFF" class="STYLE1">
            <%   List<PictureNews> accomplishments= (List<PictureNews>) request.getAttribute("someaccomplishments");
                intPage=  (Integer)(request.getAttribute("currentpage"));
                if(intPage==1){
                intPage=1;
                }else {
                if(intPage<1) intPage=1;
                }
                intPageCount=(Integer)(request.getAttribute("totalpage"));
                if(intPage>intPageCount) intPage=intPageCount;
                //   currPageBegin=Integer.parseInt((String)request.getAttribute("currentpage"));
                for (int i= 0; i< accomplishments.size(); i++) {
            %>
            <tr>
                <td height="50">
                    <a href="http://localhost:8080/GetAccomplishmentAction!getOneResult.action?accomplishmentid=<%=accomplishments.get(i).getId()%>"><%= accomplishments.get(i).getTopic()%>
                    </a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center">
                <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
                <%if(intPage>1){%>
                <a href="http://localhost:8080/GetAccomplishmentAction!getSomeResult.action?pagenumber=<%=intPage-1%> ">上一页</a>
                <% }else{ %>
                上一页
                <%} %>
                <%if(intPage<intPageCount){%>
                <a href="http://localhost:8080/GetAccomplishmentAction!getSomeResult.action?pagenumber=<%=intPage+1%>">下一页</a>
                <% }else {%>
                下一页
                <%}%>
            </table>
                <%}else {}%>

        </div>
    </div>
    <div id="footer_1">
        <div align="center">
            <p>维护邮箱：
                <%=session.getAttribute("maintenanceaddress")%>
            </p>
            <p>
                <%if(session.getAttribute("user")!=null){%>
                <a href="feedback.jsp">用户反馈</a>
                <%}else{%>
                用户反馈
                <%}%>
            </p>
        </div>
    </div>
</div>
</body>
</html>