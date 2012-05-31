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
        message.setTopic((String) request.getAttribute("topic"));
        message.setType((String) request.getAttribute("type"));
        message.setAuthor((String) request.getAttribute("author"));
        message.setPublisher((String) request.getAttribute("publisher"));
        message.setContent((String) request.getAttribute("content"));
        message.setPublishtime(new Timestamp(new Date().getTime()));
        message.setAccesory((File) request.getAttribute("accessory"));
        messageService.saveMessage(message);
        return SUCCESS;
    }

    public String addpicture() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        PictureNews message=new PictureNews();
        message.setTopic((String) request.getAttribute("topic"));
        message.setType((String) request.getAttribute("type"));
        message.setAuthor((String) request.getAttribute("author"));
        message.setPublisher((String) request.getAttribute("publisher"));
        message.setPath((String) request.getAttribute("path"));
        message.setContent((String) request.getAttribute("content"));
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
        List list = pictureNewsService.getAllPictureNews();
        request.setAttribute("picturemessages", list);

        return "acquireallpicture";
    }
}
