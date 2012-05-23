package dao.impl;

import dao.MessageDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Message;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:08
 */
public class MessageDaoImpl implements MessageDao {
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
    public Serializable saveMessage(Message message) {
        return this.getTemplate().save(message);
    }

    @Override
    public void updateMessage(Message message) {
        this.getTemplate().saveOrUpdate(message);
    }

    @Override
    public void deleteMessageById(final int id) {
        List message =  this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        this.getTemplate().delete(message);
    }

    @Override
    public List<Message> getAllMessage() {
        List mesages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message ");
                return query.list();
            }
        });
        return mesages;
    }
}
