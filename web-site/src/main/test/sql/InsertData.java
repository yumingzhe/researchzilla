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


/*       Message message = new Message();
       message.setType("internalnotice");
       message.setAuthor("王艳");
       message.setPublisher("administrator");
       message.setTopic("信息学院举行第三届亚沙会志愿者欢送会");
       message.setContent("根据“吴方数学新秀奖”评选办法规定，在个人申报和教授推荐的基础上，经学院团委审查、" +
               "“吴方数学新秀奖”评审委员会评审，确定数学与应用数学专业2008级孟凡钦同学为第一届“吴方数学新秀奖”获得者，现予以公示。");
       message.setPublishtime(new Timestamp(new Date().getTime()));

       session.save(message);*/
       WebsiteMessage websiteMessage=new WebsiteMessage();
        websiteMessage.setWebsitename("软件工程研究室");
        websiteMessage.setMaintenanceaddress("wangyan_megan@yeah.net");
        websiteMessage.setDefaultlanguage("Chinese");
        websiteMessage.setVisits(10);
        websiteMessage.setPath("./img/main_pic.jpg");
        session.save(websiteMessage);
        /*  Link link = new Link();

       link.setWebsitename("SCIRUS");
       link.setWebsiteurl("http://www.scirus.com/");
       session.save(link);
       Subject subject=new Subject();
        subject.setSubjecttopic("计算机科学与技术");
        subject.setResearchdirection("数据仓库");
        subject.setResearchmember("王艳 于明哲");
        subject.setStarttime("2012年3月");
        subject.setPrograss("40%");
        session.save(subject);*/
       transaction.commit();
       session.close();

    }
}
