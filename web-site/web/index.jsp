<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Registration</title>
</head>
<body>
<center>
    <s:actionmessage/>
    <s:actionerror/>
    <form action="registerAction.action" method="post">
        <table border="1">
            <tr>
                <td>Username</td>
                <td><input name="username" type="text"/></td>
            </tr>
            <tr>
                <td>password</td>
                <td><input name="password" type="password"/></td>
            </tr>
            <tr>
                <td>repassword</td>
                <td><input name="repassword" type="password"/></td>
            </tr>
            <tr>
                <td>email</td>
                <td><input name="email" type="text"/></td>
            </tr>
            <tr>
                <td>instituteId</td>
                <td><input name="instituteId" type="text"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="submit"/></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>