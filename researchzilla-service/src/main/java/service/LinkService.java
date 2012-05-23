package service;

import pojo.Link;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:22
 */
public interface LinkService {
    public Serializable saveLink(Link link);

    public void updateLink(Link link);

    public void deleteLinkById(int id);

    public List<Link> getAllLink();
}
