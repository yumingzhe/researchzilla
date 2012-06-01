package service.impl;

import dao.SiteUserDao;
import pojo.SiteUser;
import service.SiteUserService;

import java.io.Serializable;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 8:16 PM
 */
public class SiteUserServiceImpl implements SiteUserService {
    private SiteUserDao siteUserDao;

    public SiteUserDao getSiteUserDao() {
        return siteUserDao;
    }

    public void setSiteUserDao(SiteUserDao siteUserDao) {
        this.siteUserDao = siteUserDao;
    }

    @Override
    public SiteUser getSiteUserByEmail(String email) {
        return siteUserDao.getSiteUserByEmail(email);
    }

    @Override
    public SiteUser getSiteUserByInstituteId(String instituteId) {
        return siteUserDao.getSiteUserByInstituteId(instituteId);
    }

    @Override
    public SiteUser getSiteUserByUID(int uid) {
        return siteUserDao.getSiteUserByUID(uid);
    }

    @Override
    public void updateSiteUser(SiteUser siteUser) {
        siteUserDao.updateSiteUser(siteUser);
    }

    @Override
    public Serializable saveSiteUser(SiteUser siteUser) {
        return siteUserDao.saveSiteUser(siteUser);
    }

    @Override
    public List<SiteUser> getAllSiteUser() {
        return siteUserDao.getAllSiteUser();
    }

    @Override
    public void deleteSiteUserById(int uid) {
        siteUserDao.deleteSiteUserById(uid);
    }
}
