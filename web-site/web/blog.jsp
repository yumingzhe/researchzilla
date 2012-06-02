<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Blog" %>
<%@ page import="util.DateFormat" %>
<%@ page import="pojo.CommentEntity" %>
<%@ page import="java.util.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%@ taglib prefix="s" uri="/struts-tags" %>
<s:actionerror/>
<s:actionmessage/>
<s:fielderror/>
<html>
<head>
    <title>Researchzilla|<%=((Blog) request.getAttribute("specifiedblog")).getTitle()%>
    </title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>
    <%-- <!--[if gt IE 7]>
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
    <![endif]-->--%>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
    <%--<script type="text/javascript" src="js/tinymce.1338195242.js"></script>--%>
    <script language="javascript" type="text/javascript">
        tinyMCE.init({
            mode:"textareas",
            theme:"advanced",
            plugins:"autolink,lists,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template,wordcount,advlist,autosave,visualblocks",

            // Theme options
            theme_advanced_buttons1:"save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,styleselect,formatselect,fontselect,fontsizeselect",
            theme_advanced_buttons2:"cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
            theme_advanced_buttons3:"tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
            theme_advanced_buttons4:"insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak,restoredraft,visualblocks",
            theme_advanced_toolbar_location:"top",
            theme_advanced_toolbar_align:"left",
            theme_advanced_statusbar_location:"bottom",
            theme_advanced_resizing:true,

            style_formats:[
                {title:'Bold text', inline:'b'},
                {title:'Red text', inline:'span', styles:{color:'#ff0000'}},
                {title:'Red header', block:'h1', styles:{color:'#ff0000'}},
                {title:'Example 1', inline:'span', classes:'example1'},
                {title:'Example 2', inline:'span', classes:'example2'},
                {title:'Table styles'},
                {title:'Table row 1', selector:'tr', classes:'tablerow1'}
            ],

            template_replace_values:{
                username:"Some User",
                staffid:"991234"
            }
        });
    </script>
    <link rel="alternate" type="application/rss+xml" title="RSS"
          href="http://elgg-yumingzhe.rhcloud.com/blog/view/49/-c-?view=rss"/>
    <link rel="meta" type="application/rdf+xml" title="FOAF"
          href="http://elgg-yumingzhe.rhcloud.com/blog/view/49/-c-?view=foaf"/>
</head>
<body>
<%
    SiteUser siteUser = new SiteUser();
    siteUser.setUid(1);
    siteUser.setEmail("yumingzhe@live.cn");
    session.setAttribute("user", siteUser);
    Blog blog = (Blog) request.getAttribute("specifiedblog");
    if (blog == null) {
        blog = new Blog();
        blog.setTitle("first blog");
    }
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
            <li class="elgg-menu-item-usersettings"><a
                    href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe"><span
                    class="elgg-icon elgg-icon-settings "></span>Settings</a></li>
            <li class="elgg-menu-item-logout"><a
                    href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338255610&amp;__elgg_token=3cfbfd80394a1c9c423dd7667808480d">Log
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
            <%--<li class="elgg-menu-item-friends"><a href="http://elgg-yumingzhe.rhcloud.com/friends/yumingzhe"
                                                  title="Friends"><span
                    class="elgg-icon elgg-icon-users "></span></a></li>--%>
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
            <li class="elgg-menu-item-activity"><a
                    href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Activity</a>
            </li>
            <li class="elgg-menu-item-blog"><a
                    href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
            </li>
            <li class="elgg-menu-item-file"><a
                    href="http://localhost:8080/showUserAllFiles.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Files</a>
            </li>
            <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
        </ul>
        <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
            <fieldset>
                <input type="text" class="search-input" size="21" name="q" value="Search"
                <%--onblur="if (this.value=='') { this.value='Search' }"
            onfocus="if (this.value=='Search') { this.value='' };"/>--%>
                <input type="submit" value="Go" class="search-submit-button"/>
            </fieldset>
        </form>
    </div>
</div>
<div class="elgg-page-body">
<div class="elgg-inner">

