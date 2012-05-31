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
            this.addFieldError(username, "you must enter username");
        if (this.password == null)
            this.addFieldError(password, "you must set a password");
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession actionSession = request.getSession();
        request.setCharacterEncoding("utf-8");
        ActionContext context = ActionContext.getContext();
        Map application = (Map) context.getApplication();


        WebsiteMessage websiteMessage=websiteMessageService.getWebsiteMessage();
        int count=websiteMessage.getVisits();
        System.out.println(application.get("count"));
        if(application.get("count")==null) {
            application.put("count", 1);
            count=1;
        }else{
            count=count+1;
            application.put("count", count);
        }
        System.out.println(count);
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
                        actionSession.setAttribute("user", userone);
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
                        actionSession.setAttribute("user", usertwo);
                        return SUCCESS;
                    }
                }
            }
        }
        this.addActionError("登录失败！");
        return INPUT;
    }
}
