package dao;

import pojo.Group;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 9:14 PM
 */
public interface GroupDao {
    public Serializable createGroup();

    public List getUserAllGroup(int uid);

    public Group getSpecifiedGroupByGroupId(int groupid);
}
