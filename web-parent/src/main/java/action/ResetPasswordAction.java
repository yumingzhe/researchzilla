package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.mail.Email;
import pojo.Register;
import pojo.SiteUser;
import service.RegisterService;
import service.SiteUserService;
import sun.security.provider.MD5;
import util.EmailUtil;
import util.MD5Util;

/**
 * User: yumingzhe
 * Date: 5/23/12
 * Time: 10:50 AM
 */
public class ResetPasswordAction extends ActionSupport {
    private String uid;
    private String secret;
    private RegisterService registerService;
    private SiteUserService siteUserService;

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public RegisterService getRegisterService() {
        return registerService;
    }

    public void setRegisterService(RegisterService registerService) {
        this.registerService = registerService;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    @Override
    public void validate() {
        if (this.uid == null) {
            this.addActionError("Your email validation link is invalid");
        }
        if (this.secret == null) {
            this.addActionError("Your email validation link is invalid");
        }
    }

    @Override
    public String execute() throws Exception {
        Register register = registerService.getRegisterBySequence(this.secret);
        if (register.getSiteUser().getUid() == Integer.parseInt(this.uid)) {
            SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(this.uid));
            String newpassword = MD5Util.generateArbitraryString(8);
            siteUser.setPassword(MD5Util.hashString(newpassword + siteUser.getSalt()));
            siteUserService.saveSiteUser(siteUser);
//            EmailUtil.sendNewPasswordEmail();
            return SUCCESS;
        }
        return ERROR;
    }
}
