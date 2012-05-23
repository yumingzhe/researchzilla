package dao;

import pojo.WebsiteMessage;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:40
 */
public interface WebsiteMessageDao {

    public void updateWebsiteMessage(WebsiteMessage websiteMessage);

    public WebsiteMessage getWebsiteMessage();
}
