package dao.impl;

import dao.UserEntityDao;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.UserEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 6/7/12
 * Time: 9:44 AM
 */
public class UserEntityDaoImpl implements UserEntityDao {
    private HibernateTemplate template;
    private SessionFactory factory;

    public HibernateTemplate getTemplate() {
        if (template == null) {
            template = new HibernateTemplate(this.factory);
        }
        return template;
    }

    public void setTemplate(HibernateTemplate template) {
        this.template = template;
    }

    public SessionFactory getFactory() {
        return factory;
    }

    public void setFactory(SessionFactory factory) {
        this.factory = factory;
    }

    @Override
    public Serializable saveUserEntity(final UserEntity userEntity) {
        return this.getTemplate().save(userEntity);
    }

    @Override
    public void updateUserEntity(UserEntity userEntity) {
        this.getTemplate().update(userEntity);
    }
}
