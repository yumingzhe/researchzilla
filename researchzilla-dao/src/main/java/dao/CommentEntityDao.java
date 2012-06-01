package dao;

import pojo.CommentEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 8:56 PM
 */
public interface CommentEntityDao {
    public Serializable saveCommentEntity(CommentEntity commentEntity);

    public void deleteCommentEntityById(int id);

    public CommentEntity getCommentEntityById(int id);
}
