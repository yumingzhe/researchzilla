package pojo;

import java.sql.Timestamp;

/**
 * User: yumingzhe
 * Date: 5/23/12
 * Time: 4:42 PM
 */
public class Activity {
    private int id;
    private String activityType;
    private Timestamp activityOccurTime;
    private int subjectId;
    private int objectId;
    private String objectType;
    private SiteUser siteUser;

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

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public Timestamp getActivityOccurTime() {
        return activityOccurTime;
    }

    public void setActivityOccurTime(Timestamp activityOccurTime) {
        this.activityOccurTime = activityOccurTime;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public int getObjectId() {
        return objectId;
    }

    public void setObjectId(int objectId) {
        this.objectId = objectId;
    }

    public String getObjectType() {
        return objectType;
    }

    public void setObjectType(String objectType) {
        this.objectType = objectType;
    }
}
