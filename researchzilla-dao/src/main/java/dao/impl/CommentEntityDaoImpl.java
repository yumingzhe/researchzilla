package dao.impl;

import dao.CommentEntityDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.CommentEntity;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 8:57 PM
 */
public class CommentEntityDaoImpl implements CommentEntityDao {
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
    public Serializable saveCommentEntity(final CommentEntity commentEntity) {
        /*return this.getTemplate().save(commentEntity);*/
        return (Serializable) this.getTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                return session.save(commentEntity);
            }
        });
    }

    @Override
    public void deleteCommentEntityById(final int id) {
        CommentEntity commentEntity = this.getTemplate().get(CommentEntity.class, id);
        System.out.println(commentEntity.getContent());
        this.getTemplate().delete(commentEntity);
    }

    @Override
    public CommentEntity getCommentEntityById(final int id) {
        List list = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from CommentEntity as c where c.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        return (CommentEntity) list.get(0);
    }
}
