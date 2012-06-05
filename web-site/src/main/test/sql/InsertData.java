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

        /* SiteUser siteUser = new SiteUser();
        siteUser.setUsername("yumingzhe");
        siteUser.setEmail("yumingzhe@live.cn");
        siteUser.setActive(true);
        siteUser.setBanned(false);
        siteUser.setInstituteId("123");
        siteUser.setPassword("lfjlinnnz");
        siteUser.setSalt("ljfinv");
        session.save(siteUser);

         SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
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


/*        Activity activity = (Activity) session.get(Activity.class, 2);
        CommentEntity commentEntity = activity.getCommentEntity();
        if (commentEntity != null) {
            Blog blog = commentEntity.getBlog();
            if (blog != null) {
                System.out.println("blog title: " + blog.getTitle() + " blog content: " + blog.getContent());
            }
        } else {
            System.out.print("i am here");
        } */


        /*   Message message = new Message();
       message.setType("publicnotice");
       message.setAuthor("王五");
       message.setPublisher("王艳");
       message.setTopic("publicnotice");
       message.setContent("wuyanzu will come here");
       message.setPublishtime(new Timestamp(new Date().getTime()));
       session.save(message);
       transaction.commit();
       session.close();
       WebsiteMessage websiteMessage=new WebsiteMessage();
        websiteMessage.setWebsitename("软件工程研究室");
        websiteMessage.setMaintenanceaddress("wangyan_megan@yeah.net");
        websiteMessage.setDefaultlanguage("Chinese");
        websiteMessage.setVisits(0);
        session.save(websiteMessage); */
     /*   Link link = new Link();

       link.setWebsitename("google学术搜索");
       link.setWebsiteurl("http://scholar.google.com/");
       session.save(link); */
        Subject subject=new Subject();
        subject.setSubjecttopic("计算机科学与技术");
        subject.setResearchdirection("人工智能的属性论方法");
        subject.setResearchmember("王艳 于明哲");
        subject.setStarttime("2012年3月");
        subject.setPrograss("40%");
        session.save(subject);
       transaction.commit();
       session.close();

    }
}
