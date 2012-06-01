package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Message;
import service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-24
 * Time: 下午5:36
 */
public class GetPublicNoticeAction extends ActionSupport {
    private String publicnoticeid;
    private MessageService messageService;

    public String getPublicnoticeid() {
        return publicnoticeid;
    }

    public void setPublicnoticeid(String publicnoticeid) {
        this.publicnoticeid = publicnoticeid;
    }

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        List list=messageService.getSomePublicNotice();
        session.setAttribute("publicnotices",list);

        return SUCCESS;
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = messageService.getAllPublicNotice();
        request.setAttribute("allpublicnotices", list);
        return "acquireall";
    }

    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(publicnoticeid);
        Message publicnotice = messageService.getOnePublicNoticeByID(id);
        request.setAttribute("onepublicnotice", publicnotice);
        return "acquireone";
    }
}
