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
import pojo.SiteUser;
import pojo.UserEntity;

/**
 * This class is used for inserting data
 */
public class InsertData {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        SiteUser siteUser = new SiteUser();
        siteUser.setUsername("ymz");

        siteUser.setEmail("ymz@live.cn");
        siteUser.setActive(true);
        siteUser.setBanned(false);
        siteUser.setInstituteId("08010516318");

        UserEntity userEntity = new UserEntity();
        userEntity.setAge(20);
        userEntity.setCountry("china");
        userEntity.setGender('m');


        siteUser.setUserEntity(userEntity);
        userEntity.setSiteUser(siteUser);

        session.save(siteUser);
        transaction.commit();
        session.close();


    }
}
