package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
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
    private MessageService messageService;

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
        HttpSession session = request.getSession();
        List list = messageService.getAllInternalNotice();
        session.setAttribute("allinternalnotices", list);
        return "aquire";
    }

    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        List list = messageService.getAllInternalNotice();
        session.setAttribute("allinternalnotices", list);
        return "aquire";
    }
}
