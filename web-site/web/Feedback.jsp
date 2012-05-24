<%--
  User: wangyan
  Date: 12-5-23
  Time: 下午5:43
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>feedback</title>
    <style type="text/css">
        <!--
        .STYLE1 {
            font-size: 18px;
            font-weight: bold;
        }
        -->
    </style>
    <style type="text/css">
        <!--
        .STYLE2 {
            font-size: 36px;
            font-weight: bold;
        }
        -->
    </style>
    <link href="layout.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
<!--
.STYLE3 {
	font-size: 24px;
	font-weight: bold;
}
-->
    </style>
</head>
<body>
<div id="container_1">
    <div id="header_2">
        <div align="center" class="STYLE2"></div>
    </div>
    <div id="mainContent_2">
        <div align="center">
            <form action="FeedbackAction" method="post" name="loginform" class="STYLE1" id="loginform">
              <p class="STYLE3">标题 </p>
              <label>
              <input name="title" type="text" class="STYLE3" maxlength="60">
              </label>
              <p><span class="STYLE3">内容</span></p>
              <p class="STYLE3">
                <label>
                <textarea name="content" rows="10" class="STYLE3"></textarea>
                </label>
              </p>
              <p class="STYLE3">
                <label>
                <input name="Submit" type="submit" class="STYLE3" value="提交"> 
                </label>
                <label>
                 <input name="Reset" type="reset" class="STYLE3" value="重置">
                </label>
              </p>
            </form>
        </div>
    </div>
 </div>
</body>
</html>