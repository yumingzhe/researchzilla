package dao;

import pojo.SiteUser;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 10:33 AM
 */


public interface SiteUserDao {
    public SiteUser getSiteUserByInstituteId(String instituteId);

}