<div class="elgg-layout<%-- elgg-layout-one-sidebar--%> clearfix">
<%--<div class="elgg-sidebar">
    <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
        <li class="elgg-menu-item-rss"><a
                href="http://elgg-yumingzhe.rhcloud.com/blog/view/49/-c-?view=rss"
                title="RSS feed for this page"><span class="elgg-icon elgg-icon-rss "></span></a></li>
        <li class="elgg-menu-item-bookmark"><a
                href="http://elgg-yumingzhe.rhcloud.com/bookmarks/add/35?address=http%3A%2F%2Felgg-yumingzhe.rhcloud.com%2Fblog%2Fview%2F49%2F-c-"
                title="Bookmark this page" rel="nofollow"><span
                class="elgg-icon elgg-icon-push-pin-alt "></span></a></li>
    </ul>
    <div class="elgg-module  elgg-module-aside">
        <div class="elgg-head"><h3>Archives</h3></div>
        <div class="elgg-body">
            <ul class="blog-archives">
                <li>
                    <a href="http://elgg-yumingzhe.rhcloud.com/blog/archive/yumingzhe/1330560000/1333238400"
                       title="March 2012">March 2012</a></li>
            </ul>
        </div>
    </div>
    <div class="elgg-module  elgg-module-aside">
        <div class="elgg-head"><h3>Tag cloud</h3></div>
        <div class="elgg-body">
            <div class="elgg-tagcloud"><a
                    href="http://elgg-yumingzhe.rhcloud.com/search?q=c&amp;search_type=tags&amp;entity_type=object&amp;entity_subtype=blog"
                    style="font-size: 100%" title="c (1)">c</a></div>
            <p class="small"><span class="elgg-icon elgg-icon-tag "></span><a
                    href="http://elgg-yumingzhe.rhcloud.com/tags">All site tags</a></p></div>
    </div>
</div>--%>

