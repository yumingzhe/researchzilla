package pojo;

import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:02 PM
 */
public class Group {
    private Integer groupId;
    private String groupName;
    private String description;
    private String tag;
    private String access;
    private SiteUser groupOwner;
    private Set<SiteUser> members;

    public Set<SiteUser> getMembers() {
        return members;
    }

    public void setMembers(Set<SiteUser> members) {
        this.members = members;
    }

    public SiteUser getGroupOwner() {
        return groupOwner;
    }

    public void setGroupOwner(SiteUser groupOwner) {
        this.groupOwner = groupOwner;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
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
}
