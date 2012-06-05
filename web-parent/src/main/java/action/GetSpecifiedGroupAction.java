package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Group;
import service.GroupService;

import javax.servlet.http.HttpServletRequest;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 5:06 PM
 */
public class GetSpecifiedGroupAction extends ActionSupport {
    private String groupid;
    private GroupService groupService;

    public GroupService getGroupService() {
        return groupService;
    }

    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    public String getGroupid() {
        return groupid;
    }

    public void setGroupid(String groupid) {
        this.groupid = groupid;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        Group group = groupService.getSpecifiedGroupByGroupId(Integer.parseInt(groupid));
        request.setAttribute("specifiedgroup", group);
        return SUCCESS;
    }
}
