package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import service.FileService;

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
    private File file;
    private String fileName;
    private String fileType;
    private String description;
    private Timestamp uploadTime;
    private String tag;
    private String access;
    private FileService fileService;

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
        if (this.file.length() > allowedFileSize) {
            this.addFieldError("file", "You can not allowed to upload more than" + allowedFileSize + "M file to this site");
        }

        List<String> types = (List<String>) ServletActionContext.getContext().getApplication().get("allowedFileType");
        if (types == null) {
            types = new ArrayList<String>();
            types.add("doc");
            types.add("xml");
            types.add("ppt");
            types.add("txt");
            types.add("rar");
            types.add("zip");
            types.add("png");
            types.add("jpeg");
        }
        boolean allowUpload = false;
        for (String allowedFileType : types) {
            if (allowedFileType.equals(fileType)) {
                allowUpload = true;
                break;
            }
        }
        if (!allowUpload) {
            this.addFieldError("file", "You are not allowed to upload " + fileType + " type file to this site");
        }
    }

    @Override
    public String execute() throws Exception {
        pojo.File fileEntity = new pojo.File();
        fileEntity.setAccess(access);
        fileEntity.setTag(tag);
        fileEntity.setDescription(description);
        fileEntity.setFileName(fileName);
        fileEntity.setUploadTime(new Timestamp(new Date().getTime()));
        fileEntity.setFile(file);
        fileService.saveFile(fileEntity);
        //TODO ADD ACTIVITY
        return SUCCESS;
    }
}