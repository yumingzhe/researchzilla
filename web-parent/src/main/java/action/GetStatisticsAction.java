package action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import pojo.SiteUser;
import service.MessageService;
import service.PictureNewsService;
import service.SiteUserService;

import javax.servlet.http.HttpServletRequest;

/**
 * User: wangyan
 * Date: 12-6-2
 * Time: 上午10:09
 */
public class GetStatisticsAction extends ActionSupport {

    private SiteUserService siteUserService;

    private MessageService messageService;

    private PictureNewsService pictureNewsService;

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

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        int usercount=siteUserService.getSiteUserTotalCount();
        int internalnoticecount=messageService.getInternalNoticeTotalCount();
        int publicnoticecount=messageService.getPublicNoticeTotalCount();
        int newscount=messageService.getNewsTotalCount();
        int picturenewscount=pictureNewsService.getPictureMessageTotalCount();
        int accomplishmentcount=pictureNewsService.getAccomplishmentTotalCount();
        request.setAttribute("usercount",usercount);
        request.setAttribute("internalnoticecount",internalnoticecount);
        request.setAttribute("publicnoticecount",publicnoticecount);
        request.setAttribute("newscount",newscount);
        request.setAttribute("picturenewscount",picturenewscount);
        request.setAttribute("accomplishmentcount",accomplishmentcount);
        return SUCCESS;
    }
}
