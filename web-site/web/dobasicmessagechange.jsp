<%--
  User: wangyan
  Date: 12-5-28
  Time: ����8:24
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
    <title>�ļ��ϴ�����ҳ�� </title>

</head>
<body>
<%
    SmartUpload mySmartUpload =new SmartUpload();
    long file_size_max=4000000;
    String ext="";
    String url="img/"; //Ӧ��֤�ڸ�Ŀ¼���д�Ŀ¼�Ĵ��ڣ�Ҳ����˵��Ҫ�Լ�������Ӧ���ļ��У�
    //��ʼ��
    mySmartUpload.initialize(pageContext);
   //ֻ�������ش����ļ�
    try {
    mySmartUpload.setAllowedFilesList("jpg,gif");//�˴����ļ���ʽ���Ը�����Ҫ�Լ��޸�
    //�����ļ�
    mySmartUpload.upload();
    } catch (Exception e){
   %>
<SCRIPT language=javascript>
    alert("ֻ�����ϴ�.jpg��.gif����ͼƬ�ļ�");
    window.location='basicmessagedesign.jsp';
    </script>
<%
        }
    try{

        com.jspsmart.upload.File myFile = mySmartUpload.getFiles().getFile(0);
        if (myFile.isMissing()){%>
<SCRIPT language=javascript>
    alert("����ѡ��Ҫ�ϴ����ļ�");
    window.location='basicmessagedesign';
</script>
        <%}else{
    //String myFileName=myFile.getFileName(); //ȡ�����ص��ļ����ļ���
        ext= myFile.getFileExt();      //ȡ�ú�׺��
        int file_size=myFile.getSize();     //ȡ���ļ��Ĵ�С
        String saveurl="";
        if(file_size<file_size_max){
        //�����ļ�����ȡ�õ�ǰ�ϴ�ʱ��ĺ�����ֵ
            Calendar calendar = Calendar.getInstance();
            String filename = String.valueOf(calendar.getTimeInMillis());
            saveurl=request.getRealPath("/")+url;
            saveurl+=filename+"."+ext;          //����·��
            myFile.saveAs(saveurl,mySmartUpload.SAVE_PHYSICAL);
            //out.print(filename);
            request.setAttribute("filename",filename);
            request.setAttribute("path",saveurl);
            System.out.println(request.getAttribute("path"));
            request.setAttribute("websitename",mySmartUpload.getRequest().getParameter("websitename"));
            request.setAttribute("maintenanceaddress",mySmartUpload.getRequest().getParameter("maintenanceaddress"));
            request.setAttribute("defaultlanguage",mySmartUpload.getRequest().getParameter("defaultlanguage"));
//-----------------------�ϴ���ɣ���ʼ��������ͼ-------------------------
            java.io.File file = new java.io.File(saveurl);        //����ղ��ϴ����ļ�
            String newurl=request.getRealPath("/")+url+filename+"_min."+ext;  //�µ�����ͼ�����ַ
            Image src = javax.imageio.ImageIO.read(file);                     //����Image����
            float tagsize=200;
            int old_w=src.getWidth(null);                                     //�õ�Դͼ��
            int old_h=src.getHeight(null);
            int new_w=0;
            int new_h=0;                            //�õ�Դͼ��
            int tempsize;
            float tempdouble;
            if(old_w>old_h){
                tempdouble=old_w/tagsize;
            }else{
                tempdouble=old_h/tagsize;
            }
            new_w=Math.round(old_w/tempdouble);
            new_h=Math.round(old_h/tempdouble);//������ͼ����
            BufferedImage tag = new BufferedImage(new_w,new_h,BufferedImage.TYPE_INT_RGB);
            tag.getGraphics().drawImage(src,0,0,new_w,new_h,null);       //������С���ͼ
            FileOutputStream newimage=new FileOutputStream(newurl);          //������ļ���
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(newimage);
            encoder.encode(tag);                                               //��JPEG����
            newimage.close(); %>
        <img src="<%=newurl%>" vspace="3" border="0" align="absmiddle" />
        <%}else{
                out.print("<SCRIPT language=''javascript''>");
                out.print("alert(''�ϴ��ļ���С���ܳ���"+(file_size_max/1000)+"K'');");
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
