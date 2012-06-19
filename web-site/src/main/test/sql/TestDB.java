package sql;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import pojo.Activity;
import pojo.Blog;
import pojo.CommentEntity;
import pojo.SiteUser;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 9:32 AM
 */
public class TestDB {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        /* Activity activity = (Activity) session.get(Activity.class, 1);
   SiteUser siteUser = activity.getSiteUser();
   Blog blog = activity.getBlog();
   if (blog != null) {
       System.out.println("blog title: " + blog.getTitle() + " blog content:" + blog.getContent());
   }
   System.out.println(siteUser.getUsername() + " " + siteUser.getEmail());*/
        /*SiteUser siteUser = (SiteUser) session.get(SiteUser.class, 1);
        CommentEntity commentEntity = new CommentEntity();
        commentEntity.setContent("this is a comment test");
        commentEntity.setPostTime(new Timestamp(new Date().getTime()));
        commentEntity.setSiteUser(siteUser);
        Blog blog = (Blog) session.get(Blog.class, 1);
        commentEntity.setBlog(blog);
        Set<CommentEntity> commentEntities = blog.getCommentEntities();
        if (commentEntities == null)
            commentEntities = new HashSet<CommentEntity>();
        commentEntities.add(commentEntity);

        Activity activity = new Activity();
        activity.setAction("post comment");
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setSiteUser(siteUser);
        activity.setCommentEntity(commentEntity);
        commentEntity.setActivity(activity);

        session.save(commentEntity);*/

        /* Blog blog = (Blog) session.get(Blog.class, 1);
                CommentEntity commentEntity = (CommentEntity) session.get(CommentEntity.class, 8);
                blog.getCommentEntities().remove(commentEntity);
                System.out.println(blog.getActivity().getId());
                String sql = "delete from researchzilla_activity where id=" + blog.getActivity().getId();
                System.out.println(sql);
                session.createSQLQuery(sql).executeUpdate();

                session.delete(commentEntity);
        */
        /*session.delete(commentEntity);*/

        String str = "国际在线专稿：据韩联社5月1日消息，瑞士洛桑国际管理学院（IMD）日前发布了《世界竞争力年鉴2012》，在被调查的59个国家和地区中，中国香港排在第一位，美国、瑞士、新加坡和瑞典分列2－5位，中国排名第23。\n" +
                "\n" +
                "　　中国香港在2011年的世界竞争力评估上与美国并列第一，今年则更将美国比下去。除韩国与去年持平，维持在第22位不变以外，亚洲其他几个主要国家和地区的排名均出现下滑，中国由去年的第19位下降到第23位，日本由去年的第26位下降一个名次到第27位，台湾地区也下降一个名次，由第6降至第7。\n" +
                "\n" +
                "　　遭遇欧洲财政危机的西班牙（35→39）和希腊（56→58）排名也出现下滑，但爱尔兰（24→20）和意大利（42→40）却有所上升。\n" +
                "\n" +
                "　　IMD曾在全球最佳商学院评选中名列第三，其从1989年开始每年发表全球竞争力报告，根据主要国家和地区的官方统计（占2／3），和针对私人企业界进行的问卷调查（占1／3）评估名次，全球竞争力排名主要根据4项评审指标考量：政府效能、企业效能、经济表现和基础建设。";
        System.out.print(str.length());
        transaction.commit();
        session.close();
    }
}
