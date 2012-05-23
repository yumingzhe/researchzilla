package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Register;
import pojo.SiteUser;
import service.RegisterService;
import service.SiteUserService;
import util.EmailUtil;
import util.MD5Util;

/**
 * User: yumingzhe
 * Date: 5/23/12
 * Time: 10:50 AM
 */
public class ResetPasswordAction extends ActionSupport {
    private String id;
    private String secret;
    private String instituteId;
    private RegisterService registerService;
    private SiteUserService siteUserService;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getInstituteId() {
        return instituteId;
    }

    public void setInstituteId(String instituteId) {
        this.instituteId = instituteId;
    }

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
        return id;
    }

    public void setUid(String uid) {
        this.id = uid;
    }

    public String getSecret() {
        return secret;
    }

    public void setSecret(String secret) {
        this.secret = secret;
    }

    @Override
    public void validate() {
        if (this.id == null) {
            this.addActionError("Your email validation link is invalid");
        }
        if (this.secret == null) {
            this.addActionError("Your email validation link is invalid");
        }
    }

    @Override
    public String execute() throws Exception {
        Register register = registerService.getRegisterBySequence(this.secret);
        if (register.getId() == Integer.parseInt(this.id)) {
            SiteUser siteUser = siteUserService.getSiteUserByInstituteId(this.instituteId);
            String newpassword = MD5Util.generateArbitraryString(8);
            siteUser.setPassword(MD5Util.hashString(newpassword + siteUser.getSalt()));
            siteUserService.updateSiteUser(siteUser);
            EmailUtil.sendNewPasswordEmail("smtp.gmail.com", 465, "yumingzhe.pt@gmail.com", "YMZ7565092", siteUser.getUsername(), newpassword, "admin@researchzilla", "新密码", siteUser.getEmail());
            this.addActionMessage("Your new account information has been sent to your email!");
            return SUCCESS;
        }
        return ERROR;
    }
}
