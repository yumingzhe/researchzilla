package dao.impl;

import dao.SiteUserDao;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.SiteUser;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:37 PM
 */
public class SiteUserDaoImpl implements SiteUserDao {
    private HibernateTemplate template;

    public HibernateTemplate getTemplate() {
        return template;
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    @Override
    public SiteUser getSiteUserByInstituteId(String instituteId) {

        return (SiteUser) template.find("from SiteUser where instituteId=" + instituteId).get(0);
    }
}
