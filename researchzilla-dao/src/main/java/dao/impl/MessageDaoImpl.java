package dao.impl;

import dao.MessageDao;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Message;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:08
 */
public class MessageDaoImpl implements MessageDao {
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
    public Serializable saveMessage(Message message) {
        return this.getTemplate().save(message);
    }

    @Override
    public void updateMessage(Message message) {
        this.getTemplate().saveOrUpdate(message);
    }

    @Override
    public void deleteMessageById(final int id) {
        List messages =  this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.id= :id").setInteger("id", id);
                return query.list();
            }
        });
        Message message= (Message) messages.get(0);
        this.getTemplate().delete(message);
    }

    @Override
    public List<Message> getAllInternalNotice() {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","internalnotice");
                return query.list();
            }
        });
        return notices;
    }

    //获取信息总数
    public int getInternalNoticeTotalCount(){
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from Message as m where m.type= :type").setString("type", "internalnotice");
                return query.list();
            }
        });
        return messages.size();
    }
    //获取总页数
    public int getInternalNoticeTotalPage(int pageSize){
       int totalCount=this.getInternalNoticeTotalCount();
       int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public int getPublicNoticeTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from Message as m where m.type= :type").setString("type", "publicnotice");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getPublicNoticeTotalPage(int pageSize) {
        int totalCount=this.getPublicNoticeTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public int getNewsTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from Message as m where m.type= :type").setString("type", "news");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getNewsTotalPage(int pageSize) {
        int totalCount=this.getNewsTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public List<Message> getInternalNotice(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","internalnotice");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getPublicNotice(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","publicnotice");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getNews(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","news");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getAllPublicNotice() {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","publicnotice");
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getAllNews() {
        List announcements = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type").setString("type","news");
                return query.list();
            }
        });
        return announcements;
    }

    @Override
    public List<Message> getSomeInternalNotice() {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type order by id desc").setString("type","internalnotice");
                query.setMaxResults(5);
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getSomePublicNotice() {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type order by id desc").setString("type","publicnotice");
                query.setMaxResults(5);
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public List<Message> getSomeNews() {
        List announcements = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type order by id desc ").setString("type","news");
                query.setMaxResults(5);
                return query.list();
            }
        });
        return announcements;
    }

    @Override
    public Message getOneInternalNoticeByID(final int id) {
        List internalnotices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type and m.id= :id");
                query.setString("type","internalnotice");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(internalnotices==null)
            return  null;
        Message internalnotice= (Message) internalnotices.get(0);
        return internalnotice;
    }

    @Override
    public Message getOnePublicNoticeByID(final int id) {
        List publicnotices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type and m.id= :id");
                query.setString("type","publicnotice");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(publicnotices==null)
            return  null;
        Message publicnotice= (Message) publicnotices.get(0);
        return publicnotice;
    }

    @Override
    public Message getOneNewsByID(final int id) {
        List newses = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where m.type= :type and m.id= :id");
                query.setString("type","news");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(newses==null)
            return  null;
        Message news= (Message) newses.get(0);
        return news;
    }

    @Override
    public List<Message> getAllMessages() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message ");
                return query.list();
            }
        });
        return messages;
    }

    @Override
    public int getMessageTotalCount() {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery(" from Message ");
                return query.list();
            }
        });
        return messages.size();
    }

    @Override
    public int getMessageTotalPage(int pageSize) {
        int totalCount=this.getMessageTotalCount();
        int totalPage=((totalCount+pageSize)-1)/pageSize;
        return totalPage;
    }

    @Override
    public List<Message> getMessage(final int pageSize, final int currentPage) {
        List notices = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message");
                query.setMaxResults(pageSize);
                query.setFirstResult(pageSize*(currentPage-1));
                return query.list();
            }
        });
        return notices;
    }

    @Override
    public Message getOneMessageByID(final int id) {
        List messages = this.getTemplate().executeFind(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException, SQLException {
                Query query = session.createQuery("from Message as m where  m.id= :id");
                query.setInteger("id",id);
                return query.list();
            }
        });
        if(messages==null)
            return  null;
        Message message= (Message) messages.get(0);
        return message;
    }
}
