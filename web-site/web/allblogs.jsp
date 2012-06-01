<%@ page import="pojo.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla</title>
    <link rel="SHORTCUT ICON" href="http://elgg-yumingzhe.rhcloud.com/_graphics/favicon.ico"/>
    <link rel="stylesheet" href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/elgg.1338195242.css"
          type="text/css"/>

    <!--[if gt IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie.1338195242.css"/>
    <![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie7.1338195242.css"/>
    <![endif]-->
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css"
          href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/ie6.1338195242.css"/>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>

    <%-- <script type="text/javascript">
            /**
             * Don't want to cache these -- they could change for every request
             */
            elgg.config.lastcache = 1338195242;
            elgg.config.viewtype = 'default';
            elgg.config.simplecache_enabled = 1;

            elgg.security.token.__elgg_ts = 1338291979;
            elgg.security.token.__elgg_token = 'ba88e76528e2e8a1f8a258e80e31f245';

            elgg.session.user = new elgg.ElggUser({"guid":"35", "type":"user", "subtype":false, "time_created":"1333026415", "time_updated":"1338291973", "container_guid":"0", "owner_guid":"0", "site_guid":"1", "name":"yumingzhe", "username":"yumingzhe", "language":"", "url":"http:\/\/elgg-yumingzhe.rhcloud.com\/profile\/yumingzhe", "admin":true});
            //Before the DOM is ready, but elgg's js framework is fully initalized
            elgg.trigger_hook('boot', 'system');</script>
    --%>

    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://elgg-yumingzhe.rhcloud.com/blog/all?view=rss"/>
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
            <%--<li class="elgg-menu-item-administration"><a href="http://elgg-yumingzhe.rhcloud.com/admin"><span
                    class="elgg-icon elgg-icon-settings "></span>Administration</a></li>--%>
            <li class="elgg-menu-item-usersettings"><a
                    href="http://localhost:8080/accountsetting.jsp"><span
                    class="elgg-icon elgg-icon-settings "></span>Settings</a></li>
            <li class="elgg-menu-item-logout"><a
                    href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338291979&amp;__elgg_token=ba88e76528e2e8a1f8a258e80e31f245">Log
                out</a></li>
        </ul>
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
            <%--网站图标--%>
            <%-- <li class="elgg-menu-item-elgg-logo"><a href="http://www.elgg.org/" class="elgg-topbar-logo"><img
           src="http://elgg-yumingzhe.rhcloud.com/_graphics/elgg_toolbar_logo.gif" alt="Elgg logo"
           width="38" height="20"/></a></li>--%>
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
               href="http://localhost:8080/getUserAllActivitiesAction?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                Researchzilla </a>
        </h1>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity"><a
                    href="http://localhost:8080/getUserAllActivitiesAction?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Activity</a>
            </li>
            <li class="elgg-menu-item-blog elgg-state-selected"><a
                    href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
            </li>
            <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
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
<div class="elgg-layout <%--elgg-layout-one-sidebar--%> clearfix">
<%--<div class="elgg-sidebar">
    <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
        <li class="elgg-menu-item-rss"><a href="http://elgg-yumingzhe.rhcloud.com/blog/all?view=rss"
                                          title="RSS feed for this page"><span
                class="elgg-icon elgg-icon-rss "></span></a></li>
        <li class="elgg-menu-item-bookmark"><a
                href="http://elgg-yumingzhe.rhcloud.com/bookmarks/add/35?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Fblog%2Fall"
                title="Bookmark this page" rel="nofollow"><span
                class="elgg-icon elgg-icon-push-pin-alt "></span></a></li>
    </ul>
    <div class="elgg-module  elgg-module-aside">
        <div class="elgg-head"><h3>Latest comments</h3></div>
        <div class="elgg-body">
            <ul class="elgg-list elgg-latest-comments">
                <li id="item-annotation-5" class="elgg-item">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <div class="elgg-avatar elgg-avatar-tiny">
                                <span class="elgg-icon elgg-icon-hover-menu "></span>
                                <ul class="elgg-menu elgg-menu-hover">
                                    <li>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                                class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                    </li>
                                    <li>
                                        <ul class="elgg-menu elgg-menu-hover-actions">
                                            <li class="elgg-menu-item-avatar-edit"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/avatar/edit/yumingzhe">Edit
                                                avatar</a></li>
                                            <li class="elgg-menu-item-profile-edit"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe/edit">Edit
                                                profile</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="elgg-menu elgg-menu-hover-admin">
                                            <li class="elgg-menu-item-logbrowser"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/admin/utilities/logbrowser?user_guid=35">Explore
                                                log</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                   class=""><img
                                        src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif"
                                        alt="yumingzhe" title="yumingzhe" class=""
                                        style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"/></a>
                            </div>
                        </div>
                        <div class="elgg-body"><span class="elgg-subtext">
    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                                href="http://elgg-yumingzhe.rhcloud.com/blog/view/49/-c-">典型的 C++
                            程序员成长经历</a> (<acronym title="29 March 2012 @ 1:28pm">61 days ago</acronym>): 再来一个评论
</span></div>
                    </div>
                </li>
                <li id="item-annotation-4" class="elgg-item">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <div class="elgg-avatar elgg-avatar-tiny">
                                <span class="elgg-icon elgg-icon-hover-menu "></span>
                                <ul class="elgg-menu elgg-menu-hover">
                                    <li>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                                class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                    </li>
                                    <li>
                                        <ul class="elgg-menu elgg-menu-hover-actions">
                                            <li class="elgg-menu-item-avatar-edit"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/avatar/edit/yumingzhe">Edit
                                                avatar</a></li>
                                            <li class="elgg-menu-item-profile-edit"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe/edit">Edit
                                                profile</a></li>
                                        </ul>
                                    </li>
                                    <li>
                                        <ul class="elgg-menu elgg-menu-hover-admin">
                                            <li class="elgg-menu-item-logbrowser"><a
                                                    href="http://elgg-yumingzhe.rhcloud.com/admin/utilities/logbrowser?user_guid=35">Explore
                                                log</a></li>
                                        </ul>
                                    </li>
                                </ul>
                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                   class=""><img
                                        src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif"
                                        alt="yumingzhe" title="yumingzhe" class=""
                                        style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"/></a>
                            </div>
                        </div>
                        <div class="elgg-body"><span class="elgg-subtext">
    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                                href="http://elgg-yumingzhe.rhcloud.com/blog/view/49/-c-">典型的 C++
                            程序员成长经历</a> (<acronym title="29 March 2012 @ 1:27pm">61 days ago</acronym>): 写的真好啊，学习啦。
</span></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div class="elgg-module  elgg-module-aside">
        <div class="elgg-head"><h3>Tag cloud</h3></div>
        <div class="elgg-body">
            <div class="elgg-tagcloud"><a
                    href="http://elgg-yumingzhe.rhcloud.com/search?q=c&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=blog"
                    style="font-size: 100%" title="c (1)">c</a>, <a
                    href="http://elgg-yumingzhe.rhcloud.com/search?q=alg&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=blog"
                    style="font-size: 100%" title="alg (1)">alg</a>, <a
                    href="http://elgg-yumingzhe.rhcloud.com/search?q=blog&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=blog"
                    style="font-size: 100%" title="blog (1)">blog</a></div>
            <p class="small"><span class="elgg-icon elgg-icon-tag "></span><a
                    href="http://elgg-yumingzhe.rhcloud.com/tags">All site tags</a></p></div>
    </div>
</div>--%>
<div class="elgg-main elgg-body">
    <ul class="elgg-menu elgg-breadcrumbs">
        <li>Blogs</li>
    </ul>
    <div class="elgg-head clearfix">
        <h2 class="elgg-heading-main">All blogs</h2>
        <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
            <li class="elgg-menu-item-add"><a href="http://localhost:8080/postblog.jsp"
                                              class="elgg-button elgg-button-action">发表新文章</a>
            </li>
        </ul>
    </div>
    <ul class="elgg-list elgg-list-entity">
        <%
            List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
            for (Blog blog : blogs) {
        %>
        <li id="elgg-object-50" class="elgg-item">
            <div class="elgg-image-block clearfix">
                <div class="elgg-image">
                    <div class="elgg-avatar elgg-avatar-tiny">
                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                        <%--<ul class="elgg-menu elgg-menu-hover">
                            <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                    class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                            <li>
                                <ul class="elgg-menu elgg-menu-hover-actions">
                                    <li class="elgg-menu-item-avatar-edit"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/avatar/edit/yumingzhe">Edit
                                        avatar</a></li>
                                    <li class="elgg-menu-item-profile-edit"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe/edit">Edit
                                        profile</a></li>
                                </ul>
                            </li>
                            <li>
                                <ul class="elgg-menu elgg-menu-hover-admin">
                                    <li class="elgg-menu-item-logbrowser"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/admin/utilities/logbrowser?user_guid=35">Explore
                                        log</a></li>
                                </ul>
                            </li>
                        </ul>--%>
                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                src="img/icondirect.jpg"
                                alt="yumingzhe" title="yumingzhe" class=""
                        <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>/></a>
                    </div>
                </div>
                <div class="elgg-body">
                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">

                        <li class="elgg-menu-item-access"><span
                                class="elgg-access elgg-access-private"><%=blog.getAccess()%></span>
                        </li>
                        <%
                            if (blog.getSiteUser().getUid() == ((SiteUser) session.getAttribute("user")).getUid()) {
                        %>
                        <li class="elgg-menu-item-edit"><a
                                href="http://localhost:8080/getSpecifiedBlogAction?blogid=<%=blog.getId()%>&type=update"
                                title="Edit this">Edit</a>
                        </li>
                        <%
                            }
                            if (blog.getSiteUser().getUid() == ((SiteUser) session.getAttribute("user")).getUid()) {
                        %>
                        <li class="elgg-menu-item-delete"><a
                                href="http://localhost:8080/deleteblogAction?blogid=<%=blog.getId()%>&uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>"
                                title="Delete this" rel="Are you sure you want to delete this item?"
                                class="elgg-requires-confirmation"><span
                                class="elgg-icon elgg-icon-delete "></span></a>
                        </li>
                        <%
                            }
                        %>
                        <%--<li class="elgg-menu-item-likes"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/likes/add?guid=50&amp;__elgg_ts=1338291979&amp;__elgg_token=ba88e76528e2e8a1f8a258e80e31f245"
                                title="Like this"><span
                                class="elgg-icon elgg-icon-thumbs-up "></span></a>
                        </li>--%>
                    </ul>
                    <h3>
                        <a href="http://localhost:8080/getSpecifiedBlogAction?blogid=<%=blog.getId()%>">
                            <%=blog.getTitle()%>
                        </a>
                    </h3>

                    <div class="elgg-subtext">由
                        <a href="http://localhost:8080/getUserAllBlogs">
                            <%=blog.getSiteUser().getUsername()%>
                        </a>于
                        <acronym title="<%=blog.getPostDate()%>">
                            <%=DateFormat.formatPeriod(blog.getPostDate().getTime(), new Date().getTime())%>
                        </acronym>前发布
                    </div>
                    <div class="elgg-content">
                        <%
                            if (blog.getDescription() != null)
                                out.write(blog.getDescription());
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
<div class="elgg-page-footer">
    <div class="elgg-inner">
        <%--<ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
            <li class="elgg-menu-item-report-this"><a
                    href="javascript:elgg.forward(&#039;reportedcontent/add&#039;+&#039;?address=&#039;+encodeURIComponent(location.href)+&#039;&amp;title=&#039;+encodeURIComponent(document.title));"
                    title="Report this page to an administrator"><span
                    class="elgg-icon elgg-icon-report-this "></span>Report this</a></li>
        </ul>--%>
        <div class="mts clearfloat float-alt"><%--<a href="http://elgg.org" class=""><img
                src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
                alt="Powered by Elgg" width="106" height="15"/></a>--%></div>
    </div>
</div>
</div>
</body>
</html>