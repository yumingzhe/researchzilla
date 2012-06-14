package dao;

import pojo.UserEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 6/7/12
 * Time: 9:43 AM
 */
public interface UserEntityDao {
    public Serializable saveUserEntity(UserEntity userEntity);

    public void updateUserEntity(UserEntity userEntity);
}
