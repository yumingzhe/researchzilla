package dao;

import pojo.Activity;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 3:23 PM
 */
public interface ActivityDao {
    public Serializable saveActivity(Activity activity);

    public List<Activity> getAllActivitiesByUID(int uid);

    public void executeSQL(String sql);
}
