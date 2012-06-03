package action;

import com.opensymphony.xwork2.ActionSupport;
import service.FileService;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 5:54 PM
 */
public class DeleteFileAction extends ActionSupport {
    private String fileid;
    private FileService fileService;

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
        return SUCCESS;
    }
}
