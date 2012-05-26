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
import pojo.*;

import java.sql.Timestamp;
import java.util.Date;

/**
 * This class is used for inserting data
 */
public class InsertData {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        /* SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        Blog blog = new Blog();
        blog.setTitle("test ");
        blog.setContent("this is first blog");
        blog.setSiteUser(siteUser);

        Activity activity = new Activity();
        activity.setSiteUser(siteUser);
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setBlog(blog);

        blog.setActivity(activity);
        session.save(blog);*/

/*
        SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        Blog blog = (Blog) session.get(Blog.class, 1);

        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setBlog(blog);
        commentEntity.setSiteUser(siteUser);

        Activity activity = new Activity();
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setSiteUser(siteUser);
        activity.setCommentEntity(commentEntity);

        commentEntity.setActivity(activity);

        session.save(commentEntity);*/


        Activity activity = (Activity) session.get(Activity.class, 2);
        CommentEntity commentEntity = activity.getCommentEntity();
        if (commentEntity != null) {
            Blog blog = commentEntity.getBlog();
            if (blog != null) {
                System.out.println("blog title: " + blog.getTitle() + " blog content: " + blog.getContent());
            }
        } else {
            System.out.print("i am here");
        }


        transaction.commit();
        session.close();
    }
}
