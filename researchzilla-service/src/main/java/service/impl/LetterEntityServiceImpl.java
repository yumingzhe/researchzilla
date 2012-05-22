package service.impl;

import dao.LetterEntityDao;
import pojo.LetterEntity;
import service.LetterEntityService;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 3:11 PM
 */
public class LetterEntityServiceImpl implements LetterEntityService {
    private LetterEntityDao letterEntityDao;

    public LetterEntityDao getLetterEntityDao() {
        return letterEntityDao;
    }

    public void setLetterEntityDao(LetterEntityDao letterEntityDao) {
        this.letterEntityDao = letterEntityDao;
    }

    @Override
    public Serializable saveLetterEntity(LetterEntity letterEntity) {
        return this.letterEntityDao.saveLetterEntity(letterEntity);
    }

    @Override
    public int getUnreadLetterNumberByUID(int uid) {
        return this.letterEntityDao.getUnreadLetterNumberByUID(uid);
    }
}
