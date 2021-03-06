package dao;

import pojo.SiteUser;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 10:33 AM
 */


public interface SiteUserDao {
    public SiteUser getSiteUserByInstituteId(String instituteId);

    public SiteUser getSiteUserByEmail(String email);

    public Serializable saveSiteUser(SiteUser siteUser);

    public void updateSiteUser(SiteUser siteUser);

    public SiteUser getSiteUserByUID(int uid);

    public List<SiteUser> getAllSiteUser();

    public int getSiteUserTotalCount();

    public int getSiteUserTotalPage(int pageSize);

    public List<SiteUser> getSomeSiteUser(final int pageSize, final int currentPage);

    public List<SiteUser> getSiteUserByType(String type);

}
