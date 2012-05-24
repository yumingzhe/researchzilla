package dao;

import pojo.Activity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 3:23 PM
 */
public interface ActivityDao {
    public Serializable saveActivity(Activity activity);
}
