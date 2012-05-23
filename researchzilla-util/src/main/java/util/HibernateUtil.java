package util;

/**.
 * User: wangyan
 * Date: 12-5-22
 * Time: 下午4:35
 */
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static SessionFactory factory = null;
    static{
        try {
            Configuration config = new Configuration().configure();
            factory = config.buildSessionFactory();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static SessionFactory getSessionFactory(){
        return factory;
    }
    public static Session getSession(){
        return factory.openSession();
    }
    public static void closeSession(Session session){
        if(session !=null){
            if(session.isOpen()){
                session.close();
            }
        }
    }
}
