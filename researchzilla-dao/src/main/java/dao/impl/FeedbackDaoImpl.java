package dao.impl;

import dao.FeedbackDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Feedback;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:30
 */
public class FeedbackDaoImpl implements FeedbackDao {
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
    public Serializable saveFeedback(Feedback feedback) {
        return this.getTemplate().save(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        List feedbacks = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Feedback ");
                return query.list();
            }
        });
        return feedbacks;
    }

    @Override
    public int getFeedbackTotalCount() {
        List feedbacks = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from Feedback");
                return query.list();
            }
        });
        return feedbacks.size();
    }

    @Override
    public int getFeedbackTotalPage(int pageSize) {
        int totalCount=this.getFeedbackTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public List<Feedback> getFeedback(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Feedback ");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public Feedback getOneFeedbackByID(final int id) {
        List feedbacks = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Feedback as f where  f.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        if(feedbacks==null)
            return  null;
        Feedback feedback= (Feedback) feedbacks.get(0);
        return feedback;
    }

    @Override
    public void deleteOneFeedbackByID(final int id) {
        List feedbacks = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Feedback as f where  f.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        Feedback feedback= (Feedback) feedbacks.get(0);
        this.getTemplate().delete(feedback);
    }
}
