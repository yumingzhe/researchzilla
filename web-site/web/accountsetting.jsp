<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Researchzilla | Settings</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>

    <!--[if gt IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie.1338369118.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie7.1338369118.css"/>
    <![endif]-->
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie6.1338369118.css"/>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <%-- <link rel="meta" type="application/rdf+xml" title="FOAF"
    href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe?view=foaf"/>--%>
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
                <%--<li class="elgg-menu-item-administration"><a href="http://elgg-yumingzhe.rhcloud.com/admin"><span
                        class="elgg-icon elgg-icon-settings "></span>Administration</a></li>--%>
                <li class="elgg-menu-item-usersettings elgg-state-selected"><a
                        href="http://localhost:8080/personalsetting.jsp"><span
                        class="elgg-icon elgg-icon-settings "></span>Settings</a></li>
                <li class="elgg-menu-item-logout"><a
                        href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338531088&amp;__elgg_token=97bb23aef67918894673a41a20cdaba2">Log
                    out</a></li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-elgg-logo"><a
                        href="http://localhost:8080/getUserAllActivitiesAction?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>"
                        class="elgg-topbar-logo"><img
                        src="img/elgg_toolbar_logo.gif" alt="Elgg logo"
                        width="38" height="20"/></a></li>
                <li class="elgg-menu-item-profile"><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                      class="elgg-topbar-avatar"><img
                        src="http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=topbar"
                        alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"/></a></li>
                <li class="elgg-menu-item-messages"><a
                        href="http://elgg-yumingzhe.rhcloud.com/messages/inbox/yumingzhe"><span
                        class='elgg-icon elgg-icon-mail'></span></a></li>
            </ul>
        </div>
    </div>

    <div class="elgg-page-header">
        <div class="elgg-inner">

            <h1>
                <a class="elgg-heading-site"
                   href="http://localhost:8080/getUserAllActivities?uid=<%=siteUser.getUid()%>">
                    Researchzilla </a>
            </h1>
            <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
                <li class="elgg-menu-item-activity"><a
                        href="http://localhost:8080/getUserAllActivitiesAction?uid=<%=siteUser.getUid()%>">Activity</a>
                </li>
                <li class="elgg-menu-item-blog"><a
                        href="http://localhost:8080/getUserAllBlogs?uid=<%=siteUser.getUid()%>">Blogs</a></li>
                <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all#">Files</a></li>
                <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all#">Groups</a></li>
            </ul>
            <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
                <fieldset>
                    <%-- <input type="text" class="search-input" size="21" name="q" value="Search"
                        onblur="if (this.value=='') { this.value='Search' }"
                        onfocus="if (this.value=='Search') { this.value='' };"/>
                 <input type="submit" value="Go" class="search-submit-button"/>--%>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout elgg-layout-one-sidebar clearfix">
                <div class="elgg-sidebar">
                    <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
                        <%--<li class="elgg-menu-item-bookmark"><a
                                href="http://elgg-yumingzhe.rhcloud.com/bookmarks/add/35?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Fsettings%2Fuser%2Fyumingzhe"
                                title="Bookmark this page" rel="nofollow"><span
                                class="elgg-icon elgg-icon-push-pin-alt "></span></a></li>--%>
                    </ul>
                    <ul class="elgg-menu elgg-menu-page elgg-menu-page-default">
                        <li class="elgg-menu-item-1-account elgg-state-selected"><a
                                href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">账户设置</a></li>
                        <li class="elgg-menu-item-1-plugins"><a
                                href="http://elgg-yumingzhe.rhcloud.com/settings/plugins/yumingzhe">个人信息设置</a></li>
                        <li class="elgg-menu-item-1-statistics"><a
                                href="http://elgg-yumingzhe.rhcloud.com/settings/statistics/yumingzhe">账户统计信息</a></li>
                        <%--<li class="elgg-menu-item-2-a-user-notify"><a
                                href="http://elgg-yumingzhe.rhcloud.com/notifications/personal">Notifications</a></li>
                        <li class="elgg-menu-item-2-group-notify"><a
                                href="http://elgg-yumingzhe.rhcloud.com/notifications/group">Group notifications</a>
                        </li>--%>
                    </ul>
                </div>

                <div class="elgg-main elgg-body">
                    <ul class="elgg-menu elgg-breadcrumbs">
                        <li><a href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">Settings</a></li>
                    </ul>
                    <h2>账户设置</h2>

                    <form method="post" action="http://elgg-yumingzhe.rhcloud.com/action/usersettings/save"
                          class="elgg-form elgg-form-alt elgg-form-usersettings-save">
                        <fieldset><input type="hidden" name="__elgg_token"
                                         value="97bb23aef67918894673a41a20cdaba2"/><input type="hidden" name="__elgg_ts"
                                                                                          value="1338531088"/><input
                                type="hidden" name="name" value="yumingzhe"/><input type="hidden" name="guid"
                                                                                    value="35"/>

                            <div class="elgg-module elgg-module-info">
                                <div class="elgg-head">
                                    <h3>账户密码</h3>
                                </div>
                                <div class="elgg-body">
                                    <p>
                                        当前密码:

                                        <input type="password" value="" name="current_password"
                                               class="elgg-input-password"/>
                                    </p>

                                    <p>
                                        新密码:

                                        <input type="password" value="" name="password" class="elgg-input-password"/>
                                    </p>

                                    <p>
                                        确认密码:
                                        <input type="password" value="" name="password2" class="elgg-input-password"/>
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

                                        <input type="text" name="email" value="yumingzhe@live.cn"
                                               class="elgg-input-email"/></p>
                                </div>
                            </div>
                            <%--<div class="elgg-module elgg-module-info">
                                <div class="elgg-head">
                                    <h3>Language settings</h3>
                                </div>
                                &lt;%&ndash;<div class="elgg-body">
                                    <p>
                                        Your language:
                                        <select name="language" class="elgg-input-dropdown">
                                            <option value="en">English</option>
                                        </select>
                                    </p>
                                </div>&ndash;%&gt;
                            </div>--%>
                            <div class="elgg-foot"><input type="submit" value="Save"
                                                          class="elgg-button elgg-button-submit"/>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="elgg-page-footer">
        <div class="elgg-inner">
            <ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
                <%-- <li class="elgg-menu-item-report-this"><a
             href="javascript:elgg.forward(&#039;reportedcontent/add&#039;+&#039;?address=&#039;+encodeURIComponent(location.href)+&#039;&amp;title=&#039;+encodeURIComponent(document.title));"
             title="Report this page to an administrator"><span
             class="elgg-icon elgg-icon-report-this "></span>Report this</a></li>--%>
            </ul>
            <div class="mts clearfloat float-alt"><a href="http://elgg.org" class=""><%--<img
                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
                    alt="Powered by Elgg" width="106" height="15"/>--%></a></div>
        </div>
    </div>
</div>
</body>
</html>