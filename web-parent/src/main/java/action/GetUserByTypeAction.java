package action;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.json.annotations.JSON;
import pojo.SiteUser;
import service.SiteUserService;

import java.io.InputStream;
import java.io.StringBufferInputStream;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/15/12
 * Time: 11:06 AM
 */
public class GetUserByTypeAction extends ActionSupport {
    private String type;
    private SiteUserService siteUserService;
    private InputStream inputStream;
    private List<SiteUser> siteUsers;
    private String result;


    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    @JSON(name = "result")
    public List<SiteUser> getSiteUsers() {
        return siteUsers;
    }

    public void setSiteUsers(List<SiteUser> siteUsers) {
        this.siteUsers = siteUserService.getSiteUserByType(this.type);
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    /* public InputStream getStream() {
        siteUsers = siteUserService.getSiteUserByType(this.type);
        Gson gson = new Gson();
        this.inputStream = new StringBufferInputStream(gson.toJson(siteUsers));
        System.out.println(inputStream);
        System.out.println(inputStream == null);
        return inputStream;
    }*/

    @Override
    public String execute() throws Exception {
        siteUsers = siteUserService.getSiteUserByType(this.type);
        System.out.println("==================================================");
        return "result";
    }
}
