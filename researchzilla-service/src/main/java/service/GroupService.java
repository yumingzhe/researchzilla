package service;

import pojo.Group;

import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 5:10 PM
 */
public interface GroupService {
    public List getUserAllGroups(int uid);

    public Group getSpecifiedGroupByGroupId(int groupid);
}
