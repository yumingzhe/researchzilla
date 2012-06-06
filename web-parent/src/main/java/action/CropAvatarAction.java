package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.SiteUserService;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Iterator;

/**
 * Created with Inte
 * Date: 6/6/12
 * Time: 10:13 AM
 */
public class CropAvatarAction extends ActionSupport {
    private String x1;
    private String y1;
    private String width;
    private String height;
    private String picturepath;
    private String picturename;
    private SiteUserService siteUserService;

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public String getPicturename() {
        return picturename;
    }

    public void setPicturename(String picturename) {
        this.picturename = picturename;
    }

    public String getPicturepath() {
        return picturepath;
    }

    public void setPicturepath(String picturepath) {
        this.picturepath = picturepath;
    }

    public String getX1() {
        return x1;
    }

    public void setX1(String x1) {
        this.x1 = x1;
    }

    public String getY1() {
        return y1;
    }

    public void setY1(String y1) {
        this.y1 = y1;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    @Override
    public String execute() throws Exception {
        FileInputStream fileInputStream = null;
        ImageInputStream imageInputStream = null;
        try {
            fileInputStream = new FileInputStream(this.picturepath + this.picturename);
            Iterator iterator = ImageIO.getImageReadersByFormatName("jpg");
            ImageReader imageReader = (ImageReader) iterator.next();
            imageInputStream = ImageIO.createImageInputStream(fileInputStream);
            imageReader.setInput(imageInputStream, true);
            ImageReadParam param = imageReader.getDefaultReadParam();
            Rectangle rect = new Rectangle(Math.round(Float.parseFloat(x1)), Math.round(Float.parseFloat(y1)), Math.round(Float.parseFloat(width)), Math.round(Float.parseFloat(height)));
            param.setSourceRegion(rect);
            BufferedImage bi = imageReader.read(0, param);
            SiteUser siteUser = (SiteUser) ServletActionContext.getRequest().getSession().getAttribute("user");
            Integer picname = siteUser.getUid();
            ImageIO.write(bi, "jpg", new File("/home/yumingzhe/Openshift/researchzilla/web-site/target/researchzilla/avatarTmp/" + picname + ".jpg"));
            imageInputStream.close();
            fileInputStream.close();
            siteUser.setPortrait("/avatarTmp/" + picname + ".jpg");
            siteUserService.updateSiteUser(siteUser);
            ServletActionContext.getRequest().getSession().setAttribute("user", siteUser);
            File file = new File(this.picturepath + this.picturename);
            file.delete();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }
}