<div class="elgg-main elgg-body"><br>
    <ul class="elgg-menu elgg-breadcrumbs">
        <li><a href="getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a></li>
        <li><a href="http://elgg-yumingzhe.rhcloud.com/blog/owner/yumingzhe">yumingzhe</a></li>
        <li><%=blog.getTitle()%>
        </li>
    </ul>
    <div class="elgg-head clearfix">
        <h2 class="elgg-heading-main"><%=blog.getTitle()%>
        </h2>
    </div>
    <div class="elgg-content">
        <div class="elgg-image-block clearfix">
            <div class="elgg-image">
                <div class="elgg-avatar elgg-avatar-tiny">
                    <span class="elgg-icon elgg-icon-hover-menu "></span>
                    <ul class="elgg-menu elgg-menu-hover">
                        <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
                                class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                        <li>
                            <ul class="elgg-menu elgg-menu-hover-actions">
                                <li class="elgg-menu-item-avatar-edit">
                                    <a href="http://elgg-yumingzhe.rhcloud.com/avatar/edit/yumingzhe">Edit
                                        avatar
                                    </a>
                                </li>
                                <li class="elgg-menu-item-profile-edit">
                                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe/edit">
                                        Edit profile
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <ul class="elgg-menu elgg-menu-hover-admin">
                                <li class="elgg-menu-item-logbrowser">
                                    <a href="http://elgg-yumingzhe.rhcloud.com/admin/utilities/logbrowser?user_guid=35">
                                        Explore log
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                            src="img/icondirect.jpg" alt="yumingzhe"
                            title="yumingzhe" class=""
                    <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>
                            /></a>
                </div>
            </div>
            <div class="elgg-body">
                <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                    <li class="elgg-menu-item-edit">
                        <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>&type=update"
                           title="Edit this">Edit
                        </a>
                    </li>
                    <li class="elgg-menu-item-delete"><a
                            href="http://localhost:8080/deleteblogAction.action?blogid=<%=blog.getId()%>&uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>"
                            title="Delete this" rel="Are you sure you want to delete this item?"
                            class="elgg-requires-confirmation"><span
                            class="elgg-icon elgg-icon-delete "></span></a></li>
                </ul>
                <h3></h3>

                <div class="elgg-subtext">由
                    <a href="http://elgg-yumingzhe.rhcloud.com/blog/owner/yumingzhe"><%=blog.getSiteUser().getUsername()%>
                    </a> 于
                    <acronym
                            title="<%=blog.getPostDate()%>"><%=DateFormat.formatPeriod(blog.getPostDate().getTime(), new Date().getTime())%>
                    </acronym> 前发表
                    <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>#mycomment">Comments
                        (<%=blog.getCommentEntities().size()%>)
                    </a>
                </div>
                <div><span class="elgg-icon elgg-icon-tag "></span>
                    <ul class="elgg-tags">
                        <li>
                            <a href="http://localhost:8080/searchBlogByTag.action?tag=<%=blog.getTag() != null ? blog.getTag() : ""%>"
                               rel="tag"><%=blog.getTag() != null ? blog.getTag() : ""%>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="elgg-output blog-post">
            <p>
                <%
                    out.write(blog.getContent());
                %>
            </p>
        </div>
    </div>
    <div class="elgg-comments blog-comments" id="mycomment"><h3>评论</h3>
        <ul class="elgg-list elgg-list-annotation elgg-annotation-list">
            <%
                Set<CommentEntity> commentEntities = blog.getCommentEntities();
                /* CommentEntity[] commentEntities1 = new CommentEntity[commentEntities.size()];
                Iterator iterator = commentEntities.iterator();
                for (int i = 0; i < commentEntities.size() && iterator.hasNext(); i++) {
                    commentEntities1[i] = (CommentEntity) iterator.next();
                }
                Arrays.sort(commentEntities1);*/
                for (CommentEntity commentEntity : commentEntities) {
            %>
            <li id="item-annotation-5" class="elgg-item">
                <div class="elgg-image-block clearfix">
                    <div class="elgg-image">
                        <div class="elgg-avatar elgg-avatar-tiny">
                            <span class="elgg-icon elgg-icon-hover-menu "></span>
                            <%--<ul class="elgg-menu elgg-menu-hover">
                                <li><a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"><span
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
                            </ul>--%>
                            <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                    src="img/icondirect.jpg"
                                    alt="yumingzhe" title="yumingzhe" class=""
                            <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>
                                    />
                            </a>
                        </div>
                    </div>
                    <div class="elgg-body">
                        <div class="mbn">
                            <ul class="elgg-menu elgg-menu-annotation elgg-menu-hz float-alt elgg-menu-annotation-default">
                                <li class="elgg-menu-item-delete">
                                    <a href="http://localhost:8080/deleteCommentAction.action?commentid=<%=commentEntity.getId()%>&blogid=<%=blog.getId()%>"
                                       rel="Are you sure you want to delete this item?"
                                       class="elgg-requires-confirmation">
                                    <span class="elgg-icon elgg-icon-delete">
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=commentEntity.getSiteUser().getUid()%>">
                                <%=commentEntity.getSiteUser().getUsername()%>
                            </a>
	<span class="elgg-subtext">
		<acronym title="<%=commentEntity.getPostTime()%>">
            <%=DateFormat.formatPeriod(commentEntity.getPostTime().getTime(), new Date().getTime())%>
        </acronym>前
	</span>

                            <div class="elgg-output">
                                <p>
                                    <%=commentEntity.getContent()%>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </li>
            <%
                }
            %>
        </ul>
        <form method="post" action="http://localhost:8080/postCommentAction.action"
              name="elgg_add_comment" class="elgg-form elgg-form-comments-add">
            <fieldset>
                <div>
                    <label>评论</label>
                    <input type="hidden" name="type" value="blog"/>
                    <input type="hidden" name="objectId" value="<%=blog.getId()%>"/>
                    <input type="hidden" name="uid" value="<%=((SiteUser)session.getAttribute("user")).getUid()%>"/>
                    <ul class="elgg-menu elgg-menu-longtext elgg-menu-hz elgg-menu-longtext-default">
                        <li><a href="javascript:" onclick="tinyMCE.get('comment').show();return false;">[显示编辑器]</a>
                            <a href="javascript:" onclick="tinyMCE.get('comment').hide();return false;">[删除编辑器]</a>
                        </li>
                    </ul>
                    <textarea id="comment" name="content"
                              class="elgg-input-longtext">
                    </textarea>
                </div>
                <div class="elgg-foot">
                    <input type="submit" value="发表评论" class="elgg-button elgg-button-submit"/>
                </div>
                <input type="hidden" name="entity_guid" value="49"/></fieldset>
        </form>
    </div>
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