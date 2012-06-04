package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.CommentEntity;
import pojo.File;
import service.ActivityService;
import service.CommentEntityService;
import service.FileService;

import java.util.Iterator;
import java.util.Set;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 5:54 PM
 */
public class DeleteFileAction extends ActionSupport {
    private String fileid;
    private FileService fileService;
    private CommentEntityService commentEntityService;
    private ActivityService activityService;
    private String uid;

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
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

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid;
    }

    public FileService getFileService() {
        return fileService;
    }

    public void setFileService(FileService fileService) {
        this.fileService = fileService;
    }

    @Override
    public String execute() throws Exception {
        File fileEntity = fileService.getFileById(Integer.parseInt(fileid));
        Set<CommentEntity> commentEntities = fileEntity.getCommentEntities();
        Iterator iterator = commentEntities.iterator();
        while (iterator.hasNext()) {
            CommentEntity commentEntity = (CommentEntity) iterator.next();
            String sql = "delete from Activity where commentId=" + commentEntity.getId();
            activityService.executeSQL(sql);
        }
        String sql = "delete from Activity where fileId=" + fileEntity.getId();
        activityService.executeSQL(sql);
        fileEntity.setSiteUser(null);
        java.io.File file = new java.io.File(fileEntity.getFile());
        if (file.delete()) {
            fileService.deleteFile(fileEntity);
            return SUCCESS;
        } else
            return INPUT;
    }
}
