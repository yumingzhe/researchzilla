package dao;

import pojo.Message;
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

    public int getPictureNewsTotalCount();

    public int getPictureNewsTotalPage(int pageSize);

    public int getAccomplishmentTotalCount();

    public int getAccomplishmentTotalPage(int pageSize);

    public List<PictureNews> getPictureNews(final int pageSize, final int currentPage);

    public List<PictureNews> getAccomplishment(final int pageSize, final int currentPage);

    public List<PictureNews> getAllPictureNews();

    public PictureNews getOnePictureNewsByID(int id);

    public List<PictureNews> getAllAccomplishment();

    public PictureNews getOneAccomplishmentByID(int id);

    public List<PictureNews> getAllPictureMessages();

    public PictureNews getOnePictureMessageByID(int id);

}
