<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
    <script type="text/javascript"
            src="js/tiny_mce/tiny_mce.js"></script>

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

    <%--<link rel="meta" type="application/rdf+xml" title="FOAF"
          href="http://elgg-yumingzhe.rhcloud.com/blog/add/35?view=foaf"/>--%>
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
                        href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338342665&amp;__elgg_token=90d8a27be2b1181b4fda28b2659d46d2">Log
                    out</a></li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <%--<li class="elgg-menu-item-elgg-logo"><a href="http://www.elgg.org/" class="elgg-topbar-logo"><img
                        src="http://elgg-yumingzhe.rhcloud.com/_graphics/elgg_toolbar_logo.gif" alt="Elgg logo"
                        width="38" height="20"/></a></li>--%>
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
                    Researchzilla
                </a>
            </h1>
            <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
                <li class="elgg-menu-item-activity">
                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                        Activity
                    </a>
                </li>
                <li class="elgg-menu-item-blog"><a
                        href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
                </li>
                <li class="elgg-menu-item-file"><a href="http://elgg-yumingzhe.rhcloud.com/file/all">Files</a></li>
                <li class="elgg-menu-item-groups"><a href="http://elgg-yumingzhe.rhcloud.com/groups/all">Groups</a></li>
            </ul>
            <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
                <fieldset>
                    <%--<input type="text" class="search-input" size="21" name="q" value="Search"
                           onblur="if (this.value=='') { this.value='Search' }"
                           onfocus="if (this.value=='Search') { this.value='' };"/>
                    <input type="submit" value="Go" class="search-submit-button"/>--%>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout clearfix">
                <div class="elgg-main elgg-body">
                    <ul class="elgg-menu elgg-breadcrumbs">
                        <li>
                            <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
                        </li>
                        <li>发表日志</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">发表日志</h2>
                    </div>
                    <form method="post" action="postblogAction.action" id="blog-post-edit" name="blog_post"
                          cssClass="elgg_form elgg-form-alt elgg-form-blog-save">
                        <%--<form method="post" action="http://localhost:8080/postblogAction" id="blog-post-edit"
                     name="blog_post" class="elgg-form elgg-form-alt elgg-form-blog-save">--%>
                        <fieldset>
                            <%--<input type="hidden" name="__elgg_token"
                                      value="90d8a27be2b1181b4fda28b2659d46d2"/>
                         <input type="hidden" name="__elgg_ts" value="1338342665"/>--%>

                            <div>
                                <label for="blog_title">标题</label>
                                <input type="text" name="title" id="blog_title" class="elgg-input-text"/>
                            </div>

                            <div>
                                <label for="blog_excerpt">摘要</label>
                                <input type="text" value="" name="description" id="blog_excerpt"
                                       class="elgg-input-text"/>
                            </div>

                            <label for="blog_description">内容</label>
                            <textarea id="blog_description" name="content" class="elgg-input-longtext">
                            </textarea>
                            <br/>

                            <div>
                                <label for="blog_tags">标签</label>
                                <input type="text" name="tag" id="blog_tags" class="elgg-input-tags"/>
                            </div>
                            <div>
                                <label for="blog_comments_on">评论</label>
                                <select name="comment" id="blog_comments_on" class="elgg-input-dropdown">
                                    <option value="On" selected="selected">On</option>
                                    <option value="Off">Off</option>
                                </select>

                            </div>

                            <div>
                                <label for="blog_access_id">访问权限</label>
                                <select name="access" id="blog_access_id"
                                        class="elgg-input-dropdown elgg-input-access">
                                    <option value="private" selected="selected">Private</option>
                                    <option value="public">Public</option>
                                    <option value="group">Group</option>
                                </select>
                            </div>
                            <div class="elgg-foot">
                                <input type="hidden" name="guid"/>
                                <input type="hidden" name="container_guid" value="35"/>
                                <input type="submit" value="Save" name="save" class="elgg-button elgg-button-submit"/>
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
                <%--<li class="elgg-menu-item-report-this"><a
             href="javascript:elgg.forward(&#039;reportedcontent/add&#039;+&#039;?address=&#039;+encodeURIComponent(location.href)+&#039;&amp;title=&#039;+encodeURIComponent(document.title));"
             title="Report this page to an administrator"><span
             class="elgg-icon elgg-icon-report-this "></span>Report this</a></li>--%>
            </ul>
            <%-- <div class="mts clearfloat float-alt"><a href="http://elgg.org" class=""><img
        src="http://elgg-yumingzhe.rhcloud.com/_graphics/powered_by_elgg_badge_drk_bckgnd.gif"
        alt="Powered by Elgg" width="106" height="15"/></a></div>--%>
        </div>
    </div>
</div>
</body>
</html>