<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:actionerror/>
<s:actionmessage/>
<s:fielderror/>
<html>
<head>
    <title>Post a blog</title>
</head>
<body>
<center>
    <form action="postblogAction.action" method="post">
        <table border="1">
            <tr>
                <td>title</td>
                <td><input name="title" type="text"/></td>
            </tr>
            <tr>
                <td>content</td>
                <td><input name="content" type="text"/></td>
            </tr>
            <tr>
                <td>tag</td>
                <td><input name="tag" type="text"/></td>
            </tr>
            <tr>
                <td>description</td>
                <td><input name="description" type="text"/></td>
            </tr>
            <tr>
                <td>access</td>
                <td><input name="access" type="text"/></td>
            </tr>
            <tr>
                <td><input type="submit" value="submit"></td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>