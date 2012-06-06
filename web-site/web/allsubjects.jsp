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
            <li><a href="#" class="STYLE2">��վ�������</a>
                <ul>
                    <li><a href="http://localhost:8080/SubjectAction!getallsubjectsm.action">�鿴ȫ������</a></li>
                    <li><a href="addsubject.jsp">����¿���</a></li>
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
                <td height="50"> <a href="http://localhost:8080/SubjectAction!deleteonesubject.action?subjectid=<%=subjects.get(i).getId()%>">ɾ��</a>
                </td>
                <td height="50"> <a href="http://localhost:8080/SubjectAction!updateonesubject.action?subjectid=<%=subjects.get(i).getId()%>">�޸�</a>
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