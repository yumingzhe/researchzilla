package dao;

import pojo.LetterEntity;

import java.io.Serializable;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 2:58 PM
 */
public interface LetterEntityDao {
    public Serializable saveLetterEntity(LetterEntity letterEntity);

    public int getUnreadLetterNumberByUID(int uid);
}
