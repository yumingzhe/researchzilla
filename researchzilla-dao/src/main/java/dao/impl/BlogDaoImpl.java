package dao.impl;

import dao.BlogDao;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Blog;

import java.io.Serializable;

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
}
