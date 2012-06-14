<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>

    <title>Researchzilla</title>
    <link rel="SHORTCUT ICON" href="http://elgg-yumingzhe.rhcloud.com/_graphics/favicon.ico"/>
    <link rel="stylesheet" href="http://elgg-yumingzhe.rhcloud.com/cache/css/default/elgg.1338195242.css"
          type="text/css"/>
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
                <%--<li class="elgg-menu-item-elgg-logo"><a href="http://www.elgg.org/" class="elgg-topbar-logo"><img
                        src="http://elgg-yumingzhe.rhcloud.com/_graphics/elgg_toolbar_logo.gif" alt="Elgg logo"
                        width="38" height="20"/></a></li>--%>
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                       class="elgg-topbar-avatar">
                        <img src="http://localhost:8080/<%=siteUser.getPortrait()%>"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"/>
                    </a>
                </li>
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
                    <a href="http://localhost:8080/getUserAllGroupsAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
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
                            <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">Blogs</a>
                        </li>
                        <li>发表日志</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">发表日志</h2>
                    </div>
                    <form method="post" action="postblogAction.action" id="blog-post-edit" name="blog_post"
                          cssClass="elgg_form elgg-form-alt elgg-form-blog-save">
                        <fieldset>
                            <input type="hidden" name="groupid" value="<%=request.getParameter("groupid")%>"/>

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
            </ul>
        </div>
    </div>
</div>
</body>
</html>