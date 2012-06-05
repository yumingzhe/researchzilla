package service.impl;

import dao.GroupDao;
import pojo.Group;
import service.GroupService;

import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/4/12
 * Time: 5:11 PM
 */
public class GroupServiceImpl implements GroupService {
    private GroupDao groupDao;

    public GroupDao getGroupDao() {
        return groupDao;
    }

    public void setGroupDao(GroupDao groupDao) {
        this.groupDao = groupDao;
    }

    @Override
    public List getUserAllGroups(int uid) {
        return this.groupDao.getUserAllGroup(uid);
    }

    @Override
    public Group getSpecifiedGroupByGroupId(int groupid) {
        return this.groupDao.getSpecifiedGroupByGroupId(groupid);
    }
}
