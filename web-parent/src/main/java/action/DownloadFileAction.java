package action;

import com.opensymphony.xwork2.ActionSupport;
import pojo.File;
import service.FileService;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 7:37 PM
 */
public class DownloadFileAction extends ActionSupport {
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

    public InputStream getFile() {
        File fileEntity = fileService.getFileById(Integer.parseInt(fileid));
        FileInputStream fileInputStream = null;
        try {
            fileInputStream = new FileInputStream(fileEntity.getFile());
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return fileInputStream;
    }

    @Override
    public String execute() throws Exception {
        return SUCCESS;
    }
}
