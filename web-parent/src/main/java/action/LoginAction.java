package action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import pojo.WebsiteMessage;
import service.SiteUserService;
import service.WebsiteMessageService;
import util.MD5Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * User: wangyan
 * Date: 5/19/12
 * Time: 10:08 AM.
 */
public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private SiteUserService siteUserService;
    private WebsiteMessageService websiteMessageService;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public WebsiteMessageService getWebsiteMessageService() {
        return websiteMessageService;
    }

    public void setWebsiteMessageService(WebsiteMessageService websiteMessageService) {
        this.websiteMessageService = websiteMessageService;
    }

    public void validate() {
       if (this.username == null)
            this.addFieldError(username, "you must set a username");
       if (this.password == null)
            this.addFieldError(password, "you must set a password");
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        WebsiteMessage  websiteMessage=websiteMessageService.getWebsiteMessage();
        ActionContext context = ActionContext.getContext();
        Map application = (Map) context.getApplication();

        int count=websiteMessage.getVisits();
        count=count+1;
        session.setAttribute("visits", count);
        websiteMessage.setVisits(count);
        websiteMessageService.updateWebsiteVisits(websiteMessage);

        SiteUser userone = siteUserService.getSiteUserByInstituteId(this.username);
        SiteUser usertwo = siteUserService.getSiteUserByEmail(this.username);
        if (userone != null) {
            Boolean active = userone.getActive();
            if (active == false) {
                Boolean banned = userone.getBanned();
                if (banned == false) {
                    String passwordstring = MD5Util.hashString(this.password + userone.getSalt());
                    if (this.username.equals(userone.getInstituteId()) && passwordstring.equals(userone.getPassword())) {
                        session.setAttribute("user", userone);
                        return SUCCESS;
                    }
                }
            }
        } else if (usertwo != null) {
            Boolean active = usertwo.getActive();
            if (active == false) {
                Boolean banned = usertwo.getBanned();
                if (banned == false) {
                    String passwordstring = MD5Util.hashString(this.password + usertwo.getSalt());
                    System.out.println(passwordstring);
                    if (this.username.equals(usertwo.getEmail()) && passwordstring.equals(usertwo.getPassword())) {
                        session.setAttribute("user", usertwo);
                        return SUCCESS;
                    }
                }
            }
        }
        this.addActionError("登录失败！");
        return INPUT;
    }
}
