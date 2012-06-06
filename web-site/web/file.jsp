<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.File" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.CommentEntity" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla: agenda</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>


    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
    <script type="text/javascript">
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
</head>
<body>
<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
    File file = (File) request.getAttribute("specifiedfile");
    Set<CommentEntity> commentEntities = file.getCommentEntities();
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
                    <span class="elgg-icon elgg-icon-settings "></span>
                    个人设置
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
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"
                   class="elgg-topbar-avatar">
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
            <li class="elgg-menu-item-file">
                <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">
                    文件
                </a>
            </li>
            <li class="elgg-menu-item-groups">
                <a href="http://localhost:8080/getUserAllGroupsAction.action?uid=<%=siteUser.getUid()%>">
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

        <div class="elgg-layout clearfix">

            <div class="elgg-main elgg-body">
                <ul class="elgg-menu elgg-breadcrumbs">
                    <li>
                        <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">Files</a>
                    </li>
                    <li>
                        <%=file.getFileName()%>
                    </li>
                </ul>
                <div class="elgg-head clearfix">
                    <h2 class="elgg-heading-main">
                        <%=file.getFileName()%>
                    </h2>
                    <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
                        <li class="elgg-menu-item-download">
                            <a href="http://localhost:8080/downloadFileAction.action?fileid=<%=file.getId()%>"
                               class="elgg-button elgg-button-action">
                                下载文件
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="elgg-content">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>">
                                <%
                                    if (file.getFileType().equals("text/plain")) {
                                %>
                                <img src="img/text.gif" alt="<%=file.getFileName()%>"/>
                                <%
                                } else if (file.getFileType().equals("application/msword")) {
                                %>
                                <img src="img/word.gif" alt="<%=file.getFileName()%>"/>
                                <%
                                    }
                                %>
                            </a>
                        </div>
                        <div class="elgg-body">
                            <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                                <li class="elgg-menu-item-access">
                                    <span class="elgg-access">
                                        <%=file.getAccess()%>
                                    </span>
                                </li>
                                <li class="elgg-menu-item-delete">
                                    <a href="http://localhost:8080/deleteFileAction.action?fileid=<%=file.getId()%>&uid=<%=siteUser.getUid()%>"
                                       title="Delete this" class="elgg-requires-confirmation">
                                        <span class="elgg-icon elgg-icon-delete "></span>
                                    </a>
                                </li>
                            </ul>
                            <h3>
                                <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>">
                                    <%=file.getFileName()%>
                                </a>
                            </h3>

                            <div class="elgg-subtext">由
                                <a href="http://elgg-yumingzhe.rhcloud.com/file/owner/yumingzhe">
                                    <%=file.getSiteUser().getUsername()%>
                                </a>
                                上传于
                                <acronym title="<%=file.getUploadTime()%>">
                                    <%=DateFormat.formatPeriod(file.getUploadTime().getTime(), new Date().getTime())%>
                                </acronym>前
                                <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>#mycomment">
                                    Comments(<%=file.getCommentEntities().size()%>)
                                </a>
                            </div>
                            <div>
                                <span class="elgg-icon elgg-icon-tag"></span>
                                <ul class="elgg-tags">
                                    <li>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/search?q=agenda&amp;search_type=tags"
                                           rel="tag">
                                            <%=file.getTag()%>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="elgg-output">
                        <p>
                            <%=file.getDescription()%>
                        </p>
                    </div>
                </div>
                <div class="elgg-comments file-comments" id="mycomment">
                    <h3>评论</h3>
                    <ul class="elgg-list elgg-list-annotation elgg-annotation-list">
                        <%
                            for (CommentEntity commentEntity : commentEntities) {
                        %>
                        <li id="item-annotation-16" class="elgg-item">
                            <div class="elgg-image-block clearfix">
                                <div class="elgg-image">
                                    <div class="elgg-avatar elgg-avatar-tiny">
                                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                                        <ul class="elgg-menu elgg-menu-hover">
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
                                        </ul>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="">
                                            <img src="img/icondirect.jpg"
                                                 alt="yumingzhe" title="yumingzhe" class=""
                                            <%--style="background: url(http://elgg-yumingzhe.rhcloud.com/mod/profile/icondirect.php?lastcache=1335068576&amp;joindate=1333026415&amp;guid=35&amp;size=tiny) no-repeat;"--%>/></a>
                                    </div>
                                </div>
                                <div class="elgg-body">
                                    <div class="mbn">
                                        <ul class="elgg-menu elgg-menu-annotation elgg-menu-hz float-alt elgg-menu-annotation-default">
                                            <li class="elgg-menu-item-delete">
                                                <a href="http://localhost:8080/deleteCommentAction.action?commentid=<%=commentEntity.getId()%>&type=file&fileid=<%=file.getId()%>"
                                                   class="elgg-requires-confirmation">
                                                    <span class="elgg-icon elgg-icon-delete"></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <a href="http://getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
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
                    <form method="post" action="http://localhost:8080/postCommentAction.action" name="elgg_add_comment"
                          class="elgg-form elgg-form-comments-add">
                        <input type="hidden" name="type" value="file"/>
                        <input type="hidden" name="objectId" value="<%=file.getId()%>"/>
                        <input type="hidden" name="uid" value="<%=siteUser.getUid()%>"/>
                        <fieldset>
                            <div>
                                <label>评论</label>
                                <ul class="elgg-menu elgg-menu-longtext elgg-menu-hz elgg-menu-longtext-default">
                                    <li class="elgg-menu-item-tinymce-toggler">
                                        <a href="#elgg-input-657175787"
                                           class="tinymce-toggle-editor elgg-longtext-control">
                                            Remove editor
                                        </a>
                                    </li>
                                </ul>
                                <textarea id="elgg-input-657175787" name="content"
                                          class="elgg-input-longtext"></textarea>
                            </div>
                            <div class="elgg-foot">
                                <input type="submit" value="发表评论" class="elgg-button elgg-button-submit"/>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="elgg-page-footer">
    <div class="elgg-inner">
    </div>
</div>
</div>
</body>
</html>
