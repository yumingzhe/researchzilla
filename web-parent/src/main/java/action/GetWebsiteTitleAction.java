package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: wangyan
 * Date: 12-5-25
 * Time: 下午8:43
 */
public class GetWebsiteTitleAction extends ActionSupport{
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

        String websitename=websiteMessage.getWebsitename();

        session.setAttribute("websitename",websitename);

        return SUCCESS;
    }
}
