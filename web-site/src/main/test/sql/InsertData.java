package sql;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 4:15 PM
 */


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import pojo.Activity;
import pojo.Blog;

import java.util.List;

/**
 * This class is used for inserting data
 */
public class InsertData {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        Activity activity = (Activity) session.get(Activity.class, 3);

        String type = activity.getObjectType();
        Blog blog = null;
        if (type.equals("blog")) {
            Query query = session.createQuery("from Blog as b where b.id= :id").setInteger("id", activity.getObjectId());
            List<Blog> blogs = query.list();
            blog = blogs.get(0);
        }
        System.out.println(blog.getTitle());
        transaction.commit();
        session.close();
    }
}
