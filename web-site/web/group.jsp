<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla: Group</title>
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
    Group group = (Group) request.getAttribute("specifiedgroup");
%>
<div class="elgg-page elgg-page-default">
<div class="elgg-page-messages">
    <ul class="elgg-system-messages">
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
                         width="16s"/>
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
                Researchzilla
            </a>
        </h1>
        <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
            <li class="elgg-menu-item-activity">
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>">最近活动</a>
            </li>
            <li class="elgg-menu-item-blog">
                <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=siteUser.getUid()%>">日志</a></li>
            <li class="elgg-menu-item-file">
                <a href="http://localhost:8080/getUserAllFilesAction.action?uid=<%=siteUser.getUid()%>">文件</a></li>
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
<ul class="elgg-menu elgg-breadcrumbs">
    <li>
        <a href="http://localhost:8080/getUserAllGroupsAction.action?uid=<%=siteUser.getUid()%>">
            Groups
        </a>
    </li>
    <li><%=group.getGroupName()%>
    </li>
</ul>
<div class="elgg-head clearfix">
    <h2 class="elgg-heading-main"><%=group.getGroupName()%>
    </h2>
    <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
        <li class="elgg-menu-item-groups-edit">
            <a href="http://localhost:8080/addUserIntoGroupAction.action?uid=<%=siteUser.getUid()%>&groupid=<%=group.getGroupId()%>"
               class="elgg-button elgg-button-action">
                加入该组
            </a>
        </li>
    </ul>
</div>
<div class="groups-profile clearfix elgg-image-block">
    <div class="elgg-image">
        <div class="groups-profile-icon">
            <img src="<%=group.getGroupOwner().getPortrait()%>" alt="<%=group.getGroupName()%>" class=""/>
        </div>
        <div class="groups-stats">
            <p>
                <b>组创建者: </b>
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=group.getGroupOwner().getUid()%>">
                    <%=group.getGroupOwner().getUsername()%>
                </a>
            </p>

            <p>
                组员: <%=group.getMembers().size()%>
            </p>
        </div>
    </div>

    <div class="groups-profile-fields elgg-body">
        <div class="odd"><b>描述: </b>

            <div class="elgg-output">
                <p><%=group.getDescription()%>
                </p>
            </div>
        </div>
        <div class="odd"><b>标签: </b>

            <div><span class="elgg-icon elgg-icon-tag "></span>
                <ul class="elgg-tags">
                    <li>
                        <a href="http://#" rel="tag">
                            <%=group.getTag()%>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<ul id="groups-tools" class="elgg-gallery elgg-gallery-fluid mtl clearfix">
<li>
    <div class="elgg-module elgg-module-group elgg-module-info">
        <div class="elgg-head"><span class="groups-widget-viewall">
                <a href="http://#">
                    查看所有
                </a>
            </span>

            <h3>组日志</h3></div>
        <div class="elgg-body">
            <ul class="elgg-list elgg-list-entity">
                <%
                    Set<Blog> blogs = group.getBlogs();
                    if (blogs.size() > 0) {
                        Iterator iterator = blogs.iterator();
                        while (iterator.hasNext()) {
                            Blog blog = (Blog) iterator.next();
                %>
                <li id="elgg-object-90" class="elgg-item">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <div class="elgg-avatar elgg-avatar-tiny">
                                <span class="elgg-icon elgg-icon-hover-menu "></span>
                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                   class="">
                                    <img src="<%=blog.getSiteUser().getPortrait()%>"
                                         alt="yumingzhe" title="yumingzhe" class=""/>
                                </a>
                            </div>
                        </div>
                        <div class="elgg-body">
                            <h3>
                                <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>"><%=blog.getTitle()%>
                                </a>
                            </h3>

                            <div class="elgg-subtext">
                                由
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"><%=blog.getSiteUser().getUsername()%>
                                </a>发表于
                                <acronym title="<%=blog.getPostDate()%>">
                                    <%=DateFormat.formatPeriod(blog.getPostDate().getTime(), new Date().getTime())%>
                                </acronym>前
                                <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>#mycomment">
                                    Comments(<%=blog.getCommentEntities().size()%>)
                                </a>
                            </div>
                            <div><span class="elgg-icon elgg-icon-tag "></span>
                                <ul class="elgg-tags">
                                    <li>标签：
                                        <a href="http://elgg-yumingzhe.rhcloud.com/search?q=a&amp;search_type=tags"
                                           rel="tag">
                                            <%=blog.getTag()%>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="elgg-content">
                                <%=blog.getDescription()%>
                            </div>
                        </div>
                    </div>
                </li>
                <%
                        }
                    } else {
                        out.write("没有日志");
                    }
                %>
            </ul>
                 <span class='elgg-widget-more'>
                       <a href="http://localhost:8080/postblog.jsp?groupid=<%=group.getGroupId()%>">
                           发表日志
                       </a>
                 </span>
        </div>
    </div>
</li>


