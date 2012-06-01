package dao.impl;

import dao.BlogDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Blog;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 11:26 AM
 */
public class BlogDaoImpl implements BlogDao {
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
    public Serializable saveBlog(Blog blog) {
        return this.getTemplate().save(blog);
    }

    @Override
    public Blog getBlogById(final int id) {
        return (Blog) this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Blog as b where b.id= :id").setInteger("id", id);
                return query.list();
            }
        }).get(0);
    }

    @Override
    public List getAllBlogsByUID(final int uid) {
        return this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Blog as b where b.siteUser.id= :uid").setInteger("uid", uid);
                return query.list();
            }
        });
    }

    @Override
    public void updateBlog(Blog blog) {
        this.getTemplate().update(blog);
    }

    @Override
    public void deleteBlogById(final int id) {
        this.getTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Blog blog = (Blog) session.get(Blog.class, id);
                session.delete(blog);
                return null;
            }
        });
    }
}
