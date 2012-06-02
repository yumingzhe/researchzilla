package service.impl;

import dao.FeedbackDao;
import pojo.Feedback;
import service.FeedbackService;

import java.io.Serializable;
import java.util.List;

/**
 * User: wangyan
 * Date: 12-5-23
 * Time: 上午10:34
 */
public class FeedbackServiceImpl  implements FeedbackService{
    private FeedbackDao feedbackDao;

    public FeedbackDao getFeedbackDao() {
        return feedbackDao;
    }

    public void setFeedbackDao(FeedbackDao feedbackDao) {
        this.feedbackDao = feedbackDao;
    }

    @Override
    public Serializable saveFeedback(Feedback feedback) {
        return feedbackDao.saveFeedback(feedback);
    }

    @Override
    public List<Feedback> getAllFeedback() {
        return feedbackDao.getAllFeedback();
    }

    @Override
    public int getFeedbackTotalCount() {
        return feedbackDao.getFeedbackTotalCount();
    }

    @Override
    public int getFeedbackTotalPage(int pageSize) {
        return feedbackDao.getFeedbackTotalPage(pageSize);
    }

    @Override
    public List<Feedback> getFeedback(int pageSize, int currentPage) {
        return feedbackDao.getFeedback(pageSize,currentPage);
    }

    @Override
    public Feedback getOneFeedbackByID(int id) {
        return feedbackDao.getOneFeedbackByID(id);
    }

    @Override
    public void deleteOneFeedbackByID(int id) {
        feedbackDao.deleteOneFeedbackByID(id);
    }
}
