package dao.impl;

import dao.LetterEntityDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.LetterEntity;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 2:59 PM
 */
public class LetterEntityDaoImpl implements LetterEntityDao {
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

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public Serializable saveLetterEntity(LetterEntity letterEntity) {
        return this.getTemplate().save(letterEntity);
    }

    @Override
    public int getUnreadLetterNumberByUID(final int uid) {
        List result = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from SiteLetter as s where s.receiverId= :uid and s.read= :readstatus")
                        .setInteger("uid", uid).setBoolean("readstatus", false);
                return query.list();
            }
        });
        return result.size();
    }
}
