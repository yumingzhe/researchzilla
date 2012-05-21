package service.impl;

import dao.SiteUserDao;
import pojo.SiteUser;
import service.SiteUserService;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 8:16 PM
 */
public class SiteUserServiceImpl implements SiteUserService {
    private SiteUserDao siteUserDao;


    @Override
    public SiteUser getSiteUserByEmail(String email) {
        return siteUserDao.getSiteUserByEmail(email);
    }

    @Override
    public SiteUser getSiteUserByInstituteId(String instituteId) {
        return siteUserDao.getSiteUserByInstituteId(instituteId);
    }

    @Override
    public void saveSiteUser(SiteUser siteUser) {
        siteUserDao.saveSiteUser(siteUser);
    }
}
