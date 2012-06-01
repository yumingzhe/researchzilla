<%--
  User: wangyan
  Date: 12-5-28
  Time: 下午8:24
--%>
<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@ page import="java.awt.*" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="com.sun.image.codec.jpeg.JPEGImageEncoder" %>
<%@ page import="com.sun.image.codec.jpeg.JPEGCodec" %>
<html>
<head>
    <title>文件上传处理页面 </title>

</head>
<body>
<%
    SmartUpload mySmartUpload =new SmartUpload();
    long file_size_max=4000000;
    String ext="";
    String url="img/"; //应保证在根目录中有此目录的存在（也就是说需要自己建立相应的文件夹）
    //初始化
    mySmartUpload.initialize(pageContext);
   //只允许上载此类文件
    try {
    mySmartUpload.setAllowedFilesList("jpg,gif");//此处的文件格式可以根据需要自己修改
    //上载文件
    mySmartUpload.upload();
    } catch (Exception e){
   %>
<SCRIPT language=javascript>
    alert("只允许上传.jpg和.gif类型图片文件");
    window.location='basicmessagedesign.jsp';
    </script>
<%
        }
    try{

        com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
        if (myFile.isMissing()){%>
<SCRIPT language=javascript>
    alert("请先选择要上传的文件");
    window.location='basicmessagedesign';
</script>
        <%}else{
    //String myFileName=myFile.getFileName(); //取得上载的文件的文件名
        ext= myFile.getFileExt();      //取得后缀名
        int file_size=myFile.getSize();     //取得文件的大小
        String saveurl="";
        if(file_size<file_size_max){
        //更改文件名，取得当前上传时间的毫秒数值
            Calendar calendar = Calendar.getInstance();
            String filename = String.valueOf(calendar.getTimeInMillis());
            saveurl=request.getRealPath("/")+url;
            saveurl+=filename+"."+ext;          //保存路径
            myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);
            //out.print(filename);
            request.setAttribute("filename",filename);
            request.setAttribute("path",saveurl);
            System.out.println(request.getAttribute("path"));
            request.setAttribute("websitename",mySmartUpload.getRequest().getParameter("websitename"));
            request.setAttribute("maintenanceaddress",mySmartUpload.getRequest().getParameter("maintenanceaddress"));
            request.setAttribute("defaultlanguage",mySmartUpload.getRequest().getParameter("defaultlanguage"));
//-----------------------上传完成，开始生成缩略图-------------------------
            java.io.File file = new java.io.File(saveurl);        //读入刚才上传的文件
            String newurl=request.getRealPath("/")+url+filename+"_min."+ext;  //新的缩略图保存地址
            Image src = javax.imageio.ImageIO.read(file);                     //构造Image对象
            float tagsize=200;
            int old_w=src.getWidth(null);                                     //得到源图宽
            int old_h=src.getHeight(null);
            int new_w=0;
            int new_h=0;                            //得到源图长
            int tempsize;
            float tempdouble;
            if(old_w>old_h){
                tempdouble=old_w/tagsize;
            }else{
                tempdouble=old_h/tagsize;
            }
            new_w=Math.round(old_w/tempdouble);
            new_h=Math.round(old_h/tempdouble);//计算新图长宽
            BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //绘制缩小后的图
            FileOutputStream newimage=new FileOutputStream(newurl);          //输出到文件流
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
            encoder.encode(tag);                                               //近JPEG编码
            newimage.close(); %>
        <img src="<%=newurl%>" vspace="3" border="0" align="absmiddle" />
        <%}else{
                out.print("<SCRIPT language=''javascript''>");
                out.print("alert(''上传文件大小不能超过"+(file_size_max/1000)+"K'');");
                out.print("window.location='basicmessagedesign'");
                out.print("</SCRIPT>");
          }
      }
       RequestDispatcher requestDispatcher= request.getRequestDispatcher("http://localhost:8080/BasicDesignAction.action");
       requestDispatcher.forward(request,response);
    }catch (Exception e){
        e.toString();
    }
%>
</body>
</html>
