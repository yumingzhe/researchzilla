<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="ElggRelease" content="1.8.1"/>
    <meta name="ElggVersion" content="2011110700"/>
    <title>Researchzilla | Files</title>
    <link rel="SHORTCUT ICON" href="http://elgg-yumingzhe.rhcloud.com/_graphics/favicon.ico"/>
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
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>

    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://elgg-yumingzhe.rhcloud.com/file/all?view=rss"/>
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
                    href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe"><span
                    class="elgg-icon elgg-icon-settings "></span>Settings</a></li>
            <li class="elgg-menu-item-logout"><a
                    href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f">Log
                out</a></li>
        </ul>
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
            <li class="elgg-menu-item-elgg-logo"><a href="http://www.elgg.org/" class="elgg-topbar-logo"><img
                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/elgg_toolbar_logo.gif" alt="Elgg logo"
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
            <a class="elgg-heading-site" href="http://elgg-yumingzhe.rhcloud.com/">
                Researchzilla </a>
        </h1>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity"><a href="http://elgg-yumingzhe.rhcloud.com/activity">Activity</a>
            </li>
            <li class="elgg-menu-item-blog"><a href="http://elgg-yumingzhe.rhcloud.com/blog/all">Blogs</a></li>
            <%--<li class="elgg-menu-item-bookmarks"><a
                    href="http://elgg-yumingzhe.rhcloud.com/bookmarks/all">Bookmarks</a></li>--%>
            <li class="elgg-menu-item-file elgg-state-selected"><a
                    href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
        </ul>
        <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
            <fieldset>
                <input type="text" class="search-input" size="21" name="q" value="Search"
                       onblur="if (this.value=='') { this.value='Search' }"
                       onfocus="if (this.value=='Search') { this.value='' };"/>
                <input type="submit" value="Go" class="search-submit-button"/>
            </fieldset>
        </form>
    </div>
</div>
<div class="elgg-page-body">
<div class="elgg-inner">

<div class="elgg-layout <%--elgg-layout-one-sidebar--%> clearfix">
<%--<div class="elgg-sidebar">
<ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
    <li class="elgg-menu-item-bookmark"><a
            href="http://elgg-yumingzhe.rhcloud.com/bookmarks/add/35?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Ffile%2Fall"
            title="Bookmark this page" rel="nofollow"><span
            class="elgg-icon elgg-icon-push-pin-alt "></span></a></li>
    <li class="elgg-menu-item-rss"><a href="http://elgg-yumingzhe.rhcloud.com/file/all?view=rss"
                                      title="RSS feed for this page"><span
            class="elgg-icon elgg-icon-rss "></span></a></li>
    <li class="elgg-menu-item-file-list"><a
            href="http://elgg-yumingzhe.rhcloud.com/file/all?list_type=gallery"
            title="Switch to the gallery view"><span class="elgg-icon elgg-icon-grid "></span></a>
    </li>
</ul>
<ul class="elgg-menu elgg-menu-page elgg-menu-page-default">
    <li class="elgg-menu-item-file-all"><a
            href="http://elgg-yumingzhe.rhcloud.com/file/search?subtype=file">All</a></li>
    <li class="elgg-menu-item-file-document"><a
            href="http://elgg-yumingzhe.rhcloud.com/file/search?subtype=file&amp;md_type=simpletype&amp;tag=document">Documents</a>
    </li>
</ul>
<div class="elgg-module  elgg-module-aside">
    <div class="elgg-head"><h3>Latest comments</h3></div>
    <div class="elgg-body">
        <ul class="elgg-list elgg-latest-comments">
            <li id="item-annotation-17" class="elgg-item">
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
                            &lt;%&ndash;style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"&ndash;%&gt;/></a>
                        </div>
                    </div>
                    <div class="elgg-body"><span class="elgg-subtext">
	<a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda">agenda</a> (<acronym
                            title="18 May 2012 @ 7:49am">14 days ago</acronym>): second comment
</span></div>
                </div>
            </li>
            <li id="item-annotation-16" class="elgg-item">
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
                            &lt;%&ndash;style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"&ndash;%&gt;/></a>
                        </div>
                    </div>
                    <div class="elgg-body"><span class="elgg-subtext">
	<a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda">agenda</a> (<acronym
                            title="18 May 2012 @ 7:49am">14 days ago</acronym>): first comment
