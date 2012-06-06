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
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
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
            <li class="elgg-menu-item-usersettings">
                <a href="http://localhost:8080/accountsetting.jsp">
                    <span class="elgg-icon elgg-icon-settings "></span>个人设置
                </a>
            </li>
            <li class="elgg-menu-item-logout">
                <a href="http://localhost:8080/ExitAction.action">
                    Log out
                </a>
            </li>
        </ul>
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
            <li class="elgg-menu-item-profile">
                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                    <img src="<%=siteUser.getPortrait()%>"
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
               href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
                Researchzilla </a>
        </h1>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity">
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                    最近活动
                </a>
            </li>
            <li class="elgg-menu-item-blog">
                <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                    日志
                </a>
            </li>
            <li class="elgg-menu-item-file">
                <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                    文件
                </a>
            </li>
            <li class="elgg-menu-item-groups">
                <a href="http://localhost:8080/getSpecifiedGroupAction.action?uid=<%=siteUser.getUid()%>">
                    组
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="elgg-page-body">
    <div class="elgg-inner">

        <div class="elgg-layout clearfix">

            <div class="elgg-main elgg-body"><br>
                <ul class="elgg-menu elgg-breadcrumbs">
                    <li>
                        <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
                    </li>
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
                                    <li>
                                        <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"><span
                                                class="elgg-heading-basic">yumingzhe</span>&#64;yumingzhe</a></li>
                                </ul>
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"
                                   class="">
                                    <img src="<%=blog.getSiteUser().getPortrait()%>" alt="yumingzhe"
                                         title="yumingzhe" class=""/>
                                </a>
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
                                        href="http://localhost:8080/deleteblogAction.action?blogid=<%=blog.getId()%>&uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>&type=blog"
                                        title="Delete this" rel="Are you sure you want to delete this item?"
                                        class="elgg-requires-confirmation"><span
                                        class="elgg-icon elgg-icon-delete "></span></a></li>
                            </ul>
                            <h3></h3>

                            <div class="elgg-subtext">由
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"><%=blog.getSiteUser().getUsername()%>
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
                                        <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"
                                           class=""><img
                                                src="<%=commentEntity.getSiteUser().getPortrait()%>"
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
                                                <a href="http://localhost:8080/deleteCommentAction.action?commentid=<%=commentEntity.getId()%>&blogid=<%=blog.getId()%>&type=blog"
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
                                <input type="hidden" name="uid"
                                       value="<%=((SiteUser)session.getAttribute("user")).getUid()%>"/>
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