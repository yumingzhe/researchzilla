package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.WebsiteMessage;
import service.MessageService;
import service.PictureNewsService;
import service.SiteUserService;
import service.WebsiteMessageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * User: wangyan
 * Date: 12-6-2
 * Time: 上午10:09
 */
public class GetStatisticsAction extends ActionSupport {

    private SiteUserService siteUserService;

    private MessageService messageService;

    private PictureNewsService pictureNewsService;

    private WebsiteMessageService websiteMessageService;

    public SiteUserService getSiteUserService() {
        return siteUserService;
    }

    public void setSiteUserService(SiteUserService siteUserService) {
        this.siteUserService = siteUserService;
    }

    public MessageService getMessageService() {
        return messageService;
    }

    public void setMessageService(MessageService messageService) {
        this.messageService = messageService;
    }

    public PictureNewsService getPictureNewsService() {
        return pictureNewsService;
    }

    public void setPictureNewsService(PictureNewsService pictureNewsService) {
        this.pictureNewsService = pictureNewsService;
    }

    public WebsiteMessageService getWebsiteMessageService() {
        return websiteMessageService;
    }

    public void setWebsiteMessageService(WebsiteMessageService websiteMessageService) {
        this.websiteMessageService = websiteMessageService;
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();
        int usercount=siteUserService.getSiteUserTotalCount();
        int visits=(Integer)session.getAttribute("visits");
        int internalnoticecount=messageService.getInternalNoticeTotalCount();
        int publicnoticecount=messageService.getPublicNoticeTotalCount();
        int newscount=messageService.getNewsTotalCount();
        int picturenewscount=pictureNewsService.getPictureMessageTotalCount();
        int accomplishmentcount=pictureNewsService.getAccomplishmentTotalCount();
        request.setAttribute("usercount",usercount);
        request.setAttribute("visits",visits);
        request.setAttribute("internalnoticecount",internalnoticecount);
        request.setAttribute("publicnoticecount",publicnoticecount);
        request.setAttribute("newscount",newscount);
        request.setAttribute("picturenewscount",picturenewscount);
        request.setAttribute("accomplishmentcount",accomplishmentcount);
        return SUCCESS;
    }
}
