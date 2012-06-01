package sql;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 4:15 PM
 */


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import pojo.Activity;
import pojo.Blog;
import pojo.CommentEntity;
import pojo.SiteUser;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;

/**
 * This class is used for inserting data
 */
public class InsertData {
    public static void main(String[] args) throws UnsupportedEncodingException {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        SiteUser siteUser = new SiteUser();
        siteUser.setUsername("yumingzhe");
        siteUser.setEmail("yumingzhe@live.cn");
        siteUser.setActive(true);
        siteUser.setBanned(false);
        siteUser.setInstituteId("123");
        siteUser.setPassword("lfjlinnnz");
        siteUser.setSalt("ljfinv");
        session.save(siteUser);

        /* SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        Blog blog = (Blog) session.get(Blog.class, 1);
        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setSiteUser(siteUser);
        commentEntity.setBlog(blog);
        commentEntity.setPostTime(new Timestamp(new Date().getTime()));
        commentEntity.setContent("the second comment");
        blog.getCommentEntities().add(commentEntity);

        Activity activity = new Activity();
        activity.setAction("发表了评论");
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setSiteUser(siteUser);
        activity.setCommentEntity(commentEntity);
        activity.setBlog(blog);

        siteUser.getActivities().add(activity);

        session.save(commentEntity);*/

        /* Blog blog = new Blog();
        blog.setTitle("first blog");
        blog.setContent("this is the first blog");
        blog.setDescription("first blog");
        blog.setAccess("public");
        blog.setTag("blog");
        blog.setPostDate(new Timestamp(new Date().getTime()));
        SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        blog.setSiteUser(siteUser);

        Activity activity = new Activity();
        activity.setAction("post blog");
        activity.setSiteUser(siteUser);
        activity.setBlog(blog);
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));

        blog.setActivity(activity);

        session.save(blog);*/


       /* SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        Blog blog = (Blog) session.get(Blog.class, 1);
        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setBlog(blog);
        commentEntity.setPostTime(new Timestamp(new Date().getTime()));
        commentEntity.setSiteUser(siteUser);
        commentEntity.setContent("third comment");

        Activity activity = new Activity();
        activity.setAction("post comment");
        activity.setSiteUser(siteUser);
        activity.setCommentEntity(commentEntity);
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));

        commentEntity.setActivity(activity);
        session.save(commentEntity);*/

        transaction.commit();
        session.close();
    }
}
