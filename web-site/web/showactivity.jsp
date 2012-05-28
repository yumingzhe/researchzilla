<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Activity" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
&lt;%&ndash;
  Created by IntelliJ IDEA.
  User: yumingzhe
  Date: 5/28/12
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
&ndash;%&gt;
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>

</body>
</html>--%>

<html>
<head>
    <title>show ativity</title>
    <link rel="SHORTCUT ICON" href="http://elgg-yumingzhe.rhcloud.com/_graphics/favicon.ico"/>
    <link rel="stylesheet" href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/elgg.1336721654.css"
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

    <%-- <script type="text/javascript">
            /**
             * Don't want to cache these -- they could change for every request
             */
            elgg.config.lastcache = 1336721654;
            elgg.config.viewtype = 'default';
            elgg.config.simplecache_enabled = 1;

            elgg.security.token.__elgg_ts = 1338188590;
            elgg.security.token.__elgg_token = '70d0293b14df7075c3878caadea61971';

            elgg.page_owner =  {"guid":"73","type":"user","subtype":false,"time_created":"1336721417","time_updated":"1338188539","container_guid":"0","owner_guid":"0","site_guid":"1","name":"elgg","username":"elgg","language":"en","url":"http:\/\/elgg-yumingzhe.rhcloud.com\/profile\/elgg"};elgg.session.user = new elgg.ElggUser({"guid":"73","type":"user","subtype":false,"time_created":"1336721417","time_updated":"1338188539","container_guid":"0","owner_guid":"0","site_guid":"1","name":"elgg","username":"elgg","language":"en","url":"http:\/\/elgg-yumingzhe.rhcloud.com\/profile\/elgg","admin":false});
            //Before the DOM is ready, but elgg's js framework is fully initalized
            elgg.trigger_hook('boot', 'system');</script>
    --%>

    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://elgg-yumingzhe.rhcloud.com/activity?view=rss"/>
    <link rel="meta" type="application/rdf+xml" title="FOAF"
          href="http://elgg-yumingzhe.rhcloud.com/activity?view=foaf"/>
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
                    href="http://elgg-yumingzhe.rhcloud.com/settings/user/elgg"><span
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
                            src="http://elgg-yumingzhe.rhcloud.com/_graphics/icons/user/defaulttopbar.gif"
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
            <li class="elgg-menu-item-blog"><a href="http://elgg-yumingzhe.rhcloud.com/blog/all">Blogs</a></li>
            <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
            <%--<li class="elgg-more"><a href="#">More</a>
                <ul class="elgg-menu elgg-menu-site elgg-menu-site-more">
                    <li class="elgg-menu-item-members"><a
                            href="http://elgg-yumingzhe.rhcloud.com/members">Members</a>
                    </li>
                    <li class="elgg-menu-item-pages"><a href="http://elgg-yumingzhe.rhcloud.com/pages/all">Pages</a>
                    </li>
                    <li class="elgg-menu-item-thewire"><a href="http://elgg-yumingzhe.rhcloud.com/thewire/all">The
                        Wire</a></li>
                </ul>
            </li>--%>
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

        <div class="elgg-layout elgg-layout-one-sidebar clearfix elgg-river-layout">
            <div class="elgg-sidebar">
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
            </div>

            <div class="elgg-main elgg-body">
                <div class="elgg-head clearfix">
                    <h2 class="elgg-heading-main">Activity</h2>
                </div>
                <%--<ul class="elgg-menu elgg-menu-filter elgg-menu-hz elgg-menu-filter-default">
                    <li class="elgg-menu-item-all elgg-state-selected"><a
                            href="http://elgg-yumingzhe.rhcloud.com/activity/all">All</a>
                    </li>
                    <li class="elgg-menu-item-mine"><a href="http://elgg-yumingzhe.rhcloud.com/activity/owner/elgg">Mine</a>
                    </li>
                    <li class="elgg-menu-item-friend"><a
                            href="http://elgg-yumingzhe.rhcloud.com/activity/friends/elgg">Friends</a></li>
                </ul>--%>
                <%--<select id="elgg-river-selector" class="elgg-input-dropdown">
                    <option value="type=all" selected="selected">Show All</option>
                    <option value="type=user">Show Users</option>
                    <option value="type=object&amp;subtype=blog">Show Blogs</option>
                    <option value="type=object&amp;subtype=bookmarks">Show Bookmarks</option>
                    <option value="type=object&amp;subtype=file">Show Files</option>
                    <option value="type=object&amp;subtype=groupforumtopic">Show Discussion topics</option>
                    <option value="type=object&amp;subtype=page">Show Pages</option>
                    <option value="type=object&amp;subtype=page_top">Show Top-level pages</option>
                    <option value="type=object&amp;subtype=thewire">Show Wire posts</option>
                    <option value="type=group">Show Groups</option>
                </select>--%>
                <script type="text/javascript">
                    elgg.register_hook_handler('init', 'system', function () {
                        $('#elgg-river-selector').change(function () {
                            var url = window.location.href;
                            if (window.location.search.length) {
                                url = url.substring(0, url.indexOf('?'));
                            }
                            url += '?' + $(this).val();
                            elgg.forward(url);
                        });
                    });
                </script>
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
                                    <ul class="elgg-menu elgg-menu-hover">
                                        <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                                class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                        </li>
                                        <li>
                                            <ul class="elgg-menu elgg-menu-hover-actions">
                                                <li class="elgg-menu-item-remove-friend"><a
                                                        href="http://elgg-yumingzhe.rhcloud.com/action/friends/remove?friend=35&amp;__elgg_ts=1338188588&amp;__elgg_token=4dbc68052cfe82b18c2e6af45ed1011c">Remove
                                                    friend</a></li>
                                                <li class="elgg-menu-item-reportuser"><a
                                                        href="http://elgg-yumingzhe.rhcloud.com/reportedcontent/add?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Fprofile%2Fyumingzhe&amp;title=yumingzhe">Report
                                                    user</a></li>
                                                <li class="elgg-menu-item-send"><a
                                                        href="http://elgg-yumingzhe.rhcloud.com/messages/compose?send_to=35">Send
                                                    a
                                                    message</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                            src="img/arrow.png"
                                            alt="yumingzhe" title="yumingzhe"
                                            class=""/></a>
                                </div>
                            </div>
                            <div class="elgg-body">
                                <div class="elgg-river-summary"><a
                                        href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                        class="elgg-river-subject"><%=activity.getSiteUser().getUsername()%>
                                </a> <%=activity.getAction()%> <a
                                        href="http://localhost:8080/showFileAction"
                                        class="elgg-river-object"><%=activity.getBlog().getTitle()%>
                                </a>
                                    <span class="elgg-river-timestamp"><%=activity.getActivityOccurTime()%></span></div>
                                <div class="elgg-river-message">second comment</div>
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
            <%-- <li class="elgg-menu-item-report-this"><a
                href="javascript:elgg.forward(&#039;reportedcontent/add&#039;+&#039;?address=&#039;+encodeURIComponent(location.href)+&#039;&amp;title=&#039;+encodeURIComponent(document.title));"
                title="Report this page to an administrator"><span
                class="elgg-icon elgg-icon-report-this "></span>Report
            this</a></li>--%>
        </ul>
        <div class="mts clearfloat float-alt"><%--<a href="http://elgg.org" class=""><img
                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
                    alt="Powered by Elgg" width="106" height="15"/></a>--%>
        </div>
    </div>
</div>
</div>
</body>
</html>