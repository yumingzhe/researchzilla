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

    public int getPictureMessageTotalCount();

    public int getPictureMessageTotalPage(int pageSize);

    public List<PictureNews> getPictureMessage(final int pageSize, final int currentPage);

    public PictureNews getOnePictureMessageByID(int id);

    public List<PictureNews> getThreePicture();

    public List<PictureNews> getFiveAccomplishment();

}
