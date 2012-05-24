package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.SiteUserService;
import util.MD5Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 * User: wangyan
 * Date: 5/19/12
 * Time: 10:08 AM.
 */
public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private SiteUserService siteUserService;

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

    public void validate() {
        if (this.username == null)
            this.addFieldError(username, "you must enter username");
        if (this.password == null)
            this.addFieldError(password, "you must set a password");
    }

    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession actionSession = request.getSession();

        SiteUser userone = siteUserService.getSiteUserByInstituteId(this.username);
        SiteUser usertwo = siteUserService.getSiteUserByEmail(this.username);
        if (userone != null) {
            Boolean active = userone.getActive();
            if (active == false) {
                Boolean banned = userone.getBanned();
                if (banned == false) {
                    String passwordstring = MD5Util.hashString(this.password + userone.getSalt());
                    System.out.println(passwordstring);
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