</span></div>
                </div>
            </li>
            <li id="item-annotation-10" class="elgg-item">
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
                            &lt;%&ndash;style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"/></a>&ndash;%&gt;
                        </div>
                    </div>
                    <div class="elgg-body"><span class="elgg-subtext">
	<a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/56/">开题报告</a> (<acronym
                            title="11 May 2012 @ 6:56am">21 days ago</acronym>): third comment
</span></div>
                </div>
            </li>
            <li id="item-annotation-9" class="elgg-item">
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
                            &lt;%&ndash;style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"&ndash;%&gt;/></a>
                        </div>
                    </div>
                    <div class="elgg-body"><span class="elgg-subtext">
	<a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a> On <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/56/">开题报告</a> (<acronym
                            title="11 May 2012 @ 6:55am">21 days ago</acronym>): second
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
                href="http://elgg-yumingzhe.rhcloud.com/search?q=report&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=file"
                style="font-size: 100%" title="report (1)">report</a>, <a
                href="http://elgg-yumingzhe.rhcloud.com/search?q=agenda&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=file"
                style="font-size: 100%" title="agenda (1)">agenda</a></div>
        <p class="small"><span class="elgg-icon elgg-icon-tag "></span><a
                href="http://elgg-yumingzhe.rhcloud.com/tags">All site tags</a></p></div>
</div>
</div>--%>

