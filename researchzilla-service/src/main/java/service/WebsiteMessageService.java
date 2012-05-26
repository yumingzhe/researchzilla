package service;

import pojo.WebsiteMessage;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:48
 */
public interface WebsiteMessageService {
    public void updateWebsiteMessage(WebsiteMessage websiteMessage);

    public void updateWebsiteVisits(int count);

    public WebsiteMessage getWebsiteMessage();

}
