package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.Activity;
import pojo.CommentEntity;
import service.ActivityService;
import service.CommentEntityService;

/**
 * User: yumingzhe
 * Date: 5/30/12
 * Time: 8:59 PM
 */
public class DeleteCommentAction extends ActionSupport {
    private String commentid;
    private String type;
    private String blogid;
    private String fileid;
    private CommentEntityService commentEntityService;
    private ActivityService activityService;

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBlogid() {
        return blogid;
    }

    public void setBlogid(String blogid) {
        this.blogid = blogid;
    }

    public ActivityService getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public CommentEntityService getCommentEntityService() {
        return commentEntityService;
    }

    public void setCommentEntityService(CommentEntityService commentEntityService) {
        this.commentEntityService = commentEntityService;
    }

    public String getCommentid() {
        return commentid;
    }

    public void setCommentid(String commentid) {
        this.commentid = commentid;
    }

    @Override
    public String execute() throws Exception {

        CommentEntity commentEntity = commentEntityService.getCommentEntityById(Integer.parseInt(commentid));
        String sql = "delete from Activity where commentId=" + commentEntity.getId();
        activityService.executeSQL(sql);
        commentEntityService.deleteCommentEntityById(Integer.parseInt(commentid));

        if (this.type.equals("blog")) {
            return "blog";
        }
        if (this.type.equals("file")) {
            return "file";
        }
        return INPUT;
    }
}
