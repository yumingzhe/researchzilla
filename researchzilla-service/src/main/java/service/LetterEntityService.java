package service;

import pojo.LetterEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 3:10 PM
 */
public interface LetterEntityService {
    public Serializable saveLetterEntity(LetterEntity letterEntity);

    public int getUnreadLetterNumberByUID(int uid);
}
