package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Register;
import pojo.SiteUser;
import service.RegisterService;
import service.SiteUserService;
import util.EmailUtil;
import util.MD5Util;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

public class ForgetPasswordAction extends ActionSupport {
    private String email;

    private SiteUserService siteUserService;
    private RegisterService registerService;

    public RegisterService getRegisterService() {
        return registerService;
    }

    public void setRegisterService(RegisterService registerService) {
        this.registerService = registerService;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    @Override
    public void validate() {
        if (this.email == null) {
            this.addFieldError("email", "You must enter a valid email");
        } else if (!this.email.contains("@")) {
            this.addFieldError("email", "Your email is invalid, we can not send you reset password email");
        }
    }

    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByEmail(this.email);
        if (siteUser == null)
            return SUCCESS;
        if (!siteUser.getActive()) { //If user has not been activated, we don't allow reset password
            this.addActionError("Your account has not been activated, please activate it first");
            return INPUT;
        }
        if (siteUser.getBanned()) {
            this.addActionError("Your account has been banned, we will not reset your password");
            return INPUT;
        }

        Register register = new Register();
        register.setRegisterTime(new Timestamp(new Date().getTime()));
        String secret = MD5Util.generateArbitraryString(32);
        register.setRegisterSequence(secret);
        register.setUid(siteUser.getUid());
        Serializable id = registerService.saveRegister(register);

        EmailUtil.sendPasswordRestEmail("smtp.gmail.com", 465, "yumingzhe.pt@gmail.com", "YMZ7565092", siteUser.getUsername(), "researchzilla", "重置密码", this.email, id, secret);
        return SUCCESS;
    }
}
