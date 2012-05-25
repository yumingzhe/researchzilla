<%@ page import="org.apache.struts2.ServletActionContext" %>
<%--
  User: wangyan
  Date: 12-5-24
  Time: 下午5:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
</head>
<body>
<%

    response.sendRedirect("http://localhost:8080/GetInternalNoticeAction");
%>
</body>
</html>