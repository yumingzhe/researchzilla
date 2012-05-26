package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 12-5-25
 * Time: 下午8:53
 * To change this template use File | Settings | File Templates.
 */
public class GetAllInternalNoticeAction extends ActionSupport {
    private MessageService messageService;

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        List list=messageService.getAllInternalNotice();
        session.setAttribute("allinternalnotices",list);


        return SUCCESS;
    }
}
