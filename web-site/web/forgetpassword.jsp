<%--
  User: wangyan
  Date: 12-5-14
  Time: 上午8:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Researchzilla ForgetPassword</title>
</head>
<body>
<s:actionerror/>
<s:actionmessage/>
<s:fielderror/>
<form action="forgetpasswordAction.action" method="post">
    <table width="317" height="259" border="0" bordercolor="#0099FF">
        <tr>
            <td height="52" nowrap="nowrap">请输入邮件地址:</td>
        </tr>
        <tr>
            <td height="52" nowrap="nowrap">email
                <input name="email" type="text"/>
            </td>
        </tr>
        <tr>
            <td height="45">
                <input name="submit" type="submit" id="submit" value="提交"/>
            </td>
        </tr>
  </table>
</form>
</body>
</html>