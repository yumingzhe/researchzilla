package dao.impl;

import dao.WebsiteMessageDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.WebsiteMessage;

import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:43
 */
public class WebsiteMessageDaoImpl implements WebsiteMessageDao {
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
    public void updateWebsiteMessage(WebsiteMessage websiteMessage) {
        this.getTemplate().saveOrUpdate(websiteMessage);
    }

    @Override
    public void updateWebsiteVisits(WebsiteMessage websiteMessage) {
        this.getTemplate().saveOrUpdate(websiteMessage);
    }

    @Override
    public WebsiteMessage getWebsiteMessage() {
        List websitemessage = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from WebsiteMessage");
                return query.list();
            }
        });
        if (websitemessage.size() == 0)
            return null;
        return (WebsiteMessage) websitemessage.get(0);
    }
}
