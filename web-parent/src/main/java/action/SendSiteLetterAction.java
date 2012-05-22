package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.LetterEntity;
import pojo.SiteLetter;
import service.LetterEntityService;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/22/12
 * Time: 2:45 PM
 */

/**
 * This action is used for processing user send site letter
 */
public class SendSiteLetterAction extends ActionSupport {
    private int senderId;
    private String title;
    private String content;
    private int receiverId;
    private LetterEntityService letterEntityService;

    public LetterEntityService getLetterEntityService() {
        return letterEntityService;
    }

    public void setLetterEntityService(LetterEntityService letterEntityService) {
        this.letterEntityService = letterEntityService;
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

    public int getReceiverId() {
        return receiverId;
    }

    public void setReceiverId(int receiverId) {
        this.receiverId = receiverId;
    }

    @Override
    public void validate() {
        if (this.senderId < 0) {
            this.addFieldError("senderId", "sender id is invalid");
        }
        if (this.title == null) {
            this.addFieldError("title", "You must enter a valid title");
        }
        if (this.content == null) {
            this.addFieldError("content", "You must enter something");
        }
        if (this.receiverId < 0) {
            this.addFieldError("receiverId", "receiver id is invalid");
        }
    }

    @Override
    public String execute() throws Exception {
        LetterEntity letterEntity = new LetterEntity();
        letterEntity.setTitle(this.title);
        letterEntity.setContent(this.content);
        letterEntity.setSendTime(new Timestamp(new Date().getTime()));
        letterEntity.setSenderId(this.senderId);

        SiteLetter siteLetter = new SiteLetter();
        siteLetter.setRead(false);
        siteLetter.setReceiverId(this.receiverId);
        siteLetter.setLetterEntity(letterEntity);

        Set<SiteLetter> siteLetters = new HashSet<SiteLetter>();
        siteLetters.add(siteLetter);
        letterEntity.setSiteLetters(siteLetters);
        Serializable letterid = this.letterEntityService.saveLetterEntity(letterEntity);

        return SUCCESS;
    }
}
