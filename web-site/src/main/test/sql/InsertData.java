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

        Activity activity = (Activity) session.get(Activity.class, 3);

        UserEntity userEntity = new UserEntity();
        userEntity.setAge(20);
        userEntity.setCountry("china");
        userEntity.setGender('m');

        SiteUser user = new SiteUser();
        user.setUsername("zhangsan");
        user.setActive(true);
        user.setBanned(false);
        user.setInstituteId("123");
        user.setEmail("zhangsan@live.cn");

        Register register = new Register();
        register.setRegisterSequence("this is register sequence");
        register.setRegisterTime(new Timestamp(new Date().getTime()));

        user.setRegister(register);
        register.setSiteUser(user);
        session.save(user);

        transaction.commit();
        session.close();
        Message message = new Message();
        message.setType("announcement");
        message.setAuthor("zhangsan");
        message.setPublisher("wangyan");
        message.setTopic("announcement");
        message.setContent("wuyanzu will come here");
        message.setPublishtime(new Timestamp(new Date().getTime()));
        session.save(message);
        transaction.commit();
        session.close();
    }
}
