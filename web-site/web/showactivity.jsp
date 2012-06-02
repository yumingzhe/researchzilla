<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Activity" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla|Activities</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>

    <!--[if gt IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie.1336721654.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie7.1336721654.css"/>
    <![endif]-->
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie6.1336721654.css"/>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://elgg-yumingzhe.rhcloud.com/activity?view=rss"/>
    <%--<link rel="meta" type="application/rdf+xml" title="FOAF"
          href="http://elgg-yumingzhe.rhcloud.com/activity?view=foaf"/>--%>
</head>
<body>
<div class="elgg-page elgg-page-default">
<div class="elgg-page-messages">
    <ul class="elgg-system-messages">
        <li class="hidden"></li>
    </ul>
</div>

<div class="elgg-page-topbar">
    <div class="elgg-inner">
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-alt">
            <li class="elgg-menu-item-usersettings"><a
                    href="http://localhost:8080/accountsetting.jsp"><span
                    class="elgg-icon elgg-icon-settings "></span>Settings</a></li>
            <li class="elgg-menu-item-logout"><a
                    href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338188590&amp;__elgg_token=70d0293b14df7075c3878caadea61971">Log
                out</a></li>
        </ul>
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">

            <%--网站图标--%>
            <%-- <li class="elgg-menu-item-elgg-logo"><a href="http://www.elgg.org/" class="elgg-topbar-logo"><img
            src="http://elgg-yumingzhe.rhcloud.com/_graphics/elgg_toolbar_logo.gif" alt="Elgg logo" width="38"
            height="20"/></a></li>--%>
            <li class="elgg-menu-item-profile">
                <a href="http://elgg-yumingzhe.rhcloud.com/profile/elgg"
                   class="elgg-topbar-avatar">
                    <img
                            src="img/icondirect.jpg"
                            alt="elgg"
                            title="Profile" class="elgg-border-plain elgg-transition"/>
                </a>
            </li>
            <%--<li class="elgg-menu-item-friends"><a href="http://elgg-yumingzhe.rhcloud.com/friends/elgg" title="Friends"><span
          class="elgg-icon elgg-icon-users "></span></a></li>--%>
            <li class="elgg-menu-item-messages"><a
                    href="http://elgg-yumingzhe.rhcloud.com/messages/inbox/elgg"><span
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
            <li class="elgg-menu-item-activity elgg-state-selected"><a
                    href="http://elgg-yumingzhe.rhcloud.com/activity">Activity</a></li>
            <li class="elgg-menu-item-blog"><a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=1%>">Blogs</a>
            </li>
            <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
        </ul>
        <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
            <fieldset>
                <%--
                   <input type="text" class="search-input" size="21" name="q" value="Search"
                       onblur="if (this.value=='') { this.value='Search' }"
                       onfocus="if (this.value=='Search') { this.value='' };"/>
                <input type="submit" value="Go" class="search-submit-button"/>
                --%>
            </fieldset>
        </form>
    </div>
</div>
<div class="elgg-page-body">
    <div class="elgg-inner">

        <div class="elgg-layout <%--elgg-layout-one-sidebar--%> clearfix elgg-river-layout">
            <%--<div class="elgg-sidebar">
                <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
                    <li class="elgg-menu-item-rss"><a href="http://elgg-yumingzhe.rhcloud.com/activity?view=rss"
                                                      title="RSS feed for this page"><span
                            class="elgg-icon elgg-icon-rss "></span></a>
                    </li>
                    <li class="elgg-menu-item-bookmark"><a
                            href="http://elgg-yumingzhe.rhcloud.com/bookmarks/add/73?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Factivity"
                            title="Bookmark this page" rel="nofollow"><span
                            class="elgg-icon elgg-icon-push-pin-alt "></span></a>
                    </li>
                </ul>
            </div>--%>

            <div class="elgg-main elgg-body">
                <div class="elgg-head clearfix">
                    <h2 class="elgg-heading-main">Activity</h2>
                </div>
                <ul class="elgg-list elgg-list-river elgg-river">
                    <%
                        List<Activity> activities = (List<Activity>) request.getAttribute("useractivities");
                        for (Activity activity : activities) {
                    %>
                    <li id="item-river-27" class="elgg-item">
                        <div class="elgg-image-block elgg-river-item clearfix">
                            <div class="elgg-image">
                                <div class="elgg-avatar elgg-avatar-small">
                                    <span class="elgg-icon elgg-icon-hover-menu "></span>
                                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=activity.getSiteUser().getUid()%>"
                                       class="">
                                        <img src="img/arrow.png" alt="yumingzhe" title="yumingzhe" class=""/>
                                    </a>
                                </div>
                            </div>
                            <div class="elgg-body">
                                <div class="elgg-river-summary">
                                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=activity.getSiteUser().getUid()%>"
                                       class="elgg-river-subject">
                                        <%=activity.getSiteUser().getUsername()%>
                                    </a>
                                    <%=activity.getAction()%>
                                    <%
                                        if (activity.getAction().equals("发表日志")) {
                                    %>
                                    <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=activity.getBlog().getId()%>"
                                       class="elgg-river-object">
                                        <%=activity.getBlog().getTitle()%>
                                    </a>
                                    <%
                                        }
                                        if (activity.getAction().equals("发表评论")) {
                                    %>对
                                    <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=activity.getCommentEntity().getBlog().getId()%>"
                                       class="elgg-river-object">
                                        <%=activity.getCommentEntity().getBlog().getTitle()%>
                                    </a>
                                    <%
                                        }
                                    %>
                                    于<span
                                        class="elgg-river-timestamp"><%=DateFormat.formatPeriod(activity.getActivityOccurTime().getTime(), new Date().getTime())%></span>前发布

                                    <%
                                        if (activity.getAction().equals("发表日志")) {
                                    %>
                                    <div class="elgg-river-message"><%=activity.getBlog().getDescription()%>
                                    </div>
                                    <%
                                        }
                                        if (activity.getAction().equals("发表评论")) {
                                    %>
                                    <%--<div class="elgg-river-message">

                                        :<%=activity.getCommentEntity().getContent()%>
                                    </div>--%>
                                    <div class="elgg-river-responses"><span
                                            class="elgg-river-comments-tab">评论</span>
                                        <ul class="elgg-list elgg-river-comments">
                                            <li id="item-annotation-16" class="elgg-item">
                                                <div class="elgg-image-block clearfix">
                                                    <div class="elgg-image">
                                                        <div class="elgg-avatar elgg-avatar-tiny">
                                                            <%--<span class="elgg-icon elgg-icon-hover-menu "></span>
                                                            <ul class="elgg-menu elgg-menu-hover">
                                                                <li><a href="img/icondirect.jpg"><span
                                                                        class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                                                </li>
                                                            </ul>--%>
                                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                               class=""><img
                                                                    src="img/icondirect.jpg"
                                                                    alt="yumingzhe" title="yumingzhe" class=""
                                                            <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>/>
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="elgg-body">
                                                        <div class="mbn">
                                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">
                                                                <%=activity.getCommentEntity().getSiteUser().getUsername()%>
                                                            </a>
	                                                                <span class="elgg-subtext">
	                                                                     	<acronym
                                                                                     title="<%=activity.getCommentEntity().getPostTime()%>">
                                                                                 <%=DateFormat.formatPeriod(activity.getCommentEntity().getPostTime().getTime(), new Date().getTime())%>
                                                                             </acronym>
	                                                                </span> 前

                                                            <div class="elgg-output">
                                                                <p><%=activity.getCommentEntity().getContent()%>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        </ul>
                                        <%--<form method="post"
                                              action="http://elgg-yumingzhe.rhcloud.com/action/comments/add"
                                              id="comments-add-82" class="elgg-form hidden elgg-form-comments-add">
                                            <fieldset><input type="hidden" name="__elgg_token"
                                                             value="9ff243949a404e7618e5ec763a5fa42d"/><input
                                                    type="hidden"
                                                    name="__elgg_ts"
                                                    value="1338528297"/>
                                            </fieldset>
                                        </form>--%>
                                    </div>
                                    <%
                                        }
                                    %>
                                </div>
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
</div>
</div>
</div>
<div class="elgg-page-footer">
    <div class="elgg-inner">
        <ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
        </ul>
        <div class="mts clearfloat float-alt">
        </div>
    </div>
</div>
</div>
</body>
</html>