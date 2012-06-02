package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: wangyan
 * Date: 12-6-1
 * Time: 下午7:57
 */
public class GetWebsiteBackgroundAction  extends ActionSupport{
    private WebsiteMessageService websiteMessageService;

    public WebsiteMessageService getWebsiteMessageService() {
        return websiteMessageService;
    }

    public void setWebsiteMessageService(WebsiteMessageService websiteMessageService) {
        this.websiteMessageService = websiteMessageService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        WebsiteMessage websiteMessage=websiteMessageService.getWebsiteMessage();

        String imagepath=websiteMessage.getPath();
        session.setAttribute("imagepath",imagepath);

        return SUCCESS;
    }

}
