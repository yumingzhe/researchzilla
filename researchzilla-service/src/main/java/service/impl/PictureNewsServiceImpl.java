package service.impl;

import dao.PictureNewsDao;
import pojo.PictureNews;
import service.PictureNewsService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:52
 */
public class PictureNewsServiceImpl implements PictureNewsService {
    private PictureNewsDao pictureNewsDao;

    public PictureNewsDao getPictureNewsDao() {
        return pictureNewsDao;
    }

    public void setPictureNewsDao(PictureNewsDao pictureNewsDao) {
        this.pictureNewsDao = pictureNewsDao;
    }

    @Override
    public Serializable savePictureNews(PictureNews pictureNews) {
        return pictureNewsDao.savePictureNews(pictureNews);
    }

    @Override
    public void updatePictureNews(PictureNews pictureNews) {
        pictureNewsDao.updatePictureNews(pictureNews);
    }

    @Override
    public void deletePictureNews(int id) {
       pictureNewsDao.deletePictureNewsById(id);
    }

    @Override
    public int getPictureNewsTotalCount() {
        return pictureNewsDao.getPictureNewsTotalCount();
    }

    @Override
    public int getPictureNewsTotalPage(int pageSize) {
        return pictureNewsDao.getPictureNewsTotalPage(pageSize);
    }

    @Override
    public int getAccomplishmentTotalCount() {
        return pictureNewsDao.getAccomplishmentTotalCount();
    }

    @Override
    public int getAccomplishmentTotalPage(int pageSize) {
        return pictureNewsDao.getAccomplishmentTotalPage(pageSize);
    }

    @Override
    public List<PictureNews> getPictureNews(int pageSize, int currentPage) {
        return pictureNewsDao.getPictureNews(pageSize,currentPage);
    }

    @Override
    public List<PictureNews> getAccomplishment(int pageSize, int currentPage) {
        return pictureNewsDao.getAccomplishment(pageSize,currentPage);
    }

    @Override
    public List<PictureNews> getAllPictureNews() {
        return pictureNewsDao.getAllPictureNews();
    }

    @Override
    public PictureNews getOnePictureNewsByID(int id) {
        return pictureNewsDao.getOnePictureNewsByID(id);
    }

    @Override
    public List<PictureNews> getAllAccomplishment() {
        return pictureNewsDao.getAllAccomplishment();
    }

    @Override
    public PictureNews getOneAccomplishmentByID(int id) {
        return pictureNewsDao.getOneAccomplishmentByID(id);
    }

    @Override
    public List<PictureNews> getAllPictureMessages() {
        return pictureNewsDao.getAllPictureMessages();
    }

    @Override
    public PictureNews getOnePictureMessageByID(int id) {
        return pictureNewsDao.getOnePictureMessageByID(id);
    }
}
