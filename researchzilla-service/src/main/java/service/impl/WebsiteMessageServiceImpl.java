package service.impl;

import dao.WebsiteMessageDao;
import pojo.WebsiteMessage;
import service.WebsiteMessageService;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:49
 */
public class WebsiteMessageServiceImpl implements WebsiteMessageService {
    private WebsiteMessageDao websiteMessageDao;

    public WebsiteMessageDao getWebsiteMessageDao() {
        return websiteMessageDao;
    }

    public void setWebsiteMessageDao(WebsiteMessageDao websiteMessageDao) {
        this.websiteMessageDao = websiteMessageDao;
    }

    @Override
    public void updateWebsiteMessage(WebsiteMessage websiteMessage) {
        this.getWebsiteMessageDao().updateWebsiteMessage(websiteMessage);
    }

    @Override
    public WebsiteMessage getWebsiteMessage() {
        return this.getWebsiteMessageDao().getWebsiteMessage();
    }
}
