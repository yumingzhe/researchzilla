package action;

//import com.jspsmart.upload.*;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.PageContext;
import java.io.File;
import java.util.Calendar;

/**
 * User: wangyan
 * Date: 12-5-28
 * Time: 下午5:03
 */
public class BasicMessageChangeAction  extends ActionSupport{
    private String websitename;
    private File backgroundimage;
    private String backgroundimageFileName;
    private String backgroundimageContentType;
    private String path;
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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getBackgroundimageFileName() {
        return backgroundimageFileName;
    }

    public void setBackgroundimageFileName(String backgroundimageFileName) {
        this.backgroundimageFileName = backgroundimageFileName;
    }

    public String getBackgroundimageContentType() {
        return backgroundimageContentType;
    }

    public void setBackgroundimageContentType(String backgroundimageContentType) {
        this.backgroundimageContentType = backgroundimageContentType;
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
        request.setCharacterEncoding("utf-8");
        WebsiteMessage websiteMessage=websiteMessageService.getWebsiteMessage();
        request.setAttribute("websitemessage",websiteMessage);

        return SUCCESS;
    }

}
