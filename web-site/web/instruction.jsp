<%@ page import="pojo.WebsiteMessage" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: ����3:50
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="pojo.Subject" %>
<%@ page contentType="text/html;charset=gb2312"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��̨����ҳ��</title>
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


</head>
<body>
<div id="container_1">
    <div id="header_2">
        <div class="STYLE1" id="header_1">
            <table width="930" height="195" border="0">
                <tr>
                    <td class="STYLE1"><p align="center"><%=session.getAttribute("websitename")%></p></td>
                </tr>
            </table>
            <div align="right" class="STYLE3" ><a href="index.jsp">��ҳ</a></div>
        </div>
    </div>
    <div class="STYLE2"></div>
    <div id="mainContent_2">
        <p>&nbsp;</p>
        <p align="center" class="STYLE4 ">
            <%if(session.getAttribute("websitename")!=null){%>
            <%=session.getAttribute("websitename")%>
            <%}%>��վ�������
        </p>
        <%if(session.getAttribute("subjects")!=null){ %>
        <table  border="2" align="center" bordercolor="#00CCFF">
         <% List<Subject> subjects= (List<Subject>) session.getAttribute("subjects");%>
            <tr>
                <td class="STYLE2" >���</td>
                <td class="STYLE2" >����</td>
                <td class="STYLE2" >�о�����</td>
                <td class="STYLE2" >������Ա</td>
                <td class="STYLE2" >��ʼʱ��</td>
                <td class="STYLE2" >����</td>
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
            </tr>
            <%}%>
        </table>
        <%}%>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>