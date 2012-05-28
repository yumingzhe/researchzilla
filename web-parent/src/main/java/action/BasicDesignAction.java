package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;

/**
 * User: wangayn
 * Date: 12-5-28
 * Time: 上午11:11
 */
public class BasicDesignAction extends ActionSupport {
    private String websitename;
    private File backgroundimage;
    private String maintenanceaddress;
    private String defaultlanguage;

    private WebsiteMessageService websiteMessageService;

    public String getWebsitename() {
        return websitename;
    }

    public void setWebsitename(String websitename) {
        this.websitename = websitename;
    }

    public File getBackgroundimage() {
        return backgroundimage;
    }

    public void setBackgroundimage(File backgroundimage) {
        this.backgroundimage = backgroundimage;
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
        HttpSession session = request.getSession();

        WebsiteMessage websiteMessage=new WebsiteMessage();
        websiteMessage.setWebsitename(websitename);
        websiteMessage.setBackground(backgroundimage);
        websiteMessage.setMaintenanceaddress(maintenanceaddress);
        websiteMessage.setDefaultlanguage(defaultlanguage);
        websiteMessageService.updateWebsiteMessage(websiteMessage);
        session.setAttribute("websitemessage",websiteMessage);

        return SUCCESS;
    }

    public String getOldWebsiteMessage() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        WebsiteMessage websiteMessage=websiteMessageService.getWebsiteMessage();
        session.setAttribute("websitemessage",websiteMessage);

        return "acquirewebsitemessage";
    }
}
