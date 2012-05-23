package service;

import pojo.PictureNews;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:51
 */
public interface PictureNewsService {
    public Serializable savePictureNews(PictureNews pictureNews);

    public void updatePictureNews(PictureNews pictureNews);

    public void deletePictureNews(int id);

    public List<PictureNews> getAllPictureNews();

}
