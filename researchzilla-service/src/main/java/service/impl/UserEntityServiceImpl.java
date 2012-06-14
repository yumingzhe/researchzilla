package service.impl;

import dao.UserEntityDao;
import pojo.UserEntity;
import service.UserEntityService;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 6/7/12
 * Time: 9:50 AM
 */
public class UserEntityServiceImpl implements UserEntityService {
    private UserEntityDao userEntityDao;

    public UserEntityDao getUserEntityDao() {
        return userEntityDao;
    }

    public void setUserEntityDao(UserEntityDao userEntityDao) {
        this.userEntityDao = userEntityDao;
    }

    @Override
    public void updateUserEntity(UserEntity userEntity) {
        userEntityDao.updateUserEntity(userEntity);
    }

    @Override
    public Serializable saveUserEntity(UserEntity userEntity) {
        return userEntityDao.saveUserEntity(userEntity);
    }
}
