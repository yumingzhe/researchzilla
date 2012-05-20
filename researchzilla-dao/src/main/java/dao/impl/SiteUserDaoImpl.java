package dao.impl;

import dao.SiteUserDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.SiteUser;

import java.sql.SQLException;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 11:37 PM
 */
public class SiteUserDaoImpl implements SiteUserDao {
    private HibernateTemplate template;
    private SessionFactory factory;

    public HibernateTemplate getTemplate() {
        if (template == null) {
            template = new HibernateTemplate(factory);
        }
        return template;
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    @Override
    public SiteUser getSiteUserByInstituteId(final String instituteId) {
        return (SiteUser) this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from SiteUser as s where s.instituteId= :instituteId").setString("instituteId", instituteId);
                return query.list();
            }
        }).get(0);
    }

    @Override
    public SiteUser getSiteUserByEmail(final String email) {
        return (SiteUser) this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from SiteUser as s where s.email= :email").setString("email", email);
                return query.list();
            }
        }).get(0);
    }
}
