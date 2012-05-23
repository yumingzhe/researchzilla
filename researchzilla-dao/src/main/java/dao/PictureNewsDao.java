package dao;

import pojo.PictureNews;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午9:43
 */
public interface PictureNewsDao {
    public Serializable savePictureNews(PictureNews pictureNews);

    public void updatePictureNews(PictureNews pictureNews);

    public void deletePictureNewsById(int id);

    public List<PictureNews> getAllMessage();

}
