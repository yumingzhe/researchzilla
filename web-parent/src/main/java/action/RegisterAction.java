package action;

import com.opensymphony.xwork2.ActionSupport;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:11 PM
 */
public class RegisterAction extends ActionSupport {
    private String username;
    private String password;
    private String email;
    private String instituteId;
    private String recaptcha_challenge_field;
    private String recaptcha_response_field;

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

        if (!this.email.contains("@"))
            this.addFieldError(email, "Invalid email formatl");
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
