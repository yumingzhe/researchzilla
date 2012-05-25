<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
    System.out.print("i am invoked here");
    response.sendRedirect("http://localhost:8080/RegisterAction");
%>

</body>
</html>