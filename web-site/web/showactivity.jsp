<%@ page import="pojo.Activity" %>
<%@ page import="pojo.SiteUser" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla|Activities</title>
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
                        <img src="http://localhost:8080/<%=siteUser.getPortrait()%> "
                             alt="elgg"
                             title="Profile" class="elgg-border-plain elgg-transition"
                             height="16" width="16"/>
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
                <li class="elgg-menu-item-activity elgg-state-selected">
                    <a href="http://elgg-yumingzhe.rhcloud.com/activity">
                        最近活动
                    </a>
                </li>
                <li class="elgg-menu-item-blog">
                    <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=1%>">
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
            <div class="elgg-layout clearfix elgg-river-layout">
                <div class="elgg-main elgg-body">
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">活动</h2>
                    </div>
                    <ul class="elgg-list elgg-list-river elgg-river">
                        <%
                            List<Activity> activities = (List<Activity>) request.getAttribute("useractivities");
                            for (Activity activity : activities) {
                        %>
                        <li class="elgg-item">
                            <div class="elgg-image-block elgg-river-item clearfix">
                                <div class="elgg-image">
                                    <div class="elgg-avatar elgg-avatar-small">
                                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                                        <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=activity.getSiteUser().getUid()%>"
                                           class="">

                                            <img src="img/arrow.png"/>
                                        </a>
                                    </div>
                                </div>
                                <div class="elgg-body">
                                    <div class="elgg-river-summary">
                                        <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=activity.getSiteUser().getUid()%>"
                                           class="elgg-river-subject">
                                            <%=activity.getSiteUser().getUsername()%>
                                        </a>
                                        <%
                                            if (activity.getAction().equals("发表日志")) {
                                                out.write(activity.getAction());
                                        %>
                                        <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=activity.getBlog().getId()%>"
                                           class="elgg-river-object">
                                            <%=activity.getBlog().getTitle()%>
                                        </a>
                                        于<span
                                            class="elgg-river-timestamp"><%=DateFormat.formatPeriod(activity.getActivityOccurTime().getTime(), new Date().getTime())%>
                                          </span>
                                        前发布
                                        <%
                                        } else if (activity.getAction().equals("发表评论")) {
                                            out.write(activity.getAction());
                                        %>对
                                        <%
                                            if (activity.getCommentEntity().getBlog() != null) {
                                        %>
                                        <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=activity.getCommentEntity().getBlog().getId()%>#mycomment"
                                           class="elgg-river-object">
                                            <%=activity.getCommentEntity().getBlog().getTitle()%>
                                        </a>
                                        <%
                                        } else if (activity.getCommentEntity().getFile() != null) {
                                        %>
                                        <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=activity.getCommentEntity().getFile().getId()%>"
                                           class="elgg-river-object">
                                            <%=activity.getCommentEntity().getFile().getFileName()%>
                                        </a>
                                        <%
                                            }
                                        %>
                                        于<span class="elgg-river-timestamp">
                                        <%=DateFormat.formatPeriod(activity.getActivityOccurTime().getTime(), new Date().getTime())%>
                                        </span>前发布
                                        <%
                                        } else if (activity.getAction().equals("上传文件")) {
                                            out.write(activity.getAction());
                                        %>
                                        <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=activity.getFile().getId()%>">
                                            <%=activity.getFile().getFileName()%>
                                        </a>
                                        <%
                                            }
                                            if (activity.getAction().equals("发表评论")) {
                                        %>
                                        <div class="elgg-river-responses"><span
                                                class="elgg-river-comments-tab">评论</span>
                                            <ul class="elgg-list elgg-river-comments">
                                                <li id="item-annotation-16" class="elgg-item">
                                                    <div class="elgg-image-block clearfix">
                                                        <div class="elgg-image">
                                                            <div class="elgg-avatar elgg-avatar-tiny">

                                                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                                                   class="">
                                                                    <img src="<%=siteUser.getPortrait()%>"
                                                                         alt="yumingzhe" title="yumingzhe" class=""/>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div class="elgg-body">
                                                            <div class="mbn">
                                                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe">
                                                                    <%=activity.getCommentEntity().getSiteUser().getUsername()%>
                                                                </a>
                                                                    <span class="elgg-subtext">
                                                                             <acronym
                                                                                     title="<%=activity.getCommentEntity().getPostTime()%>">
                                                                                 <%=DateFormat.formatPeriod(activity.getCommentEntity().getPostTime().getTime(), new Date().getTime())%>
                                                                             </acronym>
                                                                    </span> 前
                                                                <div class="elgg-output">
                                                                    <p><%=activity.getCommentEntity().getContent()%>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
<div class="elgg-page-footer">
    <div class="elgg-inner">
        <ul class="elgg-menu elgg-menu-footer elgg-menu-hz elgg-menu-footer-alt">
        </ul>
        <div class="mts clearfloat float-alt">
        </div>
    </div>
</div>
</div>
</body>
</html>