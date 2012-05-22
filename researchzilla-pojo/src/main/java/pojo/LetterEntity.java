package pojo;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 11:34 AM
 */

import java.sql.Timestamp;
import java.util.Set;

/**
 * Class LetterEntity is used for storing all internal site letters
 */
public class LetterEntity {
    private int id;
    private int senderId;
    private String title;
    private String content;
    private Timestamp sendTime;
    public Set<SiteLetter> getSiteLetters() {
        return siteLetters;
    }

    public void setSiteLetters(Set<SiteLetter> siteLetters) {
        this.siteLetters = siteLetters;
    }

    private Set<SiteLetter> siteLetters;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSenderId() {
        return senderId;
    }

    public void setSenderId(int senderId) {
        this.senderId = senderId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getSendTime() {
        return sendTime;
    }

    public void setSendTime(Timestamp sendTime) {
        this.sendTime = sendTime;
    }
}
