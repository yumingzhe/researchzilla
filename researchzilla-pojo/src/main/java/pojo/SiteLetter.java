package pojo;

import java.sql.Timestamp;

/**
 * User: yumingzhe
 * Date: 5/20/12
 * Time: 11:06 AM
 */

/**
 * Class SiteLetter is used for user to query their letter
 */
public class SiteLetter {
    private int id;
    private int receiverId;
    private boolean read;
    private LetterEntity letterEntity;

    public LetterEntity getLetterEntity() {
        return letterEntity;
    }

    public void setLetterEntity(LetterEntity letterEntity) {
        this.letterEntity = letterEntity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    public boolean isRead() {
        return read;
    }

    public void setRead(boolean read) {
        this.read = read;
    }
}
