<%@ page import="pojo.WebsiteMessage" %>
<%--
  User: wangyan
  Date: 12-5-28
  Time: ����5:00
--%>
<%@ page language="java"  pageEncoding="gb2312"%>
<%@ page contentType="text/html;charset=gb2312"  %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��վͳ����Ϣ���ҳ��</title>
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

</head>
<body>

<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE1">
            <%if(session.getAttribute("websitename")!=null){%>
            <p align="center"><%=session.getAttribute("websitename")%></p>
            <%}%>
            ��̨����
        </div>
        <div align="right" ><a href="managepage.jsp" class="STYLE3">���غ�̨����ҳ��</a></div>
    </div>
 <div class="STYLE2"></div>
    <div id="mainContent_2">
        <p align="center" class="STYLE1 ">��վ��̬ͳ����Ϣ��Ϣ����</p>
        <p>&nbsp;</p>
        <%request.setCharacterEncoding("gb2312");
            response.setContentType("text/html;charset=gb2312");%>
            <table  width="400" border="2" bordercolor="#00CCFF" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ��ע���û�����</td>
                    <%if(request.getAttribute("usercount")!=null){%>
                    <td><%=request.getAttribute("usercount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ�ܵ�¼��������</td>
                    <%if(request.getAttribute("visits")!=null){%>
                    <td><%=request.getAttribute("visits")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ�ڲ�֪ͨ������</td>
                    <%if(request.getAttribute("internalnoticecount")!=null){%>
                    <td><%=request.getAttribute("internalnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ���¹���������</td>
                    <%if(request.getAttribute("publicnoticecount")!=null){%>
                    <td><%=request.getAttribute("publicnoticecount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ���ſ�Ѷ������</td>
                    <%if(request.getAttribute("newscount")!=null){%>
                    <td><%=request.getAttribute("newscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վͼƬ����������</td>
                    <%if(request.getAttribute("picturenewscount")!=null){%>
                    <td><%=request.getAttribute("picturenewscount")%></td>
                    <%}%>
                </tr>
                <tr>
                    <td width="171" height="53" class="STYLE2">��վ�ɹ��۽�������</td>
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