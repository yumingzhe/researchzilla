<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Researchzilla: Personal statistics</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
</head>
<body>
<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
    UserEntity userEntity = siteUser.getUserEntity();
%>
<div class="elgg-page elgg-page-default">
    <div class="elgg-page-messages">
        <ul class="elgg-system-messages">
            <li class="hidden"></li>
        </ul>
    </div>

    <div class="elgg-page-topbar">
        <div class="elgg-inner">
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-alt">
                <li class="elgg-menu-item-usersettings">
                    <a href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">
                        <span class="elgg-icon elgg-icon-settings "></span>
                        Settings
                    </a>
                </li>
                <li class="elgg-menu-item-logout">
                    <a href="http://localhost:8080/ExitAction.action">
                        Log out
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                        <img src="http://localhost:8080/<%=siteUser.getPortrait()%>"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition" width="16"
                             height="16"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="elgg-page-header">
        <div class="elgg-inner">

            <h1>
                <a class="elgg-heading-site"
                   href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
                    Researchzilla
                </a>
            </h1>
            <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
                <li class="elgg-menu-item-activity">
                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
                        最近活动
                    </a>
                </li>
                <li class="elgg-menu-item-blog">
                    <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=siteUser.getUid()%>">
                        日志
                    </a>
                </li>
                <li class="elgg-menu-item-file">
                    <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">
                        文件
                    </a>
                </li>
                <li class="elgg-menu-item-groups">
                    <a href="http://localhost:8080/getUserAllGroupsAction.action?uid=<%=siteUser.getUid()%>">
                        组
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">
            <div class="elgg-layout elgg-layout-one-sidebar clearfix">
                <div class="elgg-sidebar">
                    <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
                    </ul>
                    <ul class="elgg-menu elgg-menu-page elgg-menu-page-default">
                        <li class="elgg-menu-item-1-account">
                            <a href="http://localhost:8080/accountsetting.jsp">
                                账户设置
                            </a>
                        </li>
                        <li class="elgg-menu-item-1-plugins">
                            <a href="http://localhost:8080/personalinfosetting.jsp">
                                个人信息设置
                            </a>
                        </li>
                        <li class="elgg-menu-item-1-statistics elgg-state-selected">
                            <a href="http://localhost:8080/personalinfostatistics.jsp">
                                账户统计信息
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="elgg-main elgg-body">
                    <ul class="elgg-menu elgg-breadcrumbs">
                        <li>
                            <a href="http://localhost:8080/accountsetting.jsp">
                                个人设置
                            </a>
                        </li>
                        <li>账户统计信息</li>
                    </ul>
                    <h2>统计信息</h2>

                    <div class="elgg-module elgg-module-info">
                        <div class="elgg-head">
                            <h3>个人简介</h3>
                        </div>
                        <div class="elgg-body">
                            <table class="elgg-table-alt">
                                <tr>
                                    <td class="column-one">用户名</td>
                                    <td class="column-one"><%=siteUser.getUsername()%>
                                    </td>
                                    <td class="column-one">真实姓名</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getRealName() : ""%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="column-one">Email</td>
                                    <td class="column-one"><%=siteUser.getEmail()%>
                                    </td>
                                    <td class="column-one">出生日期</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getBirthday() != null ? userEntity.getBirthday() : "" : ""%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="column-one">国籍</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getCountry() != null ? userEntity.getCountry() : "" : ""%>
                                    </td>
                                    <td class="column-one">年龄</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getAge() : ""%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="column-one">学历</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getEducation() != null ? userEntity.getEducation() : "" : ""%>
                                    </td>
                                    <td class="column-one">职称</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getProfessionaltitle() != null ? userEntity.getProfessionaltitle() : "" : ""%>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="column-one">联系方式</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getMobilePhone() : ""%>
                                    </td>
                                    <td class="column-one">个人网站</td>
                                    <td class="column-one"><%=userEntity != null ? userEntity.getPersonalWebsite() != null ? userEntity.getPersonalWebsite() : "" : ""%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="elgg-module elgg-module-info">
                        <div class="elgg-head">
                            <h3>个人详细信息</h3>
                        </div>
                        <div class="elgg-body">
                            <table class="elgg-table-alt">
                                <tr class="odd">
                                    <td><b>个人简介:</b></td>
                                    <td>
                                        <%=userEntity != null ? userEntity.getPersonalprofile() != null ? userEntity.getPersonalprofile() : "" : ""%>
                                    </td>
                                </tr>
                                <tr class="even">
                                    <td><b>研究兴趣:</b></td>
                                    <td><%=userEntity != null ? userEntity.getResearchinterest() != null ? userEntity.getResearchinterest() : "" : ""%>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td><b>主要经历:</b></td>
                                    <td><%=userEntity != null ? userEntity.getPersonaldetail() != null ? userEntity.getPersonaldetail() : "" : ""%>
                                    </td>
                                </tr>
                                <tr class="even">
                                    <td><b>科研项目:</b></td>
                                    <td><%=userEntity != null ? userEntity.getResearchprojects() != null ? userEntity.getResearchprojects() : "" : ""%>
                                    </td>
                                </tr>
                                <tr class="odd">
                                    <td><b>个人荣誉:</b></td>
                                    <td><%=userEntity != null ? userEntity.getPersonalhonor() != null ? userEntity.getPersonalhonor() : "" : ""%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="elgg-page-footer">
        <div class="elgg-inner">
        </div>
    </div>
</div>
</body>
</html>