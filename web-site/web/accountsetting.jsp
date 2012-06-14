<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<html>
<head>
    <title>Researchzilla | Settings</title>
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
                <li class="elgg-menu-item-usersettings elgg-state-selected"><a
                        href="http://localhost:8080/personalsetting.jsp"><span
                        class="elgg-icon elgg-icon-settings "></span>个人设置</a></li>
                <li class="elgg-menu-item-logout">
                    <a href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338531088&amp;__elgg_token=97bb23aef67918894673a41a20cdaba2">
                        Log out
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-profile">
                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"
                       class="elgg-topbar-avatar">
                        <img src="http://localhost:8080/<%=siteUser.getPortrait()%>"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition" height="16"
                             width="16"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="elgg-page-header">
        <div class="elgg-inner">
            <h1>
                <a class="elgg-heading-site"
                   href="http://localhost:8080/getUserAllActivities.action?uid=<%=siteUser.getUid()%>">
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
                    <a href="http://elgg-yumingzhe.rhcloud.com/file/all#">
                        文件
                    </a>
                </li>
                <li class="elgg-menu-item-groups">
                    <a href="http://elgg-yumingzhe.rhcloud.com/groups/all#">
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
                        <li class="elgg-menu-item-1-account elgg-state-selected">
                            <a href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">
                                账户设置
                            </a>
                        </li>
                        <li class="elgg-menu-item-1-plugins">
                            <a href="http://localhost:8080/personalinfosetting.jsp">
                                个人信息设置
                            </a>
                        </li>
                        <li class="elgg-menu-item-1-statistics">
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
                    </ul>
                    <h2>账户设置</h2>

                    <form method="post" action="http://localhost:8080/updateAccountSettingAction.action"
                          class="elgg-form elgg-form-alt elgg-form-usersettings-save">
                        <fieldset>
                            <input type="hidden" name="uid" value="<%=siteUser.getUid()%>"/>

                            <div class="elgg-module elgg-module-info">
                                <div class="elgg-head">
                                    <h3>账户密码</h3>
                                </div>
                                <div class="elgg-body">
                                    <p>
                                        当前密码:

                                        <input type="password" name="oldpasswd"
                                               class="elgg-input-password"/>
                                    </p>

                                    <p>
                                        新密码:
                                        <input type="password" name="newpasswd" class="elgg-input-password"/>
                                    </p>

                                    <p>
                                        确认密码:
                                        <input type="password" name="confirmpasswd"
                                               class="elgg-input-password"/>
                                    </p>
                                </div>
                            </div>
                            <div class="elgg-module elgg-module-info">
                                <div class="elgg-head">
                                    <h3>邮件设置</h3>
                                </div>
                                <div class="elgg-body">
                                    <p>
                                        邮件地址:
                                        <input type="text" name="email" value="<%=siteUser.getEmail()%>"
                                               class="elgg-input-email"/>
                                    </p>
                                </div>
                            </div>
                            <div class="elgg-foot">
                                <input type="submit" value="Save" class="elgg-button elgg-button-submit"/>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="elgg-page-footer">
    </div>
</div>
</body>
</html>