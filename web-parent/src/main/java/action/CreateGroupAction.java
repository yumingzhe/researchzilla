package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Group;
import pojo.SiteUser;
import service.SiteUserService;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 4:08 PM
 */
public class CreateGroupAction extends ActionSupport {
    private String groupName;
    private String description;
    private String tag;
    private String access;
    private String uid;
    private SiteUserService siteUserService;

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

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        Group group = new Group();
        group.setGroupName(this.groupName);
        group.setTag(this.tag);
        group.setDescription(this.description);
        if (this.access.equals("1"))
            group.setAccess("关闭");
        if (this.access.equals("2"))
            group.setAccess("开放");
        group.setGroupOwner(siteUser);

        siteUser.getGroups().add(group);
        siteUserService.updateSiteUser(siteUser);
        return SUCCESS;
    }
}
