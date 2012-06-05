package dao.impl;

import dao.SubjectDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Subject;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:04
 */
public class SubjectDaoImpl implements SubjectDao {
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
    public Serializable saveSubject(Subject subject) {
        return this.getTemplate().save(subject);
    }

    @Override
    public void updateSubject(Subject subject) {
        this.getTemplate().saveOrUpdate(subject);
    }

    @Override
    public void deleteSubjectById(final int id) {
        List subjects =  this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Subject as s where s.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        Subject subject= (Subject) subjects.get(0);
        this.getTemplate().delete(subject);
    }

    @Override
    public List<Subject> getAllSubject() {
        List subjects = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Subject");
                return query.list();
            }
        });
        return subjects;
    }
}
