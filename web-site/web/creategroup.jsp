<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla: Create a new group</title>
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
                    <a href="http://elgg-yumingzhe.rhcloud.com/action/logout">
                        Log out
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                        <img src="<%=siteUser.getPortrait()%>"
                             alt="<%=siteUser.getUsername()%>" title="Profile"
                             class="elgg-border-plain elgg-transition" height="16" width="16"/>
                    </a>
                </li>
                <li class="elgg-menu-item-messages">
                    <a href="http://elgg-yumingzhe.rhcloud.com/messages/inbox/yumingzhe">
                        <span class='elgg-icon elgg-icon-mail'></span>
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
                <fieldset></fieldset>
            </form>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout clearfix">
                <div class="elgg-main elgg-body">
                    <ul class="elgg-menu elgg-breadcrumbs">
                        <li>
                            <a href="http://elgg-yumingzhe.rhcloud.com/groups/all">
                                Groups
                            </a>
                        </li>
                        <li>新建组</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">新建一个组</h2>
                    </div>
                    <form method="post" action="http://localhost:8080/createGroupAction.action"
                          enctype="multipart/form-data" class="elgg-form elgg-form-alt elgg-form-groups-edit">
                        <fieldset>
                            <input type="hidden" name="uid" value="<%=siteUser.getUid()%>"/>

                            <div>
                                <label>组名</label><br/>
                                <input type="text" name="groupName" class="elgg-input-text"/>
                            </div>
                            <div><label>描述</label>
                                <ul class="elgg-menu elgg-menu-longtext elgg-menu-hz elgg-menu-longtext-default">
                                    <li class="elgg-menu-item-tinymce-toggler">
                                        <a href="javascript:" onclick="tinyMCE.get('description').show();return false;">[显示编辑器]</a>
                                        <a href="javascript:" onclick="tinyMCE.get('description').hide();return false;">[删除编辑器]</a>
                                    </li>
                                </ul>
                                <textarea id="description" name="description" class="elgg-input-longtext">
                                </textarea>
                            </div>
                            <%--<div><label>简短描述</label><br/>
                                <input type="text" name="briefdescription" class="elgg-input-text"/>
                            </div>--%>
                            <div>
                                <label>标签</label><br/>
                                <input type="text" name="tags" class="elgg-input-tags"/>
                            </div>
                            <div>
                                <label>
                                    组状态
                                    <br/>
                                    <select name="access" class="elgg-input-dropdown elgg-input-access">
                                        <option value="1">关闭</option>
                                        <option value="2" selected="selected">开放-任何用户均可加入</option>
                                    </select>
                                </label>
                            </div>
                            <div class="elgg-foot">
                                <input type="submit" value="Save" class="elgg-button elgg-button-submit"/>
                            </div>
                        </fieldset>
                    </form>
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