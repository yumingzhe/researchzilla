<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>show activities</title>
</head>
<body>
<center>
    <form action="getUserAllActivitiesAction.action" method="post">
        <table border="1">
            <tr>
                <td><input name="uid" type="text"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="submit"/></td>
            </tr>
        </table>
    </form>
</center>
</body>
</html>