package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Activity;
import pojo.SiteUser;
import service.ActivityService;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/28/12
 * Time: 7:15 PM
 */
public class GetUserAllActivitiesAction extends ActionSupport {
    private String uid;
    private SiteUserService siteUserService;
    private ActivityService activityService;

    public ActivityService getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        List<Activity> activities = activityService.getAllActivitiesByUID(Integer.parseInt(uid));
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("useractivities", activities);
        return SUCCESS;
    }
}
