package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.mail.EmailException;
import org.apache.struts2.ServletActionContext;
import pojo.Register;
import pojo.SiteUser;
import service.SiteUserService;
import util.EmailUtil;
import util.MD5Util;
import util.captcha.reCaptcha.ValidatereCaptchaUtil;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:11 PM
 */
public class RegisterAction extends ActionSupport {
    private String username;
    private String password;
    private String repassword;
    private String email;
    private String instituteId;
    private String recaptcha_challenge_field;
    private String recaptcha_response_field;

    private SiteUserService siteUserService;

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getRepassword() {
        return repassword;
    }

    public void setRepassword(String repassword) {
        this.repassword = repassword;
    }

    public String getInstituteId() {
        return instituteId;
    }

    public void setInstituteId(String instituteId) {
        this.instituteId = instituteId;
    }

    public String getRecaptcha_challenge_field() {
        return recaptcha_challenge_field;
    }

    public void setRecaptcha_challenge_field(String recaptcha_challenge_field) {
        this.recaptcha_challenge_field = recaptcha_challenge_field;
    }

    public String getRecaptcha_response_field() {
        return recaptcha_response_field;
    }

    public void setRecaptcha_response_field(String recaptcha_response_field) {
        this.recaptcha_response_field = recaptcha_response_field;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

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

    @Override
    public void validate() {
        if (this.username == null)
            this.addFieldError(username, "you must enter username");
        if (this.password == null)
            this.addFieldError(password, "you must set a password");

        if (this.repassword == null)
            this.addFieldError(repassword, "you must input confirm password");

        if (this.password != null && this.repassword != null) {
            if (!this.password.equals(this.repassword))
                this.addFieldError(repassword, "confirm password is different from original password");
        }

        //TODO: determine whether the instituteId is consist of number(0~9) and length is 10


        if (!this.email.contains("@"))
            this.addFieldError(email, "Invalid email formatl");

        //validate reCaptcha
        /* if (!ValidatereCaptchaUtil.validateCaptcha(recaptcha_challenge_field, recaptcha_response_field, ServletActionContext.getRequest().getRemoteAddr()))
      this.addFieldError(recaptcha_challenge_field, "captcha invalid");*/
    }

    @Override
    public String execute() throws Exception {
        SiteUser user = siteUserService.getSiteUserByEmail(this.email);
        String secret = MD5Util.generateArbitraryString(32);
        if (user != null) {
            if (!user.getActive()) {//current user has not activated by email
                String registerEmailTTL = (String) ServletActionContext.getServletContext().getAttribute("registerEmailTTL");
                if (registerEmailTTL == null) //default register email must be validated in 24 hours
                    registerEmailTTL = "24";
                int ttl = Integer.parseInt(registerEmailTTL);
                //register email timeout
                if (user.getRegister().getRegisterTime().before(new Timestamp(new Date().getTime() - ttl * 1000 * 60 * 60))) {
                    String msg = "你好 " + "'" + username + "'" + ",\n" +
                            "\n" +
                            "你请求在researchzilla网站获取账号，并指定此邮箱地址 (" + this.email + ") 为你的联系地址。\n" +
                            "\n" +
                            "如果你没有发过该请求，请忽视本邮件。输入你邮箱地址者的IP地址为" + ServletActionContext.getRequest().getRemoteAddr() + "。请勿回复本邮件。\n" +
                            "\n" +
                            "如果你的确发过该请求，请点击以下链接来通过验证： \n" +
                            "http://localhost/confirm?uid=" + user.getUid() + "&secret=" + secret + "\n" +
                            "\n" +
                            "在通过验证后，你就可以使用新账号了。\n" +
                            "\n" +
                            "如果你在" + ttl + "小时内没有通过验证，你的账号将被删除。\n" +
                            "\n";
                    EmailUtil.sendEmail("smtp.gmail.com", 465, "yumingzhe.pt@gmail.com", "123456", "admin@researchzilla", "researchzilla 网站用户注册验证‏", msg, this.email);
                    return SUCCESS;
                }
                //user has registered, but has not activated his account
                return "resource";
            } else {
                this.addActionError("You have registered an account with this email");
                return INPUT;
            }
        }
        user = siteUserService.getSiteUserByInstituteId(this.instituteId);
        if (user != null) {
            this.addActionError("You have registered an account with this instituteId");
            return INPUT;
        }
        Boolean enableEmailActivate = (Boolean) ServletActionContext.getContext().getApplication().get("enableEmailActivate");
        if (enableEmailActivate == null)//by default, after registeration user must activate their account by email
            enableEmailActivate = true;

        SiteUser siteUser = new SiteUser();
        siteUser.setBanned(false);
        siteUser.setUsername(username);
        siteUser.setEmail(email);
        siteUser.setInstituteId(this.instituteId);
        String salt = MD5Util.generateArbitraryString(8);
        siteUser.setPassword(MD5Util.hashString(password + salt));
        siteUser.setSalt(salt);
        siteUser.setActive(false);
        if (enableEmailActivate) {
            Register register = new Register();
            register.setRegisterSequence(secret);
            register.setRegisterTime(new Timestamp(new Date().getTime()));
            siteUser.setRegister(register);
            register.setSiteUser(siteUser);
        }
        Serializable id = siteUserService.saveSiteUser(siteUser);
        try {
            EmailUtil.sendActivateEmailString("smtp.gmail.com", 465, "yumingzhe.pt@gmail.com", "YMZ7565092", username, "admin@researchzilla",
                    "researchzilla 网站用户注册验证", email, ServletActionContext.getRequest().getRemoteAddr(), id, secret, 24);
        } catch (EmailException e) {
            this.addActionError("Send activate email exception, please contact administrator to activate your account");
            return ERROR;
        }
        return SUCCESS;
    }
}
