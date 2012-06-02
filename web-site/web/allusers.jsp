<%@ page import="pojo.SiteUser" %>
<%@ page import="java.util.List" %>
<%--
  User: wangyan
  Date: 12-5-30
  Time: 上午9:09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>全部用户信息显示页面</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
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
        -->
    </style>
</head>
<body>
<div id="container_1">
    <div class="STYLE1" id="header_1">
        <table width="900" height="195" border="0">
            <tr>
                <td width="640" height="191">&nbsp;</td>
                <td width="255" class="STYLE2"><p>&nbsp;</p>
                    <p align="center"><%=session.getAttribute("websitename")%></p>
                    <p align="center">&nbsp;</p>
                </td>
            </tr>
            <table align="right">
                <tr>
                    <td><a href="managepage.jsp">返回后台管理页面</a></td>
                </tr>
            </table>
        </table>
    </div>
    <div id="mainContent_2">
        <p align="center" class="STYLE2 ">用户信息总览</p>


            <%  int intPageCount;  //总页数
                int intPage;       //待显示页码

                if(request.getAttribute("someusers")!=null){ %>
                <table width="662" height="473" border="2" align="center" bordercolor="#00CCFF">
              <% List<SiteUser> siteusers= (List<SiteUser>) request.getAttribute("someusers");
                 intPage=  (Integer)(request.getAttribute("currentpage"));
                    if(intPage==1){
                        intPage=1;
                    }else {
                        if(intPage<1) intPage=1;
                    }
                    intPageCount=(Integer)(request.getAttribute("totalpage"));
                    if(intPage>intPageCount) intPage=intPageCount;%>
            <tr>
                <td class="STYLE1" height="50">序号</td>
                <td class="STYLE1" height="50">姓名</td>
                <td class="STYLE1" height="50">Email</td>
                <td class="STYLE1" height="50">学号</td>
                <td class="STYLE1" height="50">操作</td>
            </tr>
            <%    for (int i = 0; i < siteusers.size(); i++) {
            %>
            <tr height="50">
                <td height="50">
                    <%=siteusers.get(i).getUid()%>
                </td>
                <td height="50">
                    <%=siteusers.get(i).getUsername()%>
                </td>
                <td height="50">
                    <%= siteusers.get(i).getEmail()%>
                </td>
                <td height="50">
                    <%=siteusers.get(i).getInstituteId()%>
                </td>
                <td height="50">
                    <a href="http://localhost:8080/UserAction!deleteoneuser.action?uid=<%=siteusers.get(i).getUid()%>">删除</a>
                </td>
            </tr>
            <%}%>
            </table>
            <table align="center">
            <tr><td align="right">第<%=intPage%>页 共<%=intPageCount%>页</td></tr>
            <%if(intPage>1){%>
            <a href="http://localhost:8080/UserAction!getsomeusers.action?pagenumber=<%=intPage-1%> ">上一页</a>
            <% }else{ %>
            上一页
            <%} %>
            <%if(intPage<intPageCount){%>
            <a href="http://localhost:8080/UserAction!getsomeusers.action?pagenumber=<%=intPage+1%>">下一页</a>
            <% }else {%>
            下一页
            <%}%>
            </table>
            <%}else{%>
            <tr class="STYLE1">
                暂时无用户信息
            </tr>
            <%}%>
    </div>
    <div id="footer_1">
    </div>
</div>
</body>
</html>