<%--
  User: wangyan
  Date: 12-5-14
  Time: 上午8:47
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style type="text/css">
<!--
.STYLE1 {
	font-size: 24px;
	font-weight: bold;
}
-->
    </style>
</head>
<body>
<form action="ForgetPasswordAction"  method="post">
    <table width="317" height="259" border="0" align="center" bordercolor="#0099FF">
        <tr>
            <td height="52" nowrap="nowrap"><span class="STYLE1">要查找密码请输入用户名:</span></td>
        </tr>
        <tr>
            <td height="52" nowrap="nowrap"><span class="STYLE1">用户名</span>
          <input name="username" type="text" class="STYLE1" id="username" />          </td>
        </tr>
        <tr>
            <td height="45">
                <div align="center">
                  <input name="submit" type="submit" class="STYLE1"  id="submit" value="提交" />
                </div></td>
        </tr>
  </table>
</form>
</body>
</html>