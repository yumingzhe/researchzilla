package action;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.IINC;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.SiteUserService;
import util.MD5Util;

/**
 * User: yumingzhe
 * Date: 6/2/12
 * Time: 7:58 PM
 */
public class UpdateAccountSettingAction extends ActionSupport {
    private String uid;
    private String oldpasswd;
    private String newpasswd;
    private String confirmpasswd;
    private String email;
    private SiteUserService siteUserService;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getOldpasswd() {
        return oldpasswd;
    }

    public void setOldpasswd(String oldpasswd) {
        this.oldpasswd = oldpasswd;
    }

    public String getNewpasswd() {
        return newpasswd;
    }

    public void setNewpasswd(String newpasswd) {
        this.newpasswd = newpasswd;
    }

    public String getConfirmpasswd() {
        return confirmpasswd;
    }

    public void setConfirmpasswd(String confirmpasswd) {
        this.confirmpasswd = confirmpasswd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    @Override
    public void validate() {
        if (this.oldpasswd == null || this.oldpasswd.equals(""))
            this.addFieldError("oldpasswd", "You must input old password");
        if (this.newpasswd == null || this.newpasswd.equals(""))
            this.addFieldError("newpasswd", "You must enter new password");
        if (this.confirmpasswd == null || this.confirmpasswd.equals(""))
            this.addFieldError("confirmpasswd", "Your confirm password is not same with new password");
        if (!this.confirmpasswd.equals(this.newpasswd))
            this.addFieldError("confirmpasswd", "The two new password is not same");
        if (this.email == null || this.email.equals(""))
            this.addFieldError("email", "You must enter email");
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = (SiteUser) siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        /*if (!MD5Util.hashString(this.newpasswd + siteUser.getSalt()).equals(siteUser.getPassword()))
            return INPUT;*/
        String pwd = this.newpasswd;
        if (!(this.oldpasswd).equals(siteUser.getPassword()))
            return INPUT;
        System.out.println(this.newpasswd + " " + siteUser.getPassword());
        siteUser.setEmail(this.email);
        siteUser.setPassword(this.newpasswd);
        siteUserService.updateSiteUser(siteUser);
        return SUCCESS;
    }
}
