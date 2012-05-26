package pojo;

import java.sql.Timestamp;

/**
 * User: yumingzhe
 * Date: 5/23/12
 * Time: 4:42 PM
 */
public class Activity {
    private int id;
    private Timestamp activityOccurTime;
    private SiteUser siteUser;
    private Blog blog;
    private CommentEntity commentEntity;

    public CommentEntity getCommentEntity() {
        return commentEntity;
    }

    public void setCommentEntity(CommentEntity commentEntity) {
        this.commentEntity = commentEntity;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public SiteUser getSiteUser() {
        return siteUser;
    }

    public void setSiteUser(SiteUser siteUser) {
        this.siteUser = siteUser;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getActivityOccurTime() {
        return activityOccurTime;
    }

    public void setActivityOccurTime(Timestamp activityOccurTime) {
        this.activityOccurTime = activityOccurTime;
    }
}
