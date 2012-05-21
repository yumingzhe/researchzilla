package dao;

import pojo.SiteUser;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 10:33 AM
 */


public interface SiteUserDao {
    public SiteUser getSiteUserByInstituteId(String instituteId);

    public SiteUser getSiteUserByEmail(String email);

    public Serializable saveSiteUser(SiteUser siteUser);

}
