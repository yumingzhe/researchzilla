package service.impl;

import dao.LinkDao;
import pojo.Link;
import service.LinkService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:23
 */
public class LinkServiceImpl implements LinkService {
    private LinkDao linkDao;

    public LinkDao getLinkDao() {
        return linkDao;
    }

    public void setLinkDao(LinkDao linkDao) {
        this.linkDao = linkDao;
    }

    @Override
    public Serializable saveLink(Link link) {
        return this.linkDao.saveLink(link);
    }

    @Override
    public void updateLink(Link link) {
        this.linkDao.updateLink(link);
    }

    @Override
    public void deleteLinkById(int id) {
        this.linkDao.deleteLinkById(id);
    }

    @Override
    public List<Link> getAllLink() {
        return this.linkDao.getAllLink();
    }
}
