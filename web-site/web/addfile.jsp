<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Researchzilla: Upload a file</title>
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
</head>
<body>
<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
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
                    <a href="http://http://localhost:8080/accountsetting.jsp">
                        <span class="elgg-icon elgg-icon-settings "></span>
                        个人设置
                    </a>
                </li>
                <li class="elgg-menu-item-logout">
                    <a href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338648">
                        Log out
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-elgg-logo">
                    <a href="http://www.elgg.org/" class="elgg-topbar-logo">
                        <img src="img/elgg_toolbar_logo.gif" alt="Elgg logo"
                             width="38" height="20"/>
                    </a>
                </li>
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                        <img
                                src="img/icondirect.jpg"
                                alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"/>
                    </a>
                </li>
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
                        href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">Activity</a>
                </li>
                <li class="elgg-menu-item-blog"><a
                        href="http://localhost:8080/getUserAllBlogsAction.action?uid=<%=siteUser.getUid()%>">Blogs</a>
                </li>
                <li class="elgg-menu-item-file">
                    <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">
                        Files
                    </a>
                </li>
                <li class="elgg-menu-item-groups">
                    <a href="http://elgg-yumingzhe.rhcloud.com/groups/all">
                        Groups
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
                            <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">
                                Files
                            </a>
                        </li>
                        <li>
                            <a href="http://elgg-yumingzhe.rhcloud.com/file/owner/yumingzhe">
                                yumingzhe
                            </a>
                        </li>
                        <li>Upload a file</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">Upload a file</h2>
                    </div>
                    <form method="post" action="http://localhost:8080/uploadfileAction.action"
                          enctype="multipart/form-data" class="elgg-form elgg-form-file-upload">
                        <input type="hidden" name="uid" value="<%=siteUser.getUid()%>"/>
                        <fieldset>
                            <div>
                                <label>文件</label><br/>
                                <input type="file" name="file" class="elgg-input-file"/>
                            </div>
                            <div>
                                <label>标题</label><br/>
                                <input type="text" value="" name="title" class="elgg-input-text"/>
                            </div>
                            <div>
                                <label>描述</label>
                                <%--<ul class="elgg-menu elgg-menu-longtext elgg-menu-hz elgg-menu-longtext-default">
                                    <li class="elgg-menu-item-tinymce-toggler">
                                        <a href="#elgg-input-658627775"
                                           class="tinymce-toggle-editor elgg-longtext-control">
                                            Remove editor
                                        </a>
                                    </li>
                                </ul>--%>
                                <textarea id="description" name="description" class="elgg-input-longtext"></textarea>
                            </div>
                            <div>
                                <label>标签</label>
                                <input type="text" value="" name="tag" class="elgg-input-tags"/></div>
                            <div>
                                <label>访问权限</label><br/>
                                <select name="access" class="elgg-input-dropdown elgg-input-access">
                                    <option value="1" selected="selected">Private</option>
                                    <option value="2">Public</option>
                                    <option value="3">Group</option>
                                </select>
                            </div>
                            <div class="elgg-foot">
                                <input type="submit" value="上传" class="elgg-button elgg-button-submit"/>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="elgg-page-footer">
        <div class="elgg-inner"></div>
    </div>
</div>
</body>
</html>