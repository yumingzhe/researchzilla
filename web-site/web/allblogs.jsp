<%@ page import="pojo.Blog" %>
<%@ page import="java.util.List" %>
<%@ page import="util.DateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="pojo.SiteUser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla</title>
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
                    <a href="http://localhost:8080/ExitAction.action">Log
                        out
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe"
                       class="elgg-topbar-avatar">
                        <img src="<%=siteUser.getPortrait()%>"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"
                             width="16" height="16"/>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="elgg-page-header">
        <div class="elgg-inner">

            <h1>
                <a class="elgg-heading-site"
                   href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                    Researchzilla </a>
            </h1>
            <ul class="elgg-menu elgg-menu-site elgg-menu-site-default clearfix">
                <li class="elgg-menu-item-activity">
                    <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
                        最近活动
                    </a>
                </li>
                <li class="elgg-menu-item-blog elgg-state-selected">
                    <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>">
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
                    <%-- <input type="text" class="search-input" size="21" name="q" value="Search"
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
                        <li>Blogs</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">All blogs</h2>
                        <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
                            <li class="elgg-menu-item-add"><a href="http://localhost:8080/postblog.jsp"
                                                              class="elgg-button elgg-button-action">发表新文章</a>
                            </li>
                        </ul>
                    </div>
                    <ul class="elgg-list elgg-list-entity">
                        <%
                            List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
                            for (Blog blog : blogs) {
                        %>
                        <li id="elgg-object-50" class="elgg-item">
                            <div class="elgg-image-block clearfix">
                                <div class="elgg-image">
                                    <div class="elgg-avatar elgg-avatar-tiny">
                                        <span class="elgg-icon elgg-icon-hover-menu "></span>
                                        <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class=""><img
                                                src="<%=siteUser.getPortrait()%>"
                                                alt="yumingzhe" title="yumingzhe" class=""
                                                />
                                        </a>
                                    </div>
                                </div>
                                <div class="elgg-body">
                                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">

                                        <li class="elgg-menu-item-access"><span
                                                class="elgg-access elgg-access-private"><%=blog.getAccess()%></span>
                                        </li>
                                        <%
                                            if (blog.getSiteUser().getUid() == ((SiteUser) session.getAttribute("user")).getUid()) {
                                        %>
                                        <li class="elgg-menu-item-edit"><a
                                                href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>&type=update"
                                                title="Edit this">Edit</a>
                                        </li>
                                        <%
                                            }
                                            if (blog.getSiteUser().getUid() == ((SiteUser) session.getAttribute("user")).getUid()) {
                                        %>
                                        <li class="elgg-menu-item-delete">
                                            <a href="http://localhost:8080/deleteblogAction.action?blogid=<%=blog.getId()%>&uid=<%=((SiteUser)session.getAttribute("user")).getUid()%>&type=blog"
                                               title="Delete this"
                                               class="elgg-requires-confirmation">
                                                <span class="elgg-icon elgg-icon-delete "></span>
                                            </a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                    <h3>
                                        <a href="http://localhost:8080/getSpecifiedBlogAction.action?blogid=<%=blog.getId()%>">
                                            <%=blog.getTitle()%>
                                        </a>
                                    </h3>

                                    <div class="elgg-subtext">由
                                        <a href="http://localhost:8080/getUserAllBlogs.action?uid=<%=blog.getSiteUser().getUid()%>">
                                            <%=blog.getSiteUser().getUsername()%>
                                        </a>于
                                        <acronym title="<%=blog.getPostDate()%>">
                                            <%=DateFormat.formatPeriod(blog.getPostDate().getTime(), new Date().getTime())%>
                                        </acronym>前发布
                                    </div>
                                    <div class="elgg-content">
                                        <%
                                            if (blog.getDescription() != null)
                                                out.write(blog.getDescription());
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
    <div class="elgg-page-footer">
        <div class="elgg-inner">
        </div>
    </div>
</div>
</body>
</html>