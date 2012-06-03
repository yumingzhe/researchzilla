<%@ page import="pojo.File" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla | Files</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
</head>
<body>

<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
    List<File> files = (List<File>) request.getAttribute("files");
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
                <a
                        href="http://localhost:8080/accountsetting.jsp"><span
                        class="elgg-icon elgg-icon-settings "></span>
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
            <li class="elgg-menu-item-elgg-logo">
                <a href="http://www.elgg.org/" class="elgg-topbar-logo">
                    <img src="img/elgg_toolbar_logo.gif" alt="researchzilla logo" width="38" height="20"/>
                </a>
            </li>
            <li class="elgg-menu-item-profile">
                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                    <img
                            src="img/icondirect.jpg"
                            alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"/>
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
            <a class="elgg-heading-site"
               href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
                Researchzilla </a>
        </h1>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity">
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">
                    最近活动
                </a>
            </li>
            <li class="elgg-menu-item-blog">
                <a href="http://localhost:8080/getSpecifiedBlogAction.action?uid=<%=siteUser.getUid()%>">日志</a></li>
            <li class="elgg-menu-item-file elgg-state-selected">
                <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">
                    文件
                </a>
            </li>
            <li class="elgg-menu-item-groups">
                <a href="http://elgg-yumingzhe.rhcloud.com/groups/all">
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
                    <li>Files</li>
                </ul>
                <div class="elgg-head clearfix">
                    <h2 class="elgg-heading-main">用户文件</h2>
                    <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
                        <li class="elgg-menu-item-add">
                            <a href="http://localhost:8080/addfile.jsp" class="elgg-button elgg-button-action">
                                上传文件
                            </a>
                        </li>
                    </ul>
                </div>

                <ul class="elgg-list elgg-list-entity">
                    <%
                        for (File file : files) {
                    %>
                    <li id="elgg-object-82" class="elgg-item">
                        <div class="elgg-image-block clearfix">
                            <div class="elgg-image">
                                <a href="http://elgg-yumingzhe.rhcloud.com/file/view/82/agenda">
                                    <img
                                            src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/text.gif"
                                            alt="agenda"/>
                                </a>
                            </div>
                            <div class="elgg-body">
                                <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                                    <li class="elgg-menu-item-access">
                                        <span class="elgg-access"><%=file.getAccess()%></span>
                                    </li>
                                    <li class="elgg-menu-item-edit">
                                        <a
                                                href="http://elgg-yumingzhe.rhcloud.com/file/edit/82"
                                                title="Edit this">
                                            Edit
                                        </a>
                                    </li>
                                    <li class="elgg-menu-item-delete">
                                        <a
                                                href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=82"
                                                title="Delete this" rel="Are you sure you want to delete this item?"
                                                class="elgg-requires-confirmation"><span
                                                class="elgg-icon elgg-icon-delete "></span>
                                        </a>
                                    </li>
                                </ul>
                                <h3>
                                    <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>">
                                        <%=file.getFileName()%>
                                    </a>
                                </h3>

                                <div class="elgg-subtext">由
                                    <a href="http://localhost:8080/getUserAllActivities.action?uid=<%=file.getSiteUser().getUid()%>">
                                        <%=file.getSiteUser().getUsername()%>
                                    </a>
                                    <acronym title="<%=file.getUploadTime()%>">
                                        <%=DateFormat.formatPeriod(file.getUploadTime().getTime(), new Date().getTime())%>
                                    </acronym>
                                    <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>#mycomment">
                                        Comments
                                        (<%=file.getCommentEntities().size()%>)
                                    </a>
                                </div>
                                <div>
                                    <span class="elgg-icon elgg-icon-tag "></span>
                                    <ul class="elgg-tags">
                                        <li>
                                            <a href="http://elgg-yumingzhe.rhcloud.com/search?q=agenda&amp;search_type=tags"
                                               rel="tag">
                                                <%=file.getTag()%>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="elgg-content">
                                    <%=file.getDescription()%>
                                </div>
                            </div>
                        </div>
                    </li>
                    <%
                        }
                    %>
                    <%--<li id="elgg-object-56" class="elgg-item">
                        <div class="elgg-image-block clearfix">
                            <div class="elgg-image"><a href="http://elgg-yumingzhe.rhcloud.com/file/view/56/"><img
                                    src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/word.gif"
                                    alt="开题报告"/></a></div>
                            <div class="elgg-body">
                                <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                                    <li class="elgg-menu-item-access"><span class="elgg-access">Public</span></li>
                                    <li class="elgg-menu-item-edit"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/file/edit/56"
                                            title="Edit this">Edit</a>
                                    </li>
                                    <li class="elgg-menu-item-delete">
                                        <a
                                                href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=56"
                                                title="Delete this" rel="Are you sure you want to delete this item?"
                                                class="elgg-requires-confirmation">
                            <span class="elgg-icon elgg-icon-delete ">
                                </span>
                                        </a>
                                    </li>
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
                    </li>--%>
                    <%--<li id="elgg-object-55" class="elgg-item">
                        <div class="elgg-image-block clearfix">
                            <div class="elgg-image"><a href="http://elgg-yumingzhe.rhcloud.com/file/view/55/"><img
                                    src="http://elgg-yumingzhe.rhcloud.com/mod/file/graphics/icons/text.gif"
                                    alt="我的论文"/></a></div>
                            <div class="elgg-body">
                                <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                                    <li class="elgg-menu-item-access"><span class="elgg-access">Public</span></li>
                                    <li class="elgg-menu-item-edit"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/file/edit/55"
                                            title="Edit this">Edit</a>
                                    </li>
                                    <li class="elgg-menu-item-delete"><a
                                            href="http://elgg-yumingzhe.rhcloud.com/action/file/delete?guid=55&amp;__elgg_ts=1338536891&amp;__elgg_token=b641ff59d0f4cec21dc59be8be05020f"
                                            title="Delete this" rel="Are you sure you want to delete this item?"
                                            class="elgg-requires-confirmation"><span
                                            class="elgg-icon elgg-icon-delete "></span></a></li>
                                </ul>
                                <h3><a href="http://elgg-yumingzhe.rhcloud.com/file/view/55/">我的论文</a></h3>

                                <div class="elgg-subtext">By <a
                                        href="http://elgg-yumingzhe.rhcloud.com/file/owner/wangwu">wangwu</a>
                                    <acronym title="29 March 2012 @ 3:26pm">64 days ago</acronym></div>
                                <div class="elgg-content">我的论文穿上来啦，欢迎下载</div>
                            </div>
                        </div>
                    </li>--%>
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