package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-30
 * Time: 上午9:11
 */
public class UserAction extends ActionSupport {
    private String uid;
    private SiteUserService siteUserService;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    public String getallusers() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        List list = siteUserService.getAllSiteUser();
        request.setAttribute("siteusers", list);

        return "acquireall";
    }
    public String getoneuser() throws Exception{
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setCharacterEncoding("utf-8");
        int id=Integer.parseInt(uid);
        SiteUser siteUser = siteUserService.getSiteUserByUID(id);
        request.setAttribute("onesiteuser", siteUser);

        return "acquireone";
    }
    public String deleteoneuser() throws Exception{

        int id=Integer.parseInt(uid);
        siteUserService.deleteSiteUserById(id);

        return "deleteone";
    }

}
