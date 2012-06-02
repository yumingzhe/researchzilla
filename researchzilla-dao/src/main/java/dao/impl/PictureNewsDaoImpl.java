package dao.impl;

import dao.PictureNewsDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Message;
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
        PictureNews pictureNews= (PictureNews) picturenews.get(0);
        this.getTemplate().delete(pictureNews);
    }

    @Override
    public int getPictureNewsTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from PictureNews as p where p.type= :type").setString("type", "picturenews");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getPictureNewsTotalPage(int pageSize) {
        int totalCount=this.getPictureNewsTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public int getAccomplishmentTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from PictureNews as p where p.type= :type").setString("type", "accomplishment");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getAccomplishmentTotalPage(int pageSize) {
        int totalCount=this.getAccomplishmentTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public List<PictureNews> getPictureNews(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type= :type").setString("type","picturenews");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<PictureNews> getAccomplishment(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type= :type").setString("type","accomplishment");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<PictureNews> getAllPictureNews() {
        List picturenewses = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type= :type ").setString("type","picturenews");
                return query.list();
            }
        });
        return picturenewses;
    }

    @Override
    public PictureNews getOnePictureNewsByID(final int id) {
        List picturenewses = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as m where m.type= :type and m.id= :id");
                query.setString("type","picturenews");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(picturenewses==null)
            return  null;
        PictureNews picturenews= (PictureNews) picturenewses.get(0);
        return picturenews;
    }

    @Override
    public List<PictureNews> getAllAccomplishment() {
        List accomplishments = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type= :type ").setString("type","accomplishment");
                return query.list();
            }
        });
        return accomplishments;
    }

    @Override
    public PictureNews getOneAccomplishmentByID(final int id) {
        List accomplishments = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as m where m.type= :type and m.id= :id");
                query.setString("type","accomplishment");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(accomplishments==null)
            return  null;
        PictureNews accomplishment= (PictureNews) accomplishments.get(0);
        return accomplishment;
    }
    public List<PictureNews> getAllPictureMessages() {
        List picturemessages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews ");
                return query.list();
            }
        });
        return picturemessages;
    }

    @Override
    public int getPictureMessageTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from PictureNews");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getPictureMessageTotalPage(int pageSize) {
        int totalCount=this.getPictureMessageTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public List<PictureNews> getPictureMessage(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public PictureNews getOnePictureMessageByID(final int id) {
        List picturemessages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as m where m.id= :id");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(picturemessages==null)
            return  null;
        PictureNews picturemessage= (PictureNews) picturemessages.get(0);
        return picturemessage;
    }

    @Override
    public List<PictureNews> getThreePicture() {
        List pictures = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type=:type order by id desc ").setString("type","picturenews");
                query.setMaxResults(3);
                return query.list();
            }
        });
        return pictures;
    }

    @Override
    public List<PictureNews> getFiveAccomplishment() {
        List pictures = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from PictureNews as p where p.type=:type order by id desc ").setString("type","accomplishment");
                query.setMaxResults(5);
                return query.list();
            }
        });
        return pictures;
    }

}
