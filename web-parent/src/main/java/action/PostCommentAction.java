package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.*;
import service.BlogService;
import service.CommentEntityService;
import service.FileService;
import service.SiteUserService;

import java.sql.Timestamp;
import java.util.Date;

/**
 * User: yumingzhe
 * Date: 5/24/12
 * Time: 8:24 PM
 */
public class PostCommentAction extends ActionSupport {
    private String type;
    private String objectId;
    private String uid;
    private String content;
    private BlogService blogService;
    private FileService fileService;
    private SiteUserService siteUserService;
    private CommentEntityService commentEntityService;

    public CommentEntityService getCommentEntityService() {
        return commentEntityService;
    }

    public void setCommentEntityService(CommentEntityService commentEntityService) {
        this.commentEntityService = commentEntityService;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public FileService getFileService() {
        return fileService;
    }

    public void setFileService(FileService fileService) {
        this.fileService = fileService;
    }

    public BlogService getBlogService() {
        return blogService;
    }

    public void setBlogService(BlogService blogService) {
        this.blogService = blogService;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getObjectId() {
        return objectId;
    }

    public void setObjectId(String objectId) {
        this.objectId = objectId;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    @Override
    public String execute() throws Exception {
        if (this.type.equals("blog")) {
            Blog blog = blogService.getBlogById(Integer.parseInt(objectId));
            CommentEntity commentEntity = new CommentEntity();
            commentEntity.setPostTime(new Timestamp(new Date().getTime()));

            SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
            commentEntity.setSiteUser(siteUser);
            commentEntity.setContent(this.content);
            commentEntity.setBlog(blog);

            Activity activity = new Activity();
            activity.setBlog(blog);
            activity.setSiteUser(siteUser);
            activity.setCommentEntity(commentEntity);

            commentEntity.setActivity(activity);
            commentEntityService.saveCommentEntity(commentEntity);
            return SUCCESS;
        } else if (this.type.equals("file")) {
            File file = fileService.getFileById(Integer.parseInt(objectId));
            CommentEntity commentEntity = new CommentEntity();
            commentEntity.setPostTime(new Timestamp(new Date().getTime()));

            SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
            commentEntity.setSiteUser(siteUser);
            commentEntity.setContent(this.content);
            commentEntity.setFile(file);

            Activity activity = new Activity();
            activity.setSiteUser(siteUser);
            activity.setCommentEntity(commentEntity);
            activity.setActivityOccurTime(new Timestamp(new Date().getTime()));

            commentEntity.setActivity(activity);
            commentEntityService.saveCommentEntity(commentEntity);
            return SUCCESS;
        } else return INPUT;
    }
}