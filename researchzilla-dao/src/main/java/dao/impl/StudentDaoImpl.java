package dao.impl;

import dao.StudentDao;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.Student;

import java.util.List;

public class StudentDaoImpl implements StudentDao {
    private SessionFactory factory;
    private HibernateTemplate template;

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

    public HibernateTemplate getTemplate() {
        if (this.template == null)
            template = new HibernateTemplate(factory);
        return template;
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    @Override
    public List<Student> getAllStudents() {
        return this.getTemplate().find("from Student");
    }
}
