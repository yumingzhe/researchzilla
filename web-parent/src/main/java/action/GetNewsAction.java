package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Message;
import service.MessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**.
 * User: wangyan
 * Date: 12-5-24
 * Time: 下午9:45
 */
public class GetNewsAction extends ActionSupport {
    private String newsid;
    private MessageService messageService;

    public String getNewsid() {
        return newsid;
    }

    public void setNewsid(String newsid) {
        this.newsid = newsid;
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

        List list=messageService.getSomeNews();
        session.setAttribute("news",list);

        return SUCCESS;
    }

    public String getAllResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = messageService.getAllNews();
        request.setAttribute("allnewses", list);
        return "acquireall";
    }

    public String getOneResult() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(newsid);
        Message news= messageService.getOneNewsByID(id);
        request.setAttribute("onenews", news);
        return "acquireone";
    }
}
