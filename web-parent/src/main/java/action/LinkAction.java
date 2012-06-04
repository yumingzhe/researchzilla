package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.Link;
import service.LinkService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: wangyan
 * Date: 12-5-30
 * Time: 下午2:41
 */
public class LinkAction extends ActionSupport {
    private String title;
    private String url;

    private String linkid;
    private LinkService linkService;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getLinkid() {
        return linkid;
    }

    public void setLinkid(String linkid) {
        this.linkid = linkid;
    }

    public LinkService getLinkService() {
        return linkService;
    }

    public void setLinkService(LinkService linkService) {
        this.linkService = linkService;
    }

    @Override
    public void validate() {
        if (this.title == null)
            this.addFieldError(title, "you must set a title");
        if (this.url == null)
            this.addFieldError(url, "you must set a url");
    }

    @Override
    public String execute() throws Exception {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            request.setCharacterEncoding("utf-8");
            Link link=new Link();
            link.setWebsitename(title);
            link.setWebsiteurl(url);
            linkService.saveLink(link);
            return SUCCESS;
    }

    public String deleteonelink() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        request.setCharacterEncoding("utf-8");
        int id =Integer.parseInt(linkid);
        linkService.deleteLinkById(id);
        return "deleteone";
    }
}
