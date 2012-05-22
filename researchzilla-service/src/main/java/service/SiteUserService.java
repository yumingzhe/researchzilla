package service;

import pojo.SiteUser;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 8:15 PM
 */
public interface SiteUserService {
    public SiteUser getSiteUserByEmail(String email);

    public SiteUser getSiteUserByInstituteId(String instituteId);

    public SiteUser getSiteUserByUID(int uid);

    public void updateSiteUser(SiteUser siteUser);

    public Serializable saveSiteUser(SiteUser siteUser);
}