<li>
    <div class="elgg-module elgg-module-group elgg-module-info">
        <div class="elgg-head"><span class="groups-widget-viewall"><a
                href="http://#">查看所有</a></span>

            <h3>组文件</h3></div>
        <%-- <div class="elgg-body">
            <p>No files.</p><span class='elgg-widget-more'><a
                href="http://elgg-yumingzhe.rhcloud.com/file/add/78">上传文件</a></span>
        </div>--%>


        <div class="elgg-body">
            <ul class="elgg-list elgg-list-entity">
                <%
                    Set<File> files = group.getFiles();
                    if (files.size() > 0) {
                        Iterator iterator = files.iterator();
                        while (iterator.hasNext()) {
                            File file = (File) iterator.next();

                %>
                <li id="elgg-object-91" class="elgg-item">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <a href="http://elgg-yumingzhe.rhcloud.com/file/view/91/abc">
                                <img src="img/text.gif"
                                     alt="<%=file.getFileName()%>"/>
                            </a>
                        </div>
                        <div class="elgg-body">
                            <h3>
                                <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=file.getId()%>">
                                    <%=file.getFileName()%>
                                </a>
                            </h3>

                            <div class="elgg-subtext">由
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=file.getSiteUser().getUid()%>">
                                    <%=file.getSiteUser().getUsername()%>
                                </a> 上传于
                                <acronym title="<%=file.getUploadTime()%>">
                                    <%=DateFormat.formatPeriod(file.getUploadTime().getTime(), new Date().getTime())%>
                                </acronym>前
                            </div>
                            <div>
                                <span class="elgg-icon elgg-icon-tag ">
                            </span>
                                <ul class="elgg-tags">
                                    <li>标签：
                                        <a href="http://elgg-yumingzhe.rhcloud.com/search?q=file&amp;search_type=tags"
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
                    } else {
                        out.write("没有文件 ");
                    }
                %>
            </ul>
                  <span class='elgg-widget-more'>
                      <a href="http://localhost:8080/addfile.jsp?groupid=<%=group.getGroupId()%>">
                          Upload a file
                      </a>
                  </span>
        </div>


    </div>
</li>
<li>
    <div class="elgg-module elgg-module-group elgg-module-info">
        <div class="elgg-head"><span class="groups-widget-viewall"><a
                href="http://#">查看所有</a></span>

            <h3>组活动</h3></div>
        <div class="elgg-body">
            <ul class="elgg-list elgg-list-river elgg-river">
                <%
                    Set<Activity> activities = group.getActivities();
                    Iterator activityIterator = activities.iterator();
                    while (activityIterator.hasNext()) {
                        Activity activity = (Activity) activityIterator.next();
                %>
                <li id="item-river-21" class="elgg-item">
                    <div class="elgg-image-block elgg-river-item clearfix">
                        <div class="elgg-image">
                            <div class="elgg-avatar elgg-avatar-small">
                                <span class="elgg-icon elgg-icon-hover-menu "></span>
                                <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                                   class="">
                                    <img src="<%=activity.getSiteUser().getPortrait()%>"
                                         alt="yumingzhe" title="yumingzhe" class=""/>
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
                                </a>于
                                <span class="elgg-river-timestamp">
                                   <%=DateFormat.formatPeriod(activity.getBlog().getPostDate().getTime(), new Date().getTime())%>
                                      </span>前
                                <%
                                } else if (activity.getAction().equals("上传文件")) {
                                    out.write(activity.getAction());
                                %>
                                <a href="http://localhost:8080/getSpecifiedFileAction.action?fileid=<%=activity.getFile().getId()%>"
                                   class="elgg-river-object">
                                    <%=activity.getFile().getFileName()%>
                                </a>于
                                <span class="elgg-river-timestamp">
                                   <%=DateFormat.formatPeriod(activity.getFile().getUploadTime().getTime(), new Date().getTime())%>
                                </span>前
                                <%
                                } else if (activity.getAction().equals("发表评论")) {
                                    out.write(activity.getAction());
                                %>
                                <a href="http://localhost:8080"
                                   class="elgg-river-object">
                                    <%=activity.getCommentEntity().getContent()%>
                                </a>于
                                <span class="elgg-river-timestamp">
                                   <%=DateFormat.formatPeriod(activity.getCommentEntity().getPostTime().getTime(), new Date().getTime())%>
                                </span>前
                                <%
                                    }
                                %>
                                <%-- <span class="elgg-river-timestamp">
                            <%=DateFormat.formatPeriod(activity.getBlog().getPostDate().getTime(), new Date().getTime())%>
                                </span>前--%>
                            </div>
                            <div class="elgg-river-message">
                                <%
                                    if (activity.getAction().equals("发表日志")) {
                                        out.write(activity.getBlog().getDescription());
                                    } else if (activity.getAction().equals("上传文件")) {
                                        out.write(activity.getFile().getFileName());
                                    } else if (activity.getAction().equals("发表评论")) {
                                        out.write(activity.getCommentEntity().getContent());
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
</li>
<li>
    <div class="elgg-module elgg-module-group elgg-module-info">
        <div class="elgg-head"><span class="groups-widget-viewall">
            <a href="http://#">
                查看所有
            </a>
        </span>

            <h3>组员</h3></div>
        <div class="elgg-body">
            <ul class="elgg-list elgg-list-entity">
                <%
                    Set<SiteUser> siteUsers = group.getMembers();
                    Iterator siteUserIterator = siteUsers.iterator();
                    while (siteUserIterator.hasNext()) {
                        SiteUser member = (SiteUser) siteUserIterator.next();
                %>
                <li id="elgg-object-81" class="elgg-item">
                    <div class="elgg-image-block clearfix">
                        <div class="elgg-image">
                            <div class="elgg-avatar elgg-avatar-tiny">
                                <span class="elgg-icon elgg-icon-hover-menu "></span>
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=member.getUid()%>"
                                   class="">
                                    <img src="<%=member.getPortrait()%>" alt="<%=member.getUsername()%>"
                                         title="<%=member.getUsername()%>"
                                         class=""/>
                                </a>
                            </div>
                        </div>
                        <div class="elgg-body">
                            <h3>
                                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=member.getUid()%>">
                                    <%=member.getUsername()%>
                                </a>
                            </h3>
                        </div>
                    </div>
                </li>
                <%
                    }
                %>
            </ul>
        </div>
    </div>
</li>
</ul>
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