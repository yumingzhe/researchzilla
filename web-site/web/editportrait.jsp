<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>Researchzilla: Edit avatar</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico">
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>
    <link rel="stylesheet" href="css/avatarcrop.css" type="text/css">
    <link rel="stylesheet" href="css/jquery.Jcrop.css" type="text/css">
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
    <script type="text/javascript" src="js/jquery.Jcrop.js"></script>

    <script type="text/javascript">
        jQuery(function ($) {
            var jcrop_api, boundx, boundy;
            $('#target').Jcrop({
                onChange:updatePreview,
                onSelect:showCoords,
                aspectRatio:1
            }, function () {
                var bounds = this.getBounds();
                boundx = bounds[0];
                boundy = bounds[1];
                jcrop_api = this;
            });

            function updatePreview(c) {
                if (parseInt(c.w) > 0) {
                    var rx = 100 / c.w;
                    var ry = 100 / c.h;

                    $('#mypic').css({
                        width:Math.round(rx * boundx) + 'px',
                        height:Math.round(ry * boundy) + 'px',
                        marginLeft:'-' + Math.round(rx * c.x) + 'px',
                        marginTop:'-' + Math.round(ry * c.y) + 'px'
                    });
                }
            }

            ;

            function showCoords(c) {
                $('#x1').val(c.x);
                $('#y1').val(c.y);
                $('#x2').val(c.x2);
                $('#y2').val(c.y2);
                $('#w').val(c.w);
                $('#h').val(c.h);
            }

            ;
        })
        ;
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
                    <a href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">
                        <span class="elgg-icon elgg-icon-settings "></span>
                        Settings
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
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                       class="elgg-topbar-avatar">
                        <img src="<%=!siteUser.getPortrait().equals("")?siteUser.getPortrait():"img/defaultavatar.gif"%>"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"
                             height="16" width="16"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="elgg-page-header">
        <div class="elgg-inner">
            <h1>
                <a class="elgg-heading-site" href="http://localhost:8080/">
                    Researchzilla
                </a>
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
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout clearfix">
                <div class="elgg-main elgg-body">
                    <h2>Edit avatar</h2>

                    <p class="mtm">
                        你的头像将显示在整个站点中。你可以随意切换你的头像。（可接受的文件格式:GIF,JPG,PNG）</p>

                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <div id="current-user-avatar" class="mrl prl">
                                <label>当前头像</label><br/>
                                <img src="http://localhost:8080/<%=!siteUser.getPortrait().equals("")?siteUser.getPortrait():"img/defaultavatar.gif"%>"
                                     alt="Avatar"/>
                            </div>
                        </div>
                        <div class="elgg-body">
                            <form method="post" action="http://localhost:8080/uploadAvatarAction.action"
                                  enctype="multipart/form-data" class="elgg-form elgg-form-avatar-upload">
                                <fieldset>
                                    <div>
                                        <label>上传新头像</label><br/>
                                        <input type="file" size="30" name="file" class="elgg-input-file"/>
                                    </div>
                                    <div class="elgg-foot">
                                        <input type="submit" value="上传" class="elgg-button elgg-button-submit"/>
                                    </div>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                    <div id="avatar-croppingtool" class="mtl ptm">
                        <label>头像剪切</label>
                        <br/>

                        <p>
                            点击并拖拽一个矩形框来确定剪切头像的区域，与此同时，下方将会显示剪切的预览图。当你确定后点击“创建头像”按钮。
                            剪切后的头像将显示在整个站点中。
                        </p>

                        <form method="post" action="http://localhost:8080/cropAvatarAction.action"
                              class="elgg-form elgg-form-avatar-crop">
                            <input type="hidden" name="picturepath"
                                   value="/home/yumingzhe/Openshift/researchzilla/web-site/target/researchzilla/avatarTmp/">
                            <input type="hidden" name="picturename" value="<%=request.getParameter("picturename")%>"/>

                            <label> <input type="hidden" size="4" id="x1" name="x1"/></label>
                            <label> <input type="hidden" size="4" id="y1" name="y1"/></label>
                            <label><input type="hidden" size="4" id="w" name="width"/></label>
                            <label> <input type="hidden" size="4" id="h" name="height"/></label>

                            <fieldset>
                                <div class="clearfix">
                                    <img id='target'
                                         src="http://localhost:8080/avatarTmp/<%=request.getParameter("picturename")%>"
                                         alt="Avatar" class="mrl" id="user-avatar-cropper"/>

                                    <div id="user-avatar-preview-title">
                                        <label>预览</label>
                                    </div>
                                    <div id="user-avatar-preview">
                                        <img id="mypic"
                                             src="http://localhost:8080/avatarTmp/<%=request.getParameter("picturename")%>"
                                             alt="Avatar"/>
                                    </div>
                                </div>
                                <div class="elgg-foot">
                                    <input type="submit" value="创建头像" class="elgg-button elgg-button-submit"/>
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