<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.Group" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Researchzilla: All groups</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css" type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript"
            src="js/jquery-ui-1.8.20.custom.min.js"></script>
    <script type="text/javascript" src="js/jquery.form.js"></script>
    <script type="text/javascript" src="js/researchzilla.js"></script>
</head>
<body>
<%
    SiteUser siteUser = (SiteUser) session.getAttribute("user");
    Set<Group> groups = (Set<Group>) request.getAttribute("groups");
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
                        Logout
                    </a>
                </li>
            </ul>
            <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
                <li class="elgg-menu-item-profile">
                    <a href="http://elgg-yumingzhe.rhcloud.com/profile/yumingzhe" class="elgg-topbar-avatar">
                        <img src="img/icondirect.jpg"
                             alt="yumingzhe" title="Profile" class="elgg-border-plain elgg-transition"/>
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
                <li class="elgg-menu-item-groups elgg-state-selected">
                    <a href="http://localhost:8080/getUserAllGroupsAction.action?uid=<%=siteUser.getUid()%>">
                        组
                    </a>
                </li>
            </ul>
            <form class="elgg-search elgg-search-header" action="http://elgg-yumingzhe.rhcloud.com/search" method="get">
                <fieldset>
                    <%--<input type="text" class="search-input" size="21" name="q" value="Search"
                           onblur="if (this.value=='') { this.value='Search' }"
                           onfocus="if (this.value=='Search') { this.value='' };"/>
                    <input type="submit" value="Go" class="search-submit-button"/>--%>
                </fieldset>
            </form>
        </div>
    </div>
    <div class="elgg-page-body">
        <div class="elgg-inner">

            <div class="elgg-layout  clearfix">
                <div class="elgg-main elgg-body">
                    <ul class="elgg-menu elgg-breadcrumbs">
                        <li>Groups</li>
                    </ul>
                    <div class="elgg-head clearfix">
                        <h2 class="elgg-heading-main">Groups</h2>
                        <ul class="elgg-menu elgg-menu-title elgg-menu-hz elgg-menu-title-default">
                            <li class="elgg-menu-item-add">
                                <a href="http://localhost:8080/creategroup.jsp"
                                   class="elgg-button elgg-button-action">
                                    新建组
                                </a>
                            </li>
                        </ul>
                    </div>
                    <ul class="elgg-list elgg-list-entity">
                        <%
                            Iterator iterator = groups.iterator();
                            while (iterator.hasNext()) {
                                Group group = (Group) iterator.next();
                        %>

                        <li id="elgg-group-78" class="elgg-item">
                            <div class="elgg-image-block clearfix">
                                <div class="elgg-image">
                                    <a href="http://elgg-yumingzhe.rhcloud.com/groups/profile/78/class-one">
                                        <img src="img/group.png" alt="class one" class=""/>
                                    </a>
                                </div>
                                <div class="elgg-body">
                                    <ul class="elgg-menu elgg-menu-entity elgg-menu-hz elgg-menu-entity-default">
                                        <li class="elgg-menu-item-membership">
                                            组状态： <%=group.getAccess()%>
                                        </li>
                                        <li class="elgg-menu-item-members">
                                            <%=group.getMembers().size()%>个成员
                                        </li>
                                    </ul>
                                    <h3>
                                        <a href="http://localhost:8080/getSpecifiedGroupAction.action?groupid=<%=group.getGroupId()%>">
                                            <%=group.getGroupName()%>
                                        </a>
                                    </h3>

                                    <div class="elgg-subtext">
                                        <%=group.getDescription()%>
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