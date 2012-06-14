<%@ page import="pojo.SiteUser" %>
<%@ page import="pojo.UserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<html>
<head>
    <title>Researchzilla | Personal profile Settings</title>
    <link rel="SHORTCUT ICON" href="conf/favicon.ico"/>
    <link rel="stylesheet" href="css/researchzilla.css"
          type="text/css"/>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.8.20.custom.min.js"></script>
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
    UserEntity userEntity = siteUser.getUserEntity();
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
            <li class="elgg-menu-item-usersettings elgg-state-selected">
                <a href="http://localhost:8080/personalsetting.jsp">
                    <span class="elgg-icon elgg-icon-settings "></span>
                    个人设置
                </a>
            </li>
            <li class="elgg-menu-item-logout">
                <a href="http://elgg-yumingzhe.rhcloud.com/action/logout?__elgg_ts=1338531088&amp;__elgg_token=97bb23aef67918894673a41a20cdaba2">
                    Logout
                </a>
            </li>
        </ul>
        <ul class="elgg-menu elgg-menu-topbar elgg-menu-topbar-default">
            <li class="elgg-menu-item-profile">
                <a href="http://localhost:8080/getUserAllActivitiesAction.action?uid=<%=siteUser.getUid()%>"
                   class="elgg-topbar-avatar">
                    <img src="http://localhost:8080/<%=siteUser.getPortrait()%>"
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
            <a class="elgg-heading-site"
               href="http://localhost:8080/getUserAllActivities.action?uid=<%=siteUser.getUid()%>">
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
                <a href="http://elgg-yumingzhe.rhcloud.com/file/all#">
                    文件
                </a>
            </li>
            <li class="elgg-menu-item-groups">
                <a href="http://elgg-yumingzhe.rhcloud.com/groups/all#">
                    组
                </a>
            </li>
        </ul>
    </div>
</div>
<div class="elgg-page-body">
    <div class="elgg-inner">

        <div class="elgg-layout elgg-layout-one-sidebar clearfix">
            <div class="elgg-sidebar">
                <ul class="elgg-menu elgg-menu-extras elgg-menu-hz elgg-menu-extras-default">
                </ul>
                <ul class="elgg-menu elgg-menu-page elgg-menu-page-default">
                    <li class="elgg-menu-item-1-account ">
                        <a href="http://localhost:8080/accountsetting.jsp">
                            账户设置
                        </a>
                    </li>
                    <li class="elgg-menu-item-1-plugins elgg-state-selected">
                        <a href="http://localhost:8080/personalinfosetting.jsp">
                            个人信息设置
                        </a>
                    </li>
                    <li class="elgg-menu-item-1-statistics">
                        <a href="http://localhost:8080/personalinfostatistics.jsp">
                            账户统计信息
                        </a>
                    </li>
                </ul>
            </div>

            <div class="elgg-main elgg-body">
                <ul class="elgg-menu elgg-breadcrumbs">
                    <li>
                        <a href="http://elgg-yumingzhe.rhcloud.com/settings/user/yumingzhe">
                            Settings
                        </a>
                    </li>
                </ul>
                <h2>个人信息设置</h2>

                <form method="post" action="http://localhost:8080/updatePersonalProfileAction.action"
                      class="elgg-form elgg-form-alt elgg-form-usersettings-save">
                    <fieldset>
                        <input type="hidden" name="uid" value="<%=siteUser.getUid()%>"/>

                        <div class="elgg-module elgg-module-info">
                            <div class="elgg-head">
                                <h3>个人简介</h3>
                            </div>
                            <div class="elgg-body">
                                <p>
                                    真实姓名:

                                    <input type="text" name="realname"
                                           class="elgg-input-password"
                                           value="<%=userEntity.getRealName()!=null?userEntity.getRealName():""%>"/>
                                </p>

                                <p>
                                    年龄:
                                    <input type="text" name="age" class="elgg-input-password"
                                           value="<%=userEntity.getAge()<=0?"":userEntity.getAge()%>"/>
                                </p>

                                <p>
                                    出生日期:
                                    <input type="text" name="birthday"
                                           class="elgg-input-password"/>
                                </p>

                                <p>
                                    学历:
                                    <input type="text" name="education"
                                           value="<%=userEntity.getEducation()!=null?userEntity.getEducation():""%>"
                                           class="elgg-input-password"/>
                                </p>

                                <p>
                                    爱好:
                                    <input type="text" name="hobby"
                                           value="<%=userEntity.getHobby()!=null?userEntity.getHobby():""%>"
                                           class="elgg-input-password"/>
                                </p>

                                <p>
                                    职称:
                                    <input type="text" name="professionaltitle"
                                           value="<%=userEntity.getProfessionaltitle()!=null?userEntity.getProfessionaltitle():""%>"
                                           class="elgg-input-password"/>
                                </p>

                                <p>
                                    联系方式:
                                    <input type="text" name="mobilePhone"
                                           value="<%=userEntity.getMobilePhone()%>"
                                           class="elgg-input-password"/>
                                </p>
                            </div>
                        </div>
                        <div class="elgg-module elgg-module-info">
                            <div class="elgg-head">
                                <h3>详细信息</h3>
                            </div>
                            <div class="elgg-body">
                                <p>
                                    个人简介:
                                    <textarea rows="5" cols="50" name="personalprofile">
                                        <%=userEntity.getPersonalprofile() != null ? userEntity.getPersonalprofile() : ""%>
                                    </textarea>
                                </p>

                                <p>
                                    个人详细信息:
                                    <textarea rows="30" cols="50" name="personaldetail">
                                        <%=userEntity.getPersonaldetail() != null ? userEntity.getPersonaldetail() : ""%>
                                    </textarea>
                                </p>

                                <p>
                                    研究兴趣:
                                    <textarea rows="30" cols="50" name="researchinterest">
                                        <%=userEntity.getResearchinterest() != null ? userEntity.getResearchinterest() : ""%>
                                    </textarea>

                                </p>

                                <p>
                                    科研项目经历:
                                    <textarea rows="30" cols="50" name="researchprojects">
                                        <%=userEntity.getResearchprojects() != null ? userEntity.getResearchprojects() : ""%>
                                    </textarea>

                                </p>

                                <p>
                                    个人荣誉:
                                    <textarea rows="30" cols="50" name="personalhonor">
                                        <%=userEntity.getPersonalhonor() != null ? userEntity.getPersonalhonor() : ""%>
                                    </textarea>

                                </p>
                            </div>
                        </div>
                        <div class="elgg-foot">
                            <input type="submit" value="更新" class="elgg-button elgg-button-submit"/>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="elgg-page-footer">
</div>
</div>
</body>
</html>