package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Message;
import pojo.PictureNews;
import service.MessageService;
import service.PictureNewsService;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-30
 * Time: 下午1:59
 */
public class MessageAction extends ActionSupport {
    private String topic;
    private String type;
    private String author;
    private String publisher;
    private String path;
    private String content;
    private File accessory;

    private String messageid;
    private String picturemessageid;
    private String pagenumber;

    private int currentPage;//当前页码数
    private int pageSize;//每页显示数据量
    private int totalCount;//信息总数
    private int totalPage;//页面总数
    private MessageService messageService;
    private PictureNewsService pictureNewsService;

    public String getTopic() {
        return topic;
    }

    public void setTopic(String topic) {
        this.topic = topic;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public File getAccessory() {
        return accessory;
    }

    public void setAccessory(File accessory) {
        this.accessory = accessory;
    }

    public String getMessageid() {
        return messageid;
    }

    public void setMessageid(String messageid) {
        this.messageid = messageid;
    }

    public String getPicturemessageid() {
        return picturemessageid;
    }

    public void setPicturemessageid(String picturemessageid) {
        this.picturemessageid = picturemessageid;
    }

    public String getPagenumber() {
        return pagenumber;
    }

    public void setPagenumber(String pagenumber) {
        this.pagenumber = pagenumber;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public PictureNewsService getPictureNewsService() {
        return pictureNewsService;
    }

    public void setPictureNewsService(PictureNewsService pictureNewsService) {
        this.pictureNewsService = pictureNewsService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        Message message=new Message();
        message.setTopic(((Message) request.getAttribute("message")).getTopic());
        message.setType(((Message) request.getAttribute("message")).getType());
        message.setAuthor(((Message) request.getAttribute("message")).getAuthor());
        message.setPublisher(((Message) request.getAttribute("message")).getPublisher());
        message.setContent(((Message) request.getAttribute("message")).getContent());
        message.setPublishtime(new Timestamp(new Date().getTime()));
        message.setFilepath(((Message) request.getAttribute("message")).getFilepath());
        messageService.saveMessage(message);
        return SUCCESS;
    }

    public String addpicture() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        PictureNews message=new PictureNews();
        message.setTopic(((PictureNews) request.getAttribute("picturenews")).getTopic());
        message.setType(((PictureNews) request.getAttribute("picturenews")).getType());
        message.setAuthor(((PictureNews) request.getAttribute("picturenews")).getAuthor());
        message.setPublisher(((PictureNews) request.getAttribute("picturenews")).getPublisher());
        message.setPath(((PictureNews) request.getAttribute("picturenews")).getPath());
        message.setContent(((PictureNews) request.getAttribute("picturenews")).getContent());
        message.setPublishtime(new Timestamp(new Date().getTime()));
        pictureNewsService.savePictureNews(message);
        return SUCCESS;
    }
    public String getallmessages() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = messageService.getAllMessages();
        request.setAttribute("messages", list);

        return "acquireall";
    }
    public String getallpicturemessages() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = pictureNewsService.getAllPictureMessages();
        request.setAttribute("picturemessages", list);

        return "acquireallpicture";
    }

    public String getsomemessages()throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        String pageString=request.getParameter("pagenumber");
        if(pageString==null||pageString.length()==0){
            pageString="1";
        }
        currentPage=0;
        try{
            currentPage=Integer.parseInt(pageString);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(currentPage==0){
            currentPage=1;
        }
        pageSize=6;
        List list=messageService.getMessage( pageSize,currentPage);
        totalPage=messageService.getMessageTotalPage(pageSize);

        request.setAttribute("somemessages",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresomemessage";
    }
    public String getsomepicturemessages()throws Exception{
        HttpServletRequest request=ServletActionContext.getRequest();
        String pageString=request.getParameter("pagenumber");
        if(pageString==null||pageString.length()==0){
            pageString="1";
        }
        currentPage=0;
        try{
            currentPage=Integer.parseInt(pageString);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(currentPage==0){
            currentPage=1;
        }
        pageSize=6;
        List list=pictureNewsService.getPictureMessage( pageSize,currentPage);
        totalPage=pictureNewsService.getPictureMessageTotalPage(pageSize);
        request.setAttribute("somepicturemessages",list);
        request.setAttribute("totalpage",totalPage);
        request.setAttribute("currentpage",currentPage);
        return "acquiresomepicturemessage";
    }

    public String getOneMessage() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(messageid);
        Message message = messageService.getOneMessageByID(id);
        request.setAttribute("onemessage", message);

        return "acquireonemessage";
    }
    public String getOnePictureMessage() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(picturemessageid);
        PictureNews message = pictureNewsService.getOnePictureMessageByID(id);
        request.setAttribute("onepicturemessage", message);

        return "acquireonepicturemessage";
    }

    public String deleteOneMessage() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(messageid);
        messageService.deleteMessageById(id);
        return "successdelete";
    }

    public String deleteOnePictureMessage() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(picturemessageid);
        pictureNewsService.deletePictureNews(id);
         return "successdelete";
    }

}
