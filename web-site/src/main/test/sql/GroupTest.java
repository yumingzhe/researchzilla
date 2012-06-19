package sql;

import com.google.gson.Gson;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Criterion;
import pojo.*;
import service.CommentEntityService;
import service.impl.CommentEntityServiceImpl;

import java.util.HashSet;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/27/12
 * Time: 5:43 PM
 */
public class GroupTest {
    public static void main(String[] args) {
        /* SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        Blog blog = (Blog) session.get(Blog.class, 1);
        CommentEntity commentEntity = blog.getCommentEntities().iterator().next();
        blog.getCommentEntities().remove(commentEntity);
        commentEntity.setBlog(null);
        Activity activity = commentEntity.getActivity();
        //activity.setCommentEntity(null);

        //commentEntity.setActivity(null);
        activity.setBlog(null);
        //blog.setActivity(null);
        session.delete(activity);
        session.delete(commentEntity);
        *//*session.delete(activity);*//*
        session.save(blog);
        transaction.commit();
        session.close();*/
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        SiteUser siteUser = new SiteUser();
        siteUser.setUsername("zhangpeng");
        siteUser.setEmail("zhangpeng@live.cn");
        siteUser.setActive(true);
        siteUser.setBanned(true);
        siteUser.setAdmin(false);
        siteUser.setUsertype("professior");
        siteUser.setPassword("ljejea");
        siteUser.setSalt("alsjfe");
        siteUser.setInstituteId("234");
        UserEntity userEntity = new UserEntity();
        userEntity.setUid(2);
        siteUser.setUserEntity(userEntity);
        userEntity.setSiteUser(siteUser);
        session.save(userEntity);
        transaction.commit();
        session.clear();
    }
}
