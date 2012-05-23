package dao.impl;

import dao.PictureNewsDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.PictureNews;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:46
 */
public class PictureNewsDaoImpl implements PictureNewsDao {
    private HibernateTemplate template;
    private SessionFactory factory;

    public HibernateTemplate getTemplate() {
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
    public Serializable savePictureNews(PictureNews pictureNews) {
        return this.getTemplate().save(pictureNews);
    }

    @Override
    public void updatePictureNews(PictureNews pictureNews) {
        this.getTemplate().saveOrUpdate(pictureNews);
    }

    @Override
    public void deletePictureNewsById(final int id) {
        List picturenews =  this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        this.getTemplate().delete(picturenews);
    }

    @Override
    public List<PictureNews> getAllMessage() {
        List picturenewses = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews ");
                return query.list();
            }
        });
        return picturenewses;
    }
}
