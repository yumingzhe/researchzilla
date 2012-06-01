package service;

import pojo.CommentEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 8:59 PM
 */
public interface CommentEntityService {
    public Serializable saveCommentEntity(CommentEntity commentEntity);

    public void deleteCommentEntityById(int id);

    public CommentEntity getCommentEntityById(int id);
}
