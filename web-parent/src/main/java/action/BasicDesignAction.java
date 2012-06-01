package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * User: wangayn
 * Date: 12-5-28
 * Time: 上午11:11
 */
public class BasicDesignAction extends ActionSupport {
    private String websitename;
    private String maintenanceaddress;
    private String defaultlanguage;

    private WebsiteMessageService websiteMessageService;

    public BasicDesignAction() {
    }

    public String getWebsitename() {
        return websitename;
    }

    public void setWebsitename(String websitename) {
        this.websitename = websitename;
    }

    public String getMaintenanceaddress() {
        return maintenanceaddress;
    }

    public void setMaintenanceaddress(String maintenanceaddress) {
        this.maintenanceaddress = maintenanceaddress;
    }

    public String getDefaultlanguage() {
        return defaultlanguage;
    }

    public void setDefaultlanguage(String defaultlanguage) {
        this.defaultlanguage = defaultlanguage;
    }

    public WebsiteMessageService getWebsiteMessageService() {
        return websiteMessageService;
    }

    public void setWebsiteMessageService(WebsiteMessageService websiteMessageService) {
        this.websiteMessageService = websiteMessageService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("gb2312");
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=gb2312");
        WebsiteMessage websiteMessage=websiteMessageService.getWebsiteMessage();
        websiteMessage.setWebsitename(((WebsiteMessage)request.getAttribute("websitemess")).getWebsitename());
        System.out.println(((WebsiteMessage)request.getAttribute("websitemess")).getWebsitename());
        websiteMessage.setPath(((WebsiteMessage)request.getAttribute("websitemess")).getPath());
        websiteMessage.setMaintenanceaddress(((WebsiteMessage)request.getAttribute("websitemess")).getMaintenanceaddress());
        websiteMessage.setDefaultlanguage(((WebsiteMessage)request.getAttribute("websitemess")).getDefaultlanguage());
        websiteMessageService.updateWebsiteMessage(websiteMessage);

        request.setAttribute("websitemessage",websiteMessage);

        return SUCCESS;
    }

}
