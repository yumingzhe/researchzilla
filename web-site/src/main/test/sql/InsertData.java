package sql;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import pojo.Student;

public class InsertData {
    public static void main(String[] args) {
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();

        Student student = new Student();
        student.setName("zhangsan");
        student.setPassword("123");
        student.setAge(20);
        student.setAddress("Beijing");

        session.save(student);
        transaction.commit();
        session.close();
    }
}
