package dao.impl;

import dao.LinkDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Link;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:18
 */
public class LinkDaoImpl implements LinkDao {
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
    public Serializable saveLink(Link link) {
        return this.getTemplate().save(link);
    }

    @Override
    public void updateLink(Link link) {
        this.getTemplate().saveOrUpdate(link);
    }

    @Override
    public void deleteLinkById(final int id) {
        List links =  this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Link as l where l.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        Link link= (Link) links.get(0);
        this.getTemplate().delete(link);
    }

    @Override
    public List<Link> getAllLink() {
        List links = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Link ");
                query.setMaxResults(5);
                return query.list();
            }
        });
        return links;
    }
}
