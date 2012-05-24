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
        return this.pictureNewsDao.savePictureNews(pictureNews);
    }

    @Override
    public void updatePictureNews(PictureNews pictureNews) {
        this.pictureNewsDao.updatePictureNews(pictureNews);
    }

    @Override
    public void deletePictureNews(int id) {
       this.pictureNewsDao.deletePictureNewsById(id);
    }

    @Override
    public List<PictureNews> getAllPictureNews() {
        return this.pictureNewsDao.getAllPictureNews();
    }

    @Override
    public List<PictureNews> getAllAccomplishment() {
        return this.pictureNewsDao.getAllAccomplishment();
    }
}
