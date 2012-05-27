package dao.impl;

import dao.FileDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;

import java.io.File;
import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 4:31 PM
 */
public class FileDaoImpl implements FileDao {
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
    public Serializable saveFile(pojo.File file) {
        return this.getTemplate().save(file);
    }

    @Override
    public pojo.File getFileById(final int id) {
        List<pojo.File> files = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from File as f where f.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        return files.get(0);
    }
}
