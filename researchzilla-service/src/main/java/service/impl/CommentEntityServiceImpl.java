package service.impl;

import dao.CommentEntityDao;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;
import pojo.CommentEntity;
import service.CommentEntityService;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 9:01 PM
 */
public class CommentEntityServiceImpl implements CommentEntityService {
    private CommentEntityDao commentEntityDao;

    public CommentEntityDao getCommentEntityDao() {
        return commentEntityDao;
    }

    public void setCommentEntityDao(CommentEntityDao commentEntityDao) {
        this.commentEntityDao = commentEntityDao;
    }

    @Override
    public Serializable saveCommentEntity(CommentEntity commentEntity) {
        return commentEntityDao.saveCommentEntity(commentEntity);
    }

    @Override
    public void deleteCommentEntityById(int id) {
        this.commentEntityDao.deleteCommentEntityById(id);
    }

    @Override
    public CommentEntity getCommentEntityById(int id) {
        return this.commentEntityDao.getCommentEntityById(id);
    }
}
