package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.File;
import service.FileService;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * User: yumingzhe
 * Date: 6/2/12
 * Time: 10:30 PM
 */
public class GetUserAllFilesAction extends ActionSupport {
    private String uid;
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

    @Override
    public String execute() throws Exception {
        List<File> files = fileService.getUserAllFilesByUID(Integer.parseInt(uid));
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("files", files);
        return SUCCESS;
    }
}
