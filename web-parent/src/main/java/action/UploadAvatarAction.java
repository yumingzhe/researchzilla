package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import java.io.*;

/**
 * User: yumingzhe
 * Date: 6/6/12
 * Time: 10:17 AM
 */
public class UploadAvatarAction extends ActionSupport {
    private String fileContentType;
    private File file;
    private String fileFileName;

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    @Override
    public String execute() throws Exception {
        InputStream fileInputStream = new FileInputStream(file);
        String path = ServletActionContext.getRequest().getRealPath("/avatarTmp");

        File uploadFile = new File(path);
        uploadFile.mkdirs();
        uploadFile = new File(path, this.fileFileName);

        OutputStream outputStream = new FileOutputStream(uploadFile);
        //set upload buffer
        byte[] buffer = new byte[1024 * 1024];
        int length;
        while ((length = fileInputStream.read(buffer)) > 0) {
            outputStream.write(buffer, 0, length);
        }
        fileInputStream.close();
        outputStream.close();
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("avatar", this.fileFileName);
        request.setAttribute("picpath", uploadFile.getAbsolutePath());
        return SUCCESS;
    }
}
