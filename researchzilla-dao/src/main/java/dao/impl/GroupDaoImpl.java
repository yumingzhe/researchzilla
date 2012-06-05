package dao.impl;

import dao.GroupDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Group;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 9:18 PM
 */
public class GroupDaoImpl implements GroupDao {
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
    public Serializable createGroup() {
        return null;
    }

    @Override
    public List getUserAllGroup(int uid) {
        return null;
    }

    @Override
    public Group getSpecifiedGroupByGroupId(final int groupid) {
        List groups = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Group as g where g.id= :id").setInteger("id", groupid);
                return query.list();
            }
        });
        if (groups.size() > 0)
            return (Group) groups.get(0);
        return null;
    }
}
