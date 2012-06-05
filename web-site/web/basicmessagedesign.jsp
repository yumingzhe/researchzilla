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
    <title>��վ������Ϣ����ҳ��</title>
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
        .STYLE2 {
            font-size: 18px;
            font-weight: bold;
            background-image: url("img/menu.jpg");
        }
        .STYLE8 {
            font-size: 18px;
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
        <p>&nbsp;</p>
        <%request.setCharacterEncoding("gb2312");
          response.setContentType("text/html;charset=gb2312");%>
        <%if(request.getAttribute("websitemessage")!=null){%>
        <form id="form1" name="form1" method="post" enctype="multipart/form-data" action="dobasicmessagechange.jsp">
            <table width="543" height="239" border="0" align="center">
                <tr>
                    <td width="171" height="53" class="STYLE8">��վ���⣺</td>
                    <td width="362"><label class="STYLE8">
                        <input name="websitename" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getWebsitename()%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">��վ����ͼƬ��</td>
                    <td><label>
                        <input name="path" type="file"  class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getPath()%>" />
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">��վά�������䣺</td>
                    <td><label>
                        <input name="maintenanceaddress" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getMaintenanceaddress()%>"/>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">��վĬ�����ԣ�</td>
                    <td><label>
                        <select name="defaultlanguage" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getDefaultlanguage()%>">
                            <option value="Chinese">Chinese</option>
                            <option value="English">English</option>
                        </select>
                    </label></td>
                </tr>
                <tr>
                    <td class="STYLE8">��վ��������</td>
                    <td><label>
                        <input name="maintenanceaddress" type="text" class="STYLE8" value="<%=((WebsiteMessage)request.getAttribute("websitemessage")).getVisits()%>"/>
                    </label></td>
                </tr>
            </table>
            <p align="center" class="STYLE5">
                <label>
                    <input name="Submit" type="submit" class="STYLE8" value="����" />
                </label>
            </p>
        </form>
        <%}%>
         <%String imgUrl= ((WebsiteMessage)request.getAttribute("websitemessage")).getPath();
         %>
        <div align="center">
            <img src="<%=imgUrl%>" alt="images"/>
        </div>

    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>