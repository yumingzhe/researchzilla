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
 * Time: 下午4:13
 */
public class GetInternalNoticeAction extends ActionSupport {
    private String internalnoticeid;
    private MessageService messageService;

    public String getInternalnoticeid() {
        return internalnoticeid;
    }

    public void setInternalnoticeid(String internalnoticeid) {
        this.internalnoticeid = internalnoticeid;
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

        List list = messageService.getSomeInternalNotice();
        session.setAttribute("internalnotices", list);

        return SUCCESS;
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        List list = messageService.getAllInternalNotice();
        request.setAttribute("allinternalnotices", list);
        return "aquireall";
    }

    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        int id=Integer.parseInt(internalnoticeid);
        Message internalnotice = messageService.getOneInternalNoticeByID(id);
        request.setAttribute("oneinternalnotice", internalnotice);
        return "aquireone";
    }
}
