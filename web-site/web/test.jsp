<html>
<head>
    <title>YuMingzhe personal SNS</title>
    <link rel="SHORTCUT ICON" href="http://elgg-yumingzhe.rhcloud.com/_graphics/favicon.ico"/>
    <link rel="stylesheet" href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/elgg.1338369118.css"
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

    <script type="text/javascript" src="http://elgg-yumingzhe.rhcloud.com/vendors/jquery/jquery-1.6.4.min.js"></script>
    <script type="text/javascript"
            src="http://elgg-yumingzhe.rhcloud.com/vendors/jquery/jquery-ui-1.8.16.min.js"></script>
    <script type="text/javascript" src="http://elgg-yumingzhe.rhcloud.com/vendors/jquery/jquery.form.js"></script>
    <script type="text/javascript" src="http://elgg-yumingzhe.rhcloud.com/cache/js/default/elgg.1338369118.js"></script>

    <link rel="alternate" type="application/rss+xml" title="RSS" href="http://elgg-yumingzhe.rhcloud.com/?view=rss"/>
</head>
<body>
<div class="elgg-page elgg-page-default">
<div class="elgg-page-messages">
    <ul class="elgg-system-messages">
        <li class="hidden"></li>
    </ul>
</div>

<div class="elgg-page-header">
    <div class="elgg-inner">

        <h1>
            <a class="elgg-heading-site" href="http://elgg-yumingzhe.rhcloud.com/">
                YuMingzhe personal SNS </a>
        </h1>

        <div id="login-dropdown">
            <a href="http://elgg-yumingzhe.rhcloud.com/login#login-dropdown-box" rel="popup"
               class="elgg-button elgg-button-dropdown">Log in</a>

            <div class="elgg-module  elgg-module-dropdown" id="login-dropdown-box">
                <div class="elgg-body">
                    <%--<form method="post" action="http://elgg-yumingzhe.rhcloud.com/action/login"
                          class="elgg-form elgg-form-login">
                        <fieldset><input type="hidden" name="__elgg_token"
                                         value="e4834a355f6fbdf48244af0fa4bae10d"/><input type="hidden" name="__elgg_ts"
                                                                                          value="1338528298"/>

                            <div>
                                <label>Username or email</label>

                                <input type="text" value="" name="username" class="elgg-input-text elgg-autofocus"/>
                            </div>
                            <div>
                                <label>Password</label>

                                <input type="password" value="" name="password" class="elgg-input-password"/>
                            </div>


                            <div class="elgg-foot">
                                <label class="mtm float-alt">
                                    <input type="checkbox" name="persistent" value="true"/>
                                    Remember me </label>

                                <input type="submit" value="Log in" class="elgg-button elgg-button-submit"/>

                                <input type="hidden" name="returntoreferer" value="true"/>
                                <ul class="elgg-menu elgg-menu-general mtm">
                                    <li><a class="registration_link" href="http://elgg-yumingzhe.rhcloud.com/register">Register</a>
                                    </li>
                                    <li><a class="forgot_link" href="http://elgg-yumingzhe.rhcloud.com/forgotpassword">
                                        Lost password </a></li>
                                </ul>
                            </div>
                        </fieldset>
                    </form>--%>
                </div>
            </div>
        </div>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity"><a href="http://elgg-yumingzhe.rhcloud.com/activity">Activity</a></li>
            <li class="elgg-menu-item-blog"><a href="http://elgg-yumingzhe.rhcloud.com/blog/all">Blogs</a></li>
            <li class="elgg-menu-item-bookmarks"><a href="http://elgg-yumingzhe.rhcloud.com/bookmarks/all">Bookmarks</a>
            </li>
            <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
            <li class="elgg-more"><a href="#">More</a>
                <ul class="elgg-menu elgg-menu-site elgg-menu-site-more">
                    <li class="elgg-menu-item-members"><a href="http://elgg-yumingzhe.rhcloud.com/members">Members</a>
                    </li>
                    <li class="elgg-menu-item-pages"><a href="http://elgg-yumingzhe.rhcloud.com/pages/all">Pages</a>
                    </li>
                    <li class="elgg-menu-item-thewire"><a href="http://elgg-yumingzhe.rhcloud.com/thewire/all">The
                        Wire</a></li>
                </ul>
            </li>
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
        <li class="elgg-menu-item-rss"><a href="http://elgg-yumingzhe.rhcloud.com/?view=rss"
                                          title="RSS feed for this page"><span class="elgg-icon elgg-icon-rss "></span></a>
        </li>
    </ul>
    <div class="elgg-module  elgg-module-aside">
        <div class="elgg-head"><h3>Log in</h3></div>
        <div class="elgg-body">
            <form method="post" action="http://elgg-yumingzhe.rhcloud.com/action/login"
                  class="elgg-form elgg-form-login">
                <fieldset><input type="hidden" name="__elgg_token" value="e4834a355f6fbdf48244af0fa4bae10d"/><input
                        type="hidden" name="__elgg_ts" value="1338528298"/>

                    <div>
                        <label>Username or email</label>

                        <input type="text" value="" name="username" class="elgg-input-text elgg-autofocus"/></div>
                    <div>
                        <label>Password</label>

                        <input type="password" value="" name="password" class="elgg-input-password"/>
                    </div>


                    <div class="elgg-foot">
                        <label class="mtm float-alt">
                            <input type="checkbox" name="persistent" value="true"/>
                            Remember me </label>

                        <input type="submit" value="Log in" class="elgg-button elgg-button-submit"/>


                        <ul class="elgg-menu elgg-menu-general mtm">
                            <li><a class="registration_link"
                                   href="http://elgg-yumingzhe.rhcloud.com/register">Register</a></li>
                            <li><a class="forgot_link" href="http://elgg-yumingzhe.rhcloud.com/forgotpassword">
                                Lost password </a></li>
                        </ul>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</div>--%>

