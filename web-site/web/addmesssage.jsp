<%--
  User: wangyan
  Date: 12-5-30
  Time: 下午1:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>图片信息添加页面</title>
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
        <form id="addmessageform" name="addmessageform" method="post"  enctype="multipart/form-data" action="doaddmessage.jsp">
            <table width="623" height="406" border="0" align="center">
                <tr>
                    <td width="184"><div align="center" class="STYLE3">标题*</div></td>
                    <td width="429"><label>
                        <input name="topic" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">文本类型*</div></td>
                    <td><label>
                        <select name="type" class="STYLE3">
                            <option value="picturenews">picturenews</option>
                            <option value="accomplishment">accomplishment</option>
                        </select>
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">作者*</div></td>
                    <td><label>
                        <input name="author" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">发布者*</div></td>
                    <td><label>
                        <input name="publisher" type="text" class="STYLE3" />
                    </label></td>
                </tr>
                <tr>
                    <td height="28"><div align="center" class="STYLE3">图片*</div></td>
                    <td><input name="picture" type="file" class="STYLE3" /></td>
                </tr>
                <tr>
                    <td><div align="center" class="STYLE3">内容*</div></td>
                    <td><label>
                        <textarea name="content" cols="50" rows="15" class="STYLE3"></textarea>
                    </label></td>
                </tr>

                <tr>
                    <td height="28"><label>
                        <div align="center" class="sfhover">
                            <input name="Submit" type="submit" class="STYLE3" value="提交" />
                        </div>
                    </label></td>
                    <td><label>
                        <div align="center">
                            <input name="Reset" type="reset" class="STYLE3" value="重置" />
                        </div>
                    </label></td>
                </tr>
            </table>
            <p>&nbsp;</p>
        </form>
        <p align="center" class="STYLE3">带*的为必填项</p>
    </div>
    <div id="footer_1"></div>
</div>
</body>
</html>