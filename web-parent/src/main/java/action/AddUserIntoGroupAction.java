package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Group;
import pojo.SiteUser;
import service.GroupService;
import service.SiteUserService;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 7:15 PM
 */
public class AddUserIntoGroupAction extends ActionSupport {
    private String uid;
    private String groupid;
    private SiteUserService siteUserService;
    private GroupService groupService;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public GroupService getGroupService() {
        return groupService;
    }

    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        Group group = groupService.getSpecifiedGroupByGroupId(Integer.parseInt(groupid));
        group.getMembers().add(siteUser);
        siteUser.setGroup(group);
        siteUserService.updateSiteUser(siteUser);
        return SUCCESS;
    }
}
