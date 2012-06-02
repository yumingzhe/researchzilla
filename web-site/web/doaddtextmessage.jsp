<%--
  User: wangyan
  Date: 12-5-28
  Time: 下午8:24
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="com.sun.image.codec.jpeg.JPEGImageEncoder" %>
<%@ page import="com.sun.image.codec.jpeg.JPEGCodec" %>
<%@ page import="pojo.PictureNews" %>
<%@ page import="pojo.Message" %>
<html>
<head>
    <title>文件上传处理页面 </title>

</head>
<body>
<%
    SmartUpload mySmartUpload =new SmartUpload();
    long file_size_max=4000000;
    String ext="";
    String url="./file/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）
    //初始化
    mySmartUpload.initialize(pageContext);
    //只允许上载此类文件
    try {
        mySmartUpload.setAllowedFilesList("txt,doc,docx");//此处的文件格式可以根据需要自己修改
        //上载文件
        mySmartUpload.upload();
    } catch (Exception e){
%>
<SCRIPT language=javascript>
    alert("只允许上传.txt,.docx和.doc类型图片文件");
    window.location='addtextmessage.jsp';
</script>
<%
    }
    try{

        com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
        if (myFile.isMissing()){%>
<SCRIPT language=javascript>
    alert("请先选择要上传的文件");
    window.location='addtextmessage.jsp';
</script>
<%}else{
    String myFileName=myFile.getFileName(); //取得上载的文件的文件名
    ext= myFile.getFileExt();      //取得后缀名
    int file_size=myFile.getSize();     //取得文件的大小
    String saveurl="";
    if(file_size<file_size_max){

        saveurl=url;
        saveurl+=myFileName;          //保存路径
        myFile.saveAs(saveurl,mySmartUpload.SAVE_VIRTUAL);
        //out.print(filename);
        request.setAttribute("filename",myFileName);
        request.setAttribute("filepath",saveurl);
        System.out.println(request.getAttribute("filepath"));

        Message message=new Message();
        message.setTopic(mySmartUpload.getRequest().getParameter("topic"));
        message.setType(mySmartUpload.getRequest().getParameter("type"));
        message.setAuthor(mySmartUpload.getRequest().getParameter("author"));
        message.setPublisher(mySmartUpload.getRequest().getParameter("publisher"));
        message.setContent(mySmartUpload.getRequest().getParameter("content"));
        message.setFilepath(saveurl);
        request.setAttribute("message",message);
 }else{
    out.print("<SCRIPT language=''javascript''>");
    out.print("alert(''上传文件大小不能超过"+(file_size_max/1000)+"K'');");
    out.print("window.location='addtextmessage.jsp'");
    out.print("</SCRIPT>");
}
}
    RequestDispatcher requestDispatcher= request.getRequestDispatcher("http://localhost:8080/MessageAction.action");
    requestDispatcher.forward(request,response);
}catch (Exception e){
    e.toString();
}
%>
</body>
</html>
