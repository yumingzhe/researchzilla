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
            <%}%>��̨����
        </div>
        <div align="right" class="STYLE3" ><a href="index.jsp">��ҳ</a></div>
    </div>
    <div id="menu">
        <ul id="nav">
            <li><a href="#" class="STYLE2">�û���Ϣ����</a>
                <ul>
                    <li><a href="http://localhost:8080/UserAction!getsomeusers.action">�鿴�����û�</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">��վ��Ϣ����</a>
                <ul>
                    <li><a href="addmesssage.jsp" >���ͼƬ��Ϣ</a></li>
                    <li><a href="addtextmessage.jsp">����ı���Ϣ</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomemessages.action">�鿴�ı���Ϣ</a></li>
                    <li><a href="http://localhost:8080/MessageAction!getsomepicturemessages.action">�鿴ͼƬ��Ϣ</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">ϵͳ��Ϣά��</a>
                <ul>
                    <li><a href="http://localhost:8080/BasicMessageChangeAction.action">������Ϣ����</a></li>
                    <li><a href="http://localhost:8080/GetStatisticsAction.action">ͳ����Ϣ���</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">��վ���ӹ���</a>
                <ul>
                    <li><a href="http://localhost:8080/GetLinkAction!getalllinks.action">�鿴ȫ������</a></li>
                    <li><a href="addlink.jsp">���������</a></li>
                </ul>
            </li>
            <li><a href="#" class="STYLE2">������Ϣ����</a>
                <ul>
                    <li><a href="http://localhost:8080/FeedbackAction!getsomefeedbacks.action">�鿴��������</a></li>
                </ul>
            </li>
        </ul>
    </div>
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