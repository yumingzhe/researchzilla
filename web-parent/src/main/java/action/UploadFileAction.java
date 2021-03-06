package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Activity;
import pojo.Group;
import pojo.SiteUser;
import service.ActivityService;
import service.FileService;
import service.GroupService;
import service.SiteUserService;

import java.io.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 5/26/12
 * Time: 9:46 PM
 */
public class UploadFileAction extends ActionSupport {
    private String groupId;
    private String uid;
    private File file;
    private String fileFileName;
    private String fileContentType;
    private String description;
    private Timestamp uploadTime;
    private String tag;
    private String access;
    private FileService fileService;
    private SiteUserService siteUserService;
    private ActivityService activityService;
    private GroupService groupService;

    public GroupService getGroupService() {
        return groupService;
    }

    public void setGroupService(GroupService groupService) {
        this.groupService = groupService;
    }

    public ActivityService getActivityService() {
        return activityService;
    }

    public void setActivityService(ActivityService activityService) {
        this.activityService = activityService;
    }

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public FileService getFileService() {
        return fileService;
    }

    public void setFileService(FileService fileService) {
        this.fileService = fileService;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getGroupId() {
        return groupId;
    }

    public void setGroupId(String groupId) {
        this.groupId = groupId;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
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

    @Override
    public void validate() {
        if (this.file.canExecute()) {
            this.addFieldError("file", "Execute File is not allowed to upload to this site");
        }
        String size = (String) ServletActionContext.getContext().getApplication().get("filesize");
        if (size == null) {//by default, site will allow user to upload at most 5M file.
            size = "5";
        }
        int allowedFileSize = Integer.parseInt(size);
        if (this.file.length() > allowedFileSize * 1024 * 1024) {
            this.addFieldError("file", "You can not allowed to upload more than" + allowedFileSize + "M file to this site");
        }
        List<String> types = (List<String>) ServletActionContext.getContext().getApplication().get("allowedFileType");
        if (types == null) {
            types = new ArrayList<String>();
            types.add("application/octet-stream");
            types.add("application/msword");//.doc
            types.add("xml");
            types.add("ppt");
            types.add("text/plain");//.txt
            types.add("application/x-rar");//.rar
            types.add("application/zip");//.zip
            types.add("png");
            types.add("jpeg");
        }
        boolean allowUpload = false;
        for (String allowedFileType : types) {
            if (allowedFileType.equals(fileContentType)) {
                allowUpload = true;
                break;
            }
        }
        if (!allowUpload) {
            this.addFieldError("file", "You are not allowed to upload " + fileContentType + " type file to this site");
        }
    }

    @Override
    public String execute() throws Exception {
        SiteUser siteUser = siteUserService.getSiteUserByUID(Integer.parseInt(uid));
        pojo.File fileEntity = new pojo.File();
        if (this.access.equals("1"))
            fileEntity.setAccess("private");
        if (this.access.equals("2"))
            fileEntity.setAccess("public");
        if (this.access.equals("3"))
            fileEntity.setAccess("group");
        fileEntity.setTag(tag);
        fileEntity.setDescription(description);
        fileEntity.setFileName(fileFileName);
        fileEntity.setUploadTime(new Timestamp(new Date().getTime()));
        fileEntity.setFileType(this.fileContentType);
        fileEntity.setSiteUser(siteUser);

        //upload file to 'uploadData' dir
        InputStream fileInputStream = new FileInputStream(file);
        String path = ServletActionContext.getRequest().getRealPath("/uploadData");

        File uploadFile = new File(path);
        uploadFile.mkdirs();
        uploadFile = new File(path, fileEntity.getFileName());

        OutputStream outputStream = new FileOutputStream(uploadFile);
        //set upload buffer
        byte[] buffer = new byte[1024 * 1024];
        int length;
        while ((length = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, length);
        }
        fileInputStream.close();
        outputStream.close();
        fileEntity.setFile(uploadFile.getAbsolutePath());

        //add upload activity
        Activity activity = new Activity();
        activity.setActivityOccurTime(new Timestamp(new Date().getTime()));
        activity.setAction("上传文件");
        activity.setSiteUser(siteUser);
        activity.setFile(fileEntity);
        if (groupId != null && !"null".equals(groupId)) {
            Group group = groupService.getSpecifiedGroupByGroupId(Integer.parseInt(groupId));
            activity.setGroup(group);
            fileEntity.setGroup(group);
            group.getFiles().add(fileEntity);
        }
        fileService.saveFile(fileEntity);
        activityService.saveActivity(activity);
        return SUCCESS;
    }
}
