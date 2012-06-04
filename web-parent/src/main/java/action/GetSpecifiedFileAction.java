package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.File;
import service.FileService;

import javax.servlet.http.HttpServletRequest;

/**
 * User: yumingzhe
 * Date: 6/3/12
 * Time: 3:31 PM
 */
public class GetSpecifiedFileAction extends ActionSupport {
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
        File file = fileService.getFileById(Integer.parseInt(fileid));
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("specifiedfile", file);
        return SUCCESS;
    }
}
