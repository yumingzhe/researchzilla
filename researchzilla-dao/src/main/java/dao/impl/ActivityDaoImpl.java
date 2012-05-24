package dao.impl;

import dao.ActivityDao;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Activity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 3:24 PM
 */
public class ActivityDaoImpl implements ActivityDao {
    private HibernateTemplate template;
    private SessionFactory factory;

    public HibernateTemplate getTemplate() {
        if (template == null) {
            template = new HibernateTemplate(this.factory);
        }
        return template;
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public Serializable saveActivity(Activity activity) {
        return this.getTemplate().save(activity);
    }
}
