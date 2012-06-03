package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.FileService;
import service.SiteUserService;

import java.io.File;
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
    private int groupId;
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

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
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
        fileEntity.setFile(file);
        fileEntity.setSiteUser(siteUser);
        fileService.saveFile(fileEntity);
        //TODO ADD ACTIVITY
        return SUCCESS;
    }
}