<div class="elgg-main elgg-body">
    <h2>Latest activity</h2>
    <ul class="elgg-list elgg-list-river elgg-river">
        <li id="item-river-26" class="elgg-item">
            <div class="elgg-image-block elgg-river-item clearfix">
                <div class="elgg-image">
                    <div class="elgg-avatar elgg-avatar-small">
                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                        <ul class="elgg-menu elgg-menu-hover">
                            <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                    class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                        </ul>
                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif" alt="yumingzhe"
                                title="yumingzhe" class=""
                        <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=small) no-repeat;"--%>/></a>
                    </div>
                </div>
                <div class="elgg-body">
                    <div class="elgg-river-summary"><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                       class="elgg-river-subject">yumingzhe</a> commented on the file <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda" class="elgg-river-object">agenda</a>
                        <span class="elgg-river-timestamp">14 days ago</span></div>
                    <div class="elgg-river-message">first comment</div>

                </div>
            </div>
        </li>
        <li id="item-river-25" class="elgg-item">
            <div class="elgg-image-block elgg-river-item clearfix">
                <div class="elgg-image">
                    <div class="elgg-avatar elgg-avatar-small">
                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                        <ul class="elgg-menu elgg-menu-hover">
                            <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                    class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                        </ul>
                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif" alt="yumingzhe"
                                title="yumingzhe" class=""
                        <%-- style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=small) no-repeat;"--%>/></a>
                    </div>
                </div>
                <div class="elgg-body">
                    <div class="elgg-river-summary"><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                       class="elgg-river-subject">yumingzhe</a> uploaded the file <a
                            href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda" class="elgg-river-object">agenda</a>
                        <span class="elgg-river-timestamp">14 days ago</span></div>
                    <div class="elgg-river-message">this is a test file</div>

                    <div class="elgg-river-responses"><span class="elgg-river-comments-tab">Comments</span>

                        <ul class="elgg-list elgg-river-comments">
                            <li id="item-annotation-16" class="elgg-item">
                                <div class="elgg-image-block clearfix">
                                    <div class="elgg-image">
                                        <div class="elgg-avatar elgg-avatar-tiny">
                                            <span class="elgg-icon elgg-icon-hover-menu "></span>
                                            <ul class="elgg-menu elgg-menu-hover">
                                                <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                                        class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                                </li>
                                            </ul>
                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif"
                                                    alt="yumingzhe" title="yumingzhe" class=""
                                            <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>/></a>
                                        </div>
                                    </div>
                                    <div class="elgg-body">
                                        <div class="mbn">

                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a>
	<span class="elgg-subtext">
		<acronym title="18 May 2012 @ 7:49am">14 days ago</acronym>
	</span>

                                            <div class="elgg-output"><p>first comment</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li id="item-annotation-17" class="elgg-item">
                                <div class="elgg-image-block clearfix">
                                    <div class="elgg-image">
                                        <div class="elgg-avatar elgg-avatar-tiny">
                                            <span class="elgg-icon elgg-icon-hover-menu "></span>
                                            <ul class="elgg-menu elgg-menu-hover">
                                                <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                                        class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a>
                                                </li>
                                            </ul>
                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                                    src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif"
                                                    alt="yumingzhe" title="yumingzhe" class=""
                                            <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>/></a>
                                        </div>
                                    </div>
                                    <div class="elgg-body">
                                        <div class="mbn">

                                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">yumingzhe</a>
	<span class="elgg-subtext">
		<acronym title="18 May 2012 @ 7:49am">14 days ago</acronym>
	</span>

                                            <div class="elgg-output"><p>second comment</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <form method="post" action="http://elgg-yumingzhe.rhcloud.com/action/comments/add"
                              id="comments-add-82" class="elgg-form hidden elgg-form-comments-add">
                            <fieldset><input type="hidden" name="__elgg_token"
                                             value="9ff243949a404e7618e5ec763a5fa42d"/><input type="hidden"
                                                                                              name="__elgg_ts"
                                                                                              value="1338528297"/>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </li>
        <li id="item-river-18" class="elgg-item">
            <div class="elgg-image-block elgg-river-item clearfix">
                <div class="elgg-image">
                    <div class="elgg-avatar elgg-avatar-small">
                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                        <ul class="elgg-menu elgg-menu-hover">
                            <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                    class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                        </ul>
                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                src="http://elgg-yumingzhe.rhcloud.com/_graphics/spacer.gif" alt="yumingzhe"
                                title="yumingzhe" class=""
                        <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=small) no-repeat;"--%>/></a>
                    </div>
                </div>
                <div class="elgg-body">
                    <div class="elgg-river-summary"><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                       class="elgg-river-subject">yumingzhe</a> created the group <a
                            href="http://elgg-yumingzhe.rhcloud.com/groups/profile/78/class-one"
                            class="elgg-river-object">class one</a> <span
                            class="elgg-river-timestamp">14 days ago</span></div>
                    <div class="elgg-river-message">this is class one group</div>

                    <div class="elgg-river-responses">
                        <form method="post" action="http://elgg-yumingzhe.rhcloud.com/action/comments/add"
                              id="comments-add-78" class="elgg-form hidden elgg-form-comments-add">
                            <fieldset><input type="hidden" name="__elgg_token"
                                             value="9ff243949a404e7618e5ec763a5fa42d"/><input type="hidden"
                                                                                              name="__elgg_ts"
                                                                                              value="1338528297"/>
                            </fieldset>
                        </form>
                    </div>
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
        <div class="mts clearfloat float-alt"><a href="http://elgg.org" class=""><img
                src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
                alt="Powered by Elgg" width="106" height="15"/></a></div>
    </div>
</div>
</div>
</body>
</html>