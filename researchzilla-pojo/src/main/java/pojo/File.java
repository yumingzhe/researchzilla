package pojo;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 5/19/12
 * Time: 9:47 PM
 */
public class File implements Serializable {
    private Integer id;
    private String fileName;
    private String fileType;
    private String file;
    private Integer fileIconId;
    private String description;
    private Timestamp uploadTime;
    private SiteUser siteUser;
    private String tag;
    private String access;
    private Set<CommentEntity> commentEntities;
    private Group group;

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public String getFile() {
        return file;
    }

    public void setFile(String file) {
        this.file = file;
    }

    public Set<CommentEntity> getCommentEntities() {
        return commentEntities;
    }

    public void setCommentEntities(Set<CommentEntity> commentEntities) {
        this.commentEntities = commentEntities;
    }

    public Integer getFileIconId() {
        return fileIconId;
    }

    public void setFileIconId(Integer fileIconId) {
        this.fileIconId = fileIconId;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Timestamp getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Timestamp uploadTime) {
        this.uploadTime = uploadTime;
    }

    public SiteUser getSiteUser() {
        return siteUser;
    }

    public void setSiteUser(SiteUser siteUser) {
        this.siteUser = siteUser;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }
}
