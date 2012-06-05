package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Group;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 3:23 PM
 */
public class GetUserAllGroupsAction extends ActionSupport {
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
        HttpServletRequest request = ServletActionContext.getRequest();
        Set<Group> groups = siteUserService.getSiteUserByUID(Integer.parseInt(uid)).getGroups();
        request.setAttribute("groups", groups);
        return SUCCESS;
    }
}

