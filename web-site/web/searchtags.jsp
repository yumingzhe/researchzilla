<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla: Results for "<%=request.getParameter("tag")%>"</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
</head>
<body>
<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
    List<Blog> blogs = (List<Blog>) request.getAttribute("tagresult");
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
                        <span class="elgg-icon elgg-icon-settings "></span>个人设置</a></li>
                <li class="elgg-menu-item-logout"><a
                        href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338626446&amp;__elgg_token=5a560c51917aaf244b248187ca2219dd">Log
                    out</a></li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
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
                <a class="elgg-heading-site" href="http://elgg-yumingzhe.rhcloud.com/">
                    Researchzilla </a>
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
                <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">
                    文件
                </a>
                </li>
                <li class="elgg-menu-item-groups">
                    <a href="http://elgg-yumingzhe.rhcloud.com/groups/all">
                        组
                    </a>
                </li>
            </ul>
            <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
                <fieldset>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout <%--elgg-layout-one-sidebar--%> clearfix">
                <div class="elgg-main elgg-body">
                    <h2>Results for "<%=request.getParameter("tag")%>"</h2>

                    <h2 class="search-heading-category">Tags</h2>
                    <ul class="elgg-list search-list">
                        <%
                            for (Blog blog : blogs) {
                        %>
                        <li id="elgg-object-54" class="elgg-item">
                            <div class="elgg-image-block clearfix">
                                <div class="elgg-image">
                                    <div class="elgg-avatar elgg-avatar-tiny">
                                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/wangwu" class=""><img
                                                src="img/icondirect.jpg"
                                                alt="wangwu" title="wangwu" class=""
                                        <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/_graphics/icons/user/defaulttiny.gif) no-repeat;"--%>/></a>
                                    </div>
                                </div>
                                <div class="elgg-body">
                                    <p class="mbn">
                                        <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>">
                                            <%=blog.getTitle()%>
                                        </a>
                                    </p>
                                    <%=blog.getDescription()%>
                                    <p class="elgg-subtext">Tags:
                                        <strong class="search-highlight search-highlight-color1">
                                            <%=blog.getTag()%>
                                        </strong>
                                    </p>

                                    <p class="elgg-subtext">
                                        <acronym title="11 May 2012 @ 7:04am">
                                            <%=DateFormat.formatPeriod(blog.getPostDate().getTime(), new Date().getTime())%>
                                        </acronym>前
                                    </p>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="elgg-page-footer">
        <div class="elgg-inner">
            <ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
            </ul>
            <div class="mts clearfloat float-alt"></div>
        </div>
    </div>
</div>
</body>
</html>