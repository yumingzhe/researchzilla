package service;

import pojo.UserEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 6/7/12
 * Time: 9:49 AM
 */
public interface UserEntityService {
    public void updateUserEntity(UserEntity userEntity);

    public Serializable saveUserEntity(UserEntity userEntity);
}