<div class="elgg-main elgg-body">
    <ul class="elgg-menu elgg-breadcrumbs">
        <li>Files</li>
    </ul>
    <div class="elgg-head clearfix">
        <h2 class="elgg-heading-main">用户文件</h2>
        <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
            <li class="elgg-menu-item-add"><a href="http://elgg-yumingzhe.rhcloud.com/file/add/35"
                                              class="elgg-button elgg-button-action">上传文件</a>
            </li>
        </ul>
    </div>
    <%-- <ul class="elgg-menu elgg-menu-filter elgg-menu-hz elgg-menu-filter-default">
        <li class="elgg-menu-item-all elgg-state-selected"><a
                href="http://elgg-yumingzhe.rhcloud.com/file/all">All</a></li>
        <li class="elgg-menu-item-mine"><a
                href="http://elgg-yumingzhe.rhcloud.com/file/owner/yumingzhe">Mine</a></li>
        <li class="elgg-menu-item-friend"><a
                href="http://elgg-yumingzhe.rhcloud.com/file/friends/yumingzhe">Friends</a></li>
    </ul>--%>
    <ul class="elgg-list elgg-list-entity">
        <li id="elgg-object-82" class="elgg-item">
            <div class="elgg-image-block clearfix">
                <div class="elgg-image"><a href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda"><img
                        src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/text.gif"
                        alt="agenda"/></a></div>
                <div class="elgg-body">
                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                        <li class="elgg-menu-item-access"><span class="elgg-access">Public</span></li>
                        <li class="elgg-menu-item-edit"><a
                                href="http://elgg-yumingzhe.rhcloud.com/file/edit/82" title="Edit this">Edit</a>
                        </li>
                        <li class="elgg-menu-item-delete"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=82&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                title="Delete this" rel="Are you sure you want to delete this item?"
                                class="elgg-requires-confirmation"><span
                                class="elgg-icon elgg-icon-delete "></span></a></li>
                    </ul>
                    <h3><a href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda">agenda</a></h3>

                    <div class="elgg-subtext">By <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/owner/yumingzhe">yumingzhe</a>
                        <acronym title="18 May 2012 @ 7:48am">14 days ago</acronym> <a
                                href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda#file-comments">Comments
                            (2)</a></div>
                    <div><span class="elgg-icon elgg-icon-tag "></span>
                        <ul class="elgg-tags">
                            <li>
                                <a href="http://elgg-yumingzhe.rhcloud.com/search?q=agenda&amp;search_type=tags"
                                   rel="tag">agenda</a></li>
                        </ul>
                    </div>
                    <div class="elgg-content">this is a test file</div>
                </div>
            </div>
        </li>
        <li id="elgg-object-56" class="elgg-item">
            <div class="elgg-image-block clearfix">
                <div class="elgg-image"><a href="http://elgg-yumingzhe.rhcloud.com/file/view/56/"><img
                        src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/word.gif"
                        alt="开题报告"/></a></div>
                <div class="elgg-body">
                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                        <li class="elgg-menu-item-access"><span class="elgg-access">Public</span></li>
                        <li class="elgg-menu-item-edit"><a
                                href="http://elgg-yumingzhe.rhcloud.com/file/edit/56" title="Edit this">Edit</a>
                        </li>
                        <li class="elgg-menu-item-delete"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=56&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                title="Delete this" rel="Are you sure you want to delete this item?"
                                class="elgg-requires-confirmation"><span
                                class="elgg-icon elgg-icon-delete "></span></a></li>
                        <li class="elgg-menu-item-likes"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/likes/add?guid=56&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                title="Like this"><span
                                class="elgg-icon elgg-icon-thumbs-up "></span></a></li>
                    </ul>
                    <h3><a href="http://elgg-yumingzhe.rhcloud.com/file/view/56/">开题报告</a></h3>

                    <div class="elgg-subtext">By <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/owner/wangwu">wangwu</a>
                        <acronym title="29 March 2012 @ 3:27pm">64 days ago</acronym> <a
                                href="http://elgg-yumingzhe.rhcloud.com/file/view/56/#file-comments">Comments
                            (4)</a></div>
                    <div><span class="elgg-icon elgg-icon-tag "></span>
                        <ul class="elgg-tags">
                            <li>
                                <a href="http://elgg-yumingzhe.rhcloud.com/search?q=report&amp;search_type=tags"
                                   rel="tag">report</a></li>
                        </ul>
                    </div>
                    <div class="elgg-content">这是我的开题报告</div>
                </div>
            </div>
        </li>
        <li id="elgg-object-55" class="elgg-item">
            <div class="elgg-image-block clearfix">
                <div class="elgg-image"><a href="http://elgg-yumingzhe.rhcloud.com/file/view/55/"><img
                        src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/text.gif"
                        alt="我的论文"/></a></div>
                <div class="elgg-body">
                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                        <li class="elgg-menu-item-access"><span class="elgg-access">Public</span></li>
                        <li class="elgg-menu-item-edit"><a
                                href="http://elgg-yumingzhe.rhcloud.com/file/edit/55" title="Edit this">Edit</a>
                        </li>
                        <li class="elgg-menu-item-delete"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=55&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                title="Delete this" rel="Are you sure you want to delete this item?"
                                class="elgg-requires-confirmation"><span
                                class="elgg-icon elgg-icon-delete "></span></a></li>
                        <li class="elgg-menu-item-likes"><a
                                href="http://elgg-yumingzhe.rhcloud.com/action/likes/add?guid=55&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                title="Like this"><span
                                class="elgg-icon elgg-icon-thumbs-up "></span></a></li>
                    </ul>
                    <h3><a href="http://elgg-yumingzhe.rhcloud.com/file/view/55/">我的论文</a></h3>

                    <div class="elgg-subtext">By <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/owner/wangwu">wangwu</a>
                        <acronym title="29 March 2012 @ 3:26pm">64 days ago</acronym></div>
                    <div class="elgg-content">我的论文穿上来啦，欢迎下载</div>
                </div>
            </div>
        </li>
    </ul>
</div>
</div>
</div>
</div>
<div class="elgg-page-footer">
    <div class="elgg-inner">
        <ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
            <%--<li class="elgg-menu-item-report-this"><a
         href="javascript:elgg.forward(&#039;reportedcontent/add&#039;+&#039;?address=&#039;+encodeURIComponent(location.href)+&#039;&amp;title=&#039;+encodeURIComponent(document.title));"
         title="Report this page to an administrator"><span
         class="elgg-icon elgg-icon-report-this "></span>Report this</a></li>--%>
        </ul>
        <div class="mts clearfloat float-alt"><%--<a href="http://elgg.org" class=""><img
                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
                    alt="Powered by Elgg" width="106" height="15"/></a>--%></div>
    </div>
</div>
</div>
</body>
</html